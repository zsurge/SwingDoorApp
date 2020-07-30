/******************************************************************************

                  ��Ȩ���� (C), 2013-2023, ���ڲ�˼�߿Ƽ����޹�˾

 ******************************************************************************
  �� �� ��   : BarCode_Task.c
  �� �� ��   : ����
  ��    ��   :  
  ��������   : 2020��2��27��
  ����޸�   :
  ��������   : ���봦������
  �����б�   :
  �޸���ʷ   :
  1.��    ��   : 2020��2��27��
    ��    ��   :  
    �޸�����   : �����ļ�

******************************************************************************/

/*----------------------------------------------*
 * ����ͷ�ļ�                                   *
 *----------------------------------------------*/
#include "MsgParse_Task.h"
/*----------------------------------------------*
 * �궨��                                       *
 *----------------------------------------------*/
#define CMD_TASK_PRIO		( tskIDLE_PRIORITY + 4)
#define CMD_STK_SIZE 		(configMINIMAL_STACK_SIZE*8)

/*----------------------------------------------*
 * ��������                                     *
 *----------------------------------------------*/
const char *MsgParseTaskName = "vMotorCtrlTask";  

/*----------------------------------------------*
 * ģ�鼶����                                   *
 *----------------------------------------------*/
TaskHandle_t xHandleTaskMsgParse = NULL;

/*----------------------------------------------*
 * �ڲ�����ԭ��˵��                             *
 *----------------------------------------------*/
static void vTaskMsgParse(void *pvParameters);

void CreateMsgParseTask(void *pvParameters)
{
    //��androidͨѶ�������ݽ���
    xTaskCreate((TaskFunction_t )vTaskMsgParse,     
                (const char*    )MsgParseTaskName,   
                (uint16_t       )CMD_STK_SIZE, 
                (void*          )pvParameters,
                (UBaseType_t    )CMD_TASK_PRIO,
                (TaskHandle_t*  )&xHandleTaskMsgParse);
}



static void vTaskMsgParse(void *pvParameters)
{
    while(1)
    {          
        deal_Serial_Parse();    
	    deal_rx_data();

		/* �����¼���־����ʾ������������ */        
		xEventGroupSetBits(xCreatedEventGroup, TASK_BIT_2);
        vTaskDelay(100);
    }

}

