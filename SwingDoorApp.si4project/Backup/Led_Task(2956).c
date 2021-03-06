/******************************************************************************

                  版权所有 (C), 2013-2023, 深圳博思高科技有限公司

 ******************************************************************************
  文 件 名   : Led_Task.c
  版 本 号   : 初稿
  作    者   :  
  生成日期   : 2020年2月25日
  最近修改   :
  功能描述   : LED灯控制
  函数列表   :
  修改历史   :
  1.日    期   : 2020年2月25日
    作    者   :  
    修改内容   : 创建文件

******************************************************************************/

/*----------------------------------------------*
 * 包含头文件                                   *
 *----------------------------------------------*/
#include "led_task.h"
#include "tool.h"
#include "bsp_led.h" 

/*----------------------------------------------*
 * 宏定义                                       *
 *----------------------------------------------*/
#define LED_TASK_PRIO	    ( tskIDLE_PRIORITY)
#define LED_STK_SIZE 		(configMINIMAL_STACK_SIZE*8)

/*----------------------------------------------*
 * 常量定义                                     *
 *----------------------------------------------*/
const char *ledTaskName = "vLedTask";      //看门狗任务名


/*----------------------------------------------*
 * 模块级变量                                   *
 *----------------------------------------------*/
TaskHandle_t xHandleTaskLed = NULL;      //LED灯


/*----------------------------------------------*
 * 内部函数原型说明                             *
 *----------------------------------------------*/
static void vTaskLed(void *pvParameters);

void CreateLedTask(void)
{
    //创建LED任务
    xTaskCreate((TaskFunction_t )vTaskLed,         
                (const char*    )ledTaskName,       
                (uint16_t       )LED_STK_SIZE, 
                (void*          )NULL,              
                (UBaseType_t    )LED_TASK_PRIO,    
                (TaskHandle_t*  )&xHandleTaskLed);   

}


//LED任务函数 
static void vTaskLed(void *pvParameters)
{   
//    uint8_t pcWriteBuffer[1024];
    uint8_t tmp[15] = {0x00};
    BaseType_t xReturn = pdTRUE;/* 定义一个创建信息返回值，默认为pdPASS */
    const TickType_t xMaxBlockTime = pdMS_TO_TICKS(1000); /* 设置最大等待时间为1000ms */  
    char *recvbuff;
    uint8_t i = 0;

    
    BEEP = 0;
    vTaskDelay(300);
    BEEP = 1;
    
    while(1)
    {          
        if(Motro_A== 1)
        {
          LED3=!LED3;   
        }
        else
        {
            LED3 = 0;
        }
        
        if(Motro_B == 1)
        {
          LED2=!LED2;   
        }
        else
        {
            LED2 = 0;
        }    

        //系统状态运行灯，每500ms 一次
        i++;
        if(i == 5)
        {
            i = 0;
            LED4=!LED4; 
        }

        //获取任务通知，等待1000个时间节拍，获取到，则执行上位机指令，获取不到，则执行状态查询
		xReturn=xTaskNotifyWait(0x0,			//进入函数的时候不清除任务bit
                            ULONG_MAX,	        //退出函数的时候清除所有的bit
                            (uint32_t *)&recvbuff,//保存任务通知值                    
                            (TickType_t)xMaxBlockTime);	//阻塞时间
                            
        if( pdTRUE == xReturn )
        {            
            memcpy(tmp,recvbuff,MAX_EXLED_LEN);
//            dbh("ex_led recv：",tmp, MAX_EXLED_LEN);
            if(Nonzero(tmp,MAX_EXLED_LEN))
            {
                bsp_Ex_SetLed((uint8_t*)tmp); 
                memset(tmp,0x00,sizeof(tmp));
                send_to_host(SETLED,tmp,1);
            }
            else
            {
                SendAsciiCodeToHost(ERRORINFO,COMM_SEND_ERR,"set led error,try again");
            }

        }
         
        
		/* 发送事件标志，表示任务正常运行 */        
		xEventGroupSetBits(xCreatedEventGroup, TASK_BIT_0);  
        vTaskDelay(100);     
    }
}   


