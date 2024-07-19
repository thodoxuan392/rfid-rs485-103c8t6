/*
 * commandhandler.c
 *
 *  Created on: Jun 21, 2024
 *      Author: xuanthodo
 */

#include <App/commandhandler.h>

#include <stdio.h>
#include <Tp/rs485.h>
#include <Device/rfid.h>
#include <Device/dipswitch.h>

#define COMMANDHANDLER_RFID_485_NETWORK_ID	0x01	// RFID Network in RS485 is 0x01

#define COMMANDHANDLER_RFID_485_MASTER_NODE_ID 0xFF

#define COMMANDHANDLER_RFID_485_MESSAGE_ID_REQUEST_STATUS 0x01
#define COMMANDHANDLER_RFID_485_MESSAGE_ID_RESPONSE_STATUS 0x02
#define COMMANDHANDLER_RFID_485_MESSAGE_ID_REQUEST_UPDATE 0x03
#define COMMANDHANDLER_RFID_485_MESSAGE_ID_RESPONSE_UPDATE 0x04


/**
 * @defgroup Validation Function
 */
static bool COMMANDHANDLER_isRs485MessageValid(RS485_Message *message);


/**
 * @defgroup Handler Function
 */
static void COMMANDHANDLER_handleRequestRFIDStatus(RS485_Message *message);
static void COMMANDHANDLER_handleRequestRFIDUpdate(RS485_Message *message);

/**
 * @defgroup Response Function
 */
static void COMMANDHANDLER_sendRFIDStatusResponse(uint8_t nodeId, RFID_t *rfid);
static void COMMANDHANDLER_sendRFIDUpdateResponse(uint8_t nodeId, RFID_Error_t error);

static RS485_Message COMMANDHANDLER_rxRs485Message;

void COMMANDHANDLER_init(void) {}

void COMMANDHANDLER_deinit(void) {}

void COMMANDHANDLER_run(void) {
	// Handle RS485 Message
	if(RS485_receive(&COMMANDHANDLER_rxRs485Message)){
		if(!COMMANDHANDLER_isRs485MessageValid(&COMMANDHANDLER_rxRs485Message)){
			return;
		}
		switch (COMMANDHANDLER_rxRs485Message.messageId) {
			case COMMANDHANDLER_RFID_485_MESSAGE_ID_REQUEST_STATUS:
				COMMANDHANDLER_handleRequestRFIDStatus(&COMMANDHANDLER_rxRs485Message);
				break;
			case COMMANDHANDLER_RFID_485_MESSAGE_ID_REQUEST_UPDATE:
				COMMANDHANDLER_handleRequestRFIDUpdate(&COMMANDHANDLER_rxRs485Message);
				break;
			default:
				break;
		}
	}
}

static bool COMMANDHANDLER_isRs485MessageValid(RS485_Message *message){
	uint8_t nodeId = DIPSWITCH_get();
	if(message->networkId != COMMANDHANDLER_RFID_485_NETWORK_ID){
		return false;
	}
	if(message->srcNode != COMMANDHANDLER_RFID_485_MASTER_NODE_ID){
		return false;
	}
	if(message->desNode != nodeId){
		return false;
	}
	return true;
}

static void COMMANDHANDLER_handleRequestRFIDStatus(RS485_Message *message){
	uint8_t nodeId = DIPSWITCH_get();
	if(!RFID_isPlaced()){
		COMMANDHANDLER_sendRFIDStatusResponse(nodeId, NULL);
		return;
	}
	RFID_t rfid;
	RFID_get(&rfid);
	COMMANDHANDLER_sendRFIDStatusResponse(nodeId, &rfid);
}

static void COMMANDHANDLER_handleRequestRFIDUpdate(RS485_Message *message){
	RFID_t rfid;
	rfid.id_len = message->data[0];
	for (uint8_t i = 0; i < rfid.id_len; ++i) {
		rfid.id[i] = message->data[1 + i];
	}
	rfid.code = message->data[rfid.id_len + 1];
	rfid.type = message->data[rfid.id_len + 2];
	rfid.isUsed = message->data[rfid.id_len + 3];
	RFID_Error_t error = RFID_set(&rfid);

	uint8_t nodeId = DIPSWITCH_get();
	COMMANDHANDLER_sendRFIDUpdateResponse(nodeId, error);
}


/**
 * @defgroup Response Function
 */

static void COMMANDHANDLER_sendRFIDStatusResponse(uint8_t nodeId, RFID_t *rfid){
	RS485_Message message;
	message.networkId = COMMANDHANDLER_RFID_485_NETWORK_ID;
	message.srcNode = nodeId;
	message.desNode = COMMANDHANDLER_RFID_485_MASTER_NODE_ID;
	message.messageId = COMMANDHANDLER_RFID_485_MESSAGE_ID_RESPONSE_STATUS;

	// Has RFID
	if(rfid != NULL){
		message.resultCode = RS485_RESULT_CODE_SUCCESS;
		message.dataLen = 0;
		message.data[message.dataLen++] =rfid->id_len;
		for (int i = 0; i < rfid->id_len; i++) {
			message.data[message.dataLen++] = rfid->id[i];
		}
		message.data[message.dataLen++] =rfid->code;
		message.data[message.dataLen++] =rfid->type;
		message.data[message.dataLen++] =rfid->isUsed;
	}else{
		message.resultCode = RS485_RESULT_CODE_FAILED;
		message.dataLen = 0;
	}
	RS485_send(&message);
}

static void COMMANDHANDLER_sendRFIDUpdateResponse(uint8_t nodeId, RFID_Error_t error){
	RS485_Message message;
	message.networkId = COMMANDHANDLER_RFID_485_NETWORK_ID;
	message.srcNode = nodeId;
	message.desNode = COMMANDHANDLER_RFID_485_MASTER_NODE_ID;
	message.messageId = COMMANDHANDLER_RFID_485_MESSAGE_ID_RESPONSE_UPDATE;
	message.resultCode = RS485_RESULT_CODE_SUCCESS;
	message.dataLen = 1;
	message.data[0] = error;
	RS485_send(&message);
}


