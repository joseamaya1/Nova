/**
 * The Forgotten Server - a free and open-source MMORPG server emulator
 * Copyright (C) 2015  Mark Samman <mark.samman@gmail.com>
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License along
 * with this program; if not, write to the Free Software Foundation, Inc.,
 * 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
 */

#include "otpch.h"

#include "protocol.h"
#include "scheduler.h"
#include "connection.h"
#include "outputmessage.h"
#include "rsa.h"

extern RSA g_RSA;

void Protocol::onSendMessage(OutputMessage_ptr msg)
{
	if (!m_rawMessages) {
		msg->writeMessageLength();

		if (m_encryptionEnabled) {
			XTEA_encrypt(*msg);
			msg->addCryptoHeader(m_checksumEnabled);
		}
	}

	if (msg == m_outputBuffer) {
		m_outputBuffer.reset();
	}
}

void Protocol::onRecvMessage(NetworkMessage& msg)
{
	if (m_encryptionEnabled && !XTEA_decrypt(msg)) {
		return;
	}

	parsePacket(msg);
}

OutputMessage_ptr Protocol::getOutputBuffer(int32_t size)
{
	if (m_outputBuffer && NetworkMessage::max_protocol_body_length >= m_outputBuffer->getLength() + size) {
		return m_outputBuffer;
	} else if (m_connection) {
		m_outputBuffer = OutputMessagePool::getInstance()->getOutputMessage(this);
		return m_outputBuffer;
	}
	return OutputMessage_ptr();
}

void Protocol::releaseProtocol()
{
	if (m_refCount > 0) {
		//Reschedule it and try again.
		g_scheduler.addEvent(createSchedulerTask(SCHEDULER_MINTICKS, std::bind(&Protocol::releaseProtocol, this)));
	} else {
		deleteProtocolTask();
	}
}

void Protocol::deleteProtocolTask()
{
	//dispather thread
	assert(m_refCount == 0);
	setConnection(Connection_ptr());

	delete this;
}

void Protocol::XTEA_encrypt(OutputMessage& msg) const
{
	const uint32_t delta = 0x61C88647;
	uint32_t k[4];
	k[0] = m_key[0]; k[1] = m_key[1]; k[2] = m_key[2]; k[3] = m_key[3];

	int32_t messageLength = msg.getLength();

	//add bytes until reach 8 multiple
	uint32_t n;
	if ((messageLength % 8) != 0){
		n = 8 - (messageLength % 8);
		msg.addPaddingBytes(n);
		messageLength = messageLength + n;
	}

	int read_pos = 0;
	uint32_t* buffer = reinterpret_cast<uint32_t*>(msg.getOutputBuffer());
	while (read_pos < messageLength / 4){
		uint32_t v0 = buffer[read_pos], v1 = buffer[read_pos + 1];
		uint32_t sum = 0;

		for (int32_t i = 0; i < 32; ++i) {
			v0 += ((v1 << 4 ^ v1 >> 5) + v1) ^ (sum + k[sum & 3]);
			sum -= delta;
			v1 += ((v0 << 4 ^ v0 >> 5) + v0) ^ (sum + k[sum >> 11 & 3]);
		}
		buffer[read_pos] = v0; buffer[read_pos + 1] = v1;
		read_pos = read_pos + 2;
	}
}

bool Protocol::XTEA_decrypt(NetworkMessage& msg) const
{
	if ((msg.getLength() - 2) % 8 != 0){
		std::cout << "Failure: [Protocol::XTEA_decrypt]. Not valid encrypted message size"
			<< std::endl;
		return false;
	}

	uint32_t k[4];
	k[0] = m_key[0]; k[1] = m_key[1]; k[2] = m_key[2]; k[3] = m_key[3];

	const uint32_t delta = 0x61C88647;

	uint32_t* buffer = reinterpret_cast<uint32_t*>(msg.getBuffer() + msg.getBufferPosition());

	int read_pos = 0;
	int32_t messageLength = msg.getLength();
	while (read_pos < messageLength / 4){
		uint32_t v0 = buffer[read_pos], v1 = buffer[read_pos + 1];
		uint32_t sum = 0xC6EF3720;

		for (int32_t i = 0; i<32; i++) {
			v1 -= ((v0 << 4 ^ v0 >> 5) + v0) ^ (sum + k[sum >> 11 & 3]);
			sum += delta;
			v0 -= ((v1 << 4 ^ v1 >> 5) + v1) ^ (sum + k[sum & 3]);
		}
		buffer[read_pos] = v0; buffer[read_pos + 1] = v1;
		read_pos = read_pos + 2;
	}

	int innerLength = msg.get<uint16_t>();
	if (innerLength > msg.getLength() - 4){
		std::cout << "Failure: [Protocol::XTEA_decrypt]. Not valid unencrypted message size"
			<< std::endl;
		return false;
	}

	msg.setLength(innerLength);
	return true;
}

bool Protocol::RSA_decrypt(NetworkMessage& msg)
{
	if (msg.getLength() - msg.getBufferPosition() != 128) {
		return false;
	}

	g_RSA.decrypt(reinterpret_cast<char*>(msg.getBuffer()) + msg.getBufferPosition());
	return msg.getByte() == 0;
}

uint32_t Protocol::getIP() const
{
	if (getConnection()) {
		return getConnection()->getIP();
	}

	return 0;
}
