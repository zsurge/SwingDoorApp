/******************************************************************************

                  版权所有 (C), 2013-2023, 深圳博思高科技有限公司

 ******************************************************************************
  文 件 名   : bsp.c
  版 本 号   : 初稿
  作    者   : 张舵
  生成日期   : 2019年7月9日
  最近修改   :
  功能描述   : 这是硬件底层驱动程序的主文件。每个可以 #include "bsp.h" 来包含所有的外设驱动模块。
            bsp = Borad surport packet 板级支持包
  函数列表   :
  修改历史   :
  1.日    期   : 2019年7月9日
    作    者   : 张舵
    修改内容   : 创建文件

******************************************************************************/

/*----------------------------------------------*
 * 包含头文件                                   *
 *----------------------------------------------*/
#include "bsp.h"
/*----------------------------------------------*
 * 宏定义                                       *
 *----------------------------------------------*/

/*----------------------------------------------*
 * 常量定义                                     *
 *----------------------------------------------*/

/*----------------------------------------------*
 * 模块级变量                                   *
 *----------------------------------------------*/

/*----------------------------------------------*
 * 内部函数原型说明                             *
 *----------------------------------------------*/
 void bsp_Init(void)
{
	NVIC_PriorityGroupConfig(NVIC_PriorityGroup_4);//设置系统中断优先级分组4
	delay_init(168);            //初始化延时函数

	bsp_TIM6_Init();            //定时器6初始化
	
    BSP_UartOpen(SCOM1,  9600, 8, 1, 0);
    bsp_InitUart();             //modify 2019.8.5 
	
	bsp_LED_Init();		        //初始化LED端口	    
	bsp_speaker_init();         //USB供电 add 2019.10.17	
	bsp_Ex_LED_Init();          //初始化外部LED灯/灯带
    bsp_key_Init();             //全高门按键初始化
    bsp_WiegandInit();          //韦根读卡器初始化    
    STM_FLASH_Init();           //芯片内部FLASH初始化
    easyflash_init();           //外部FLASH初始化，使用easyflash    
    bsp_beep_init();            //蜂鸣器初始化    
//    bsp_infrared_init();        //红外传感器初始化
    bsp_sensor_init();
//    
}

