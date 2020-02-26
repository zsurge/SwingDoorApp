; generated by Component: ARM Compiler 5.06 update 6 (build 750) Tool: ArmCC [4d3637]
; commandline ArmCC [--c99 --split_sections --debug -c -S -o..\6bin\freertos_cli.s --depend=..\6bin\freertos_cli.d --cpu=Cortex-M4.fp --apcs=interwork --diag_suppress=9931 -I..\1McuLayer\CMSIS -I..\1McuLayer\STM32F4xx_StdPeriph_Driver\inc -I..\2LowLayer\LED -I..\3MiddleLayer\delay -I..\3MiddleLayer\sys -I..\2LowLayer\USART -I..\4UserLayer -I..\5FreeRTOS\include -I..\5FreeRTOS\portable\RVDS\ARM_CM4F -I..\2LowLayer\FLASH -I..\2LowLayer\KEY -I..\3MiddleLayer\easyflash\inc -I..\2LowLayer\TIME -I..\2LowLayer\FLASH\inc -I..\3MiddleLayer\ini -I..\3MiddleLayer\stmflash -I..\3MiddleLayer\ymodem -I..\3MiddleLayer\cjson -I..\3MiddleLayer\malloc -I..\2LowLayer\BEEP -I..\2LowLayer\INFRARED -I.\RTE\_SMCS_BASE_APP -Id:\Keil_v5\Packs\Keil\STM32F4xx_DFP\2.13.0\Drivers\CMSIS\Device\ST\STM32F4xx\Include -Id:\Keil_v5\ARM\CMSIS\Include -D__UVISION_VERSION=527 -DSTM32F407xx -DSTM32F40_41xxx -DUSE_STDPERIPH_DRIVER --omf_browse=..\6bin\freertos_cli.crf ..\5FreeRTOS\cli\FreeRTOS_CLI.c]
        THUMB
        REQUIRE8
        PRESERVE8

        AREA ||i.FreeRTOS_CLIGetOutputBuffer||, CODE, READONLY, ALIGN=2

FreeRTOS_CLIGetOutputBuffer PROC
        LDR      r0,|L0.4|
        BX       lr
        ENDP

|L0.4|
        DCD      ||.bss||

        AREA ||i.FreeRTOS_CLIGetParameter||, CODE, READONLY, ALIGN=1

FreeRTOS_CLIGetParameter PROC
        PUSH     {r4,r5,lr}
        MOVS     r3,#0
        MOV      r5,r3
        STR      r3,[r2,#0]
        B        |L1.62|
|L1.10|
        ADDS     r0,r0,#1
|L1.12|
        LDRB     r4,[r0,#0]
        CBZ      r4,|L1.66|
        CMP      r4,#0x20
        BNE      |L1.10|
|L1.20|
        LDRB     r4,[r0,#1]!
        CBZ      r4,|L1.66|
        CMP      r4,#0x20
        BEQ      |L1.20|
        ADDS     r3,r3,#1
        CMP      r3,r1
        BNE      |L1.62|
        MOV      r5,r0
|L1.38|
        LDR      r1,[r2,#0]
        ADDS     r1,r1,#1
        STR      r1,[r2,#0]
        LDRB     r1,[r0,#1]!
        CBZ      r1,|L1.54|
        CMP      r1,#0x20
        BNE      |L1.38|
|L1.54|
        LDR      r0,[r2,#0]
        CBNZ     r0,|L1.66|
        MOVS     r5,#0
        B        |L1.66|
|L1.62|
        CMP      r3,r1
        BCC      |L1.12|
|L1.66|
        MOV      r0,r5
        POP      {r4,r5,pc}
        ENDP


        AREA ||i.FreeRTOS_CLIProcessCommand||, CODE, READONLY, ALIGN=2

FreeRTOS_CLIProcessCommand PROC
        PUSH     {r4-r10,lr}
        LDR      r6,|L2.196|
        MOV      r5,r0
        MOV      r9,r2
        LDR      r0,[r6,#4]  ; pxCommand
        MOV      r10,r1
        MOVS     r4,#1
        MOV      r8,#0
        CBNZ     r0,|L2.128|
        ADD      r0,r6,#0xc
        B        |L2.62|
|L2.28|
        LDR      r0,[r0,#0]
        LDR      r7,[r0,#0]
        MOV      r0,r7
        BL       strlen
        MOV      r2,r0
        LDRB     r0,[r5,r2]
        CMP      r0,#0x20
        BEQ      |L2.48|
        CBNZ     r0,|L2.58|
|L2.48|
        MOV      r1,r7
        MOV      r0,r5
        BL       strncmp
        CBZ      r0,|L2.70|
|L2.58|
        LDR      r0,[r6,#4]  ; pxCommand
        LDR      r0,[r0,#4]
|L2.62|
        STR      r0,[r6,#4]  ; pxCommand
        CMP      r0,#0
        BNE      |L2.28|
        B        |L2.176|
|L2.70|
        LDR      r12,[r6,#4]  ; pxCommand
        LDR      r0,[r12,#0]
        LDRSB    r7,[r0,#0xc]
        CMP      r7,#0
        BLT      |L2.120|
        MOVS     r0,#0
        MOV      r2,r5
        MOV      r1,r0
        B        |L2.102|
|L2.94|
        CMP      r3,#0x20
        BEQ      |L2.148|
        MOVS     r1,#0
|L2.100|
        ADDS     r2,r2,#1
|L2.102|
        LDRB     r3,[r2,#0]
        CMP      r3,#0
        BNE      |L2.94|
        CBZ      r1,|L2.114|
        SUBS     r0,r0,#1
        SXTB     r0,r0
|L2.114|
        CMP      r0,r7
        BEQ      |L2.120|
        MOVS     r4,#0
|L2.120|
        CMP      r12,#0
        BEQ      |L2.176|
        CBZ      r4,|L2.160|
|L2.128|
        LDR      r0,[r6,#4]  ; pxCommand
        MOV      r2,r5
        MOV      r1,r9
        LDR      r0,[r0,#0]
        LDR      r3,[r0,#8]
        MOV      r0,r10
        BLX      r3
        MOVS     r4,r0
        BEQ      |L2.170|
        B        |L2.188|
|L2.148|
        CMP      r1,#0
        BNE      |L2.100|
        ADDS     r0,r0,#1
        SXTB     r0,r0
        MOVS     r1,#1
        B        |L2.100|
|L2.160|
        MOV      r2,r9
        LDR      r1,|L2.200|
        MOV      r0,r10
        BL       strncpy
|L2.170|
        STR      r8,[r6,#4]  ; pxCommand
        B        |L2.188|
|L2.176|
        MOV      r2,r9
        LDR      r1,|L2.204|
        MOV      r0,r10
        BL       strncpy
        MOVS     r4,#0
|L2.188|
        MOV      r0,r4
        POP      {r4-r10,pc}
        ENDP

        DCW      0x0000
|L2.196|
        DCD      ||.data||
|L2.200|
        DCD      ||area_number.10||
|L2.204|
        DCD      ||area_number.10||+0x58

        AREA ||i.FreeRTOS_CLIRegisterCommand||, CODE, READONLY, ALIGN=2

FreeRTOS_CLIRegisterCommand PROC
        PUSH     {r4-r6,lr}
        MOVS     r5,r0
        BEQ      |L3.42|
        MOVS     r0,#8
        BL       pvPortMalloc
        MOVS     r4,r0
        BEQ      |L3.58|
        BL       vPortEnterCritical
        MOVS     r0,#0
        STRD     r5,r0,[r4,#0]
        LDR      r0,|L3.76|
        LDR      r1,[r0,#0]  ; pxLastCommandInList
        STR      r4,[r1,#4]
        STR      r4,[r0,#0]  ; pxLastCommandInList
        BL       vPortExitCritical
        MOVS     r0,#1
        POP      {r4-r6,pc}
|L3.42|
        MOVS     r0,#0x50
        MSR      BASEPRI,r0
        DSB      
        ISB      
|L3.56|
        B        |L3.56|
|L3.58|
        MOVS     r0,#0x50
        MSR      BASEPRI,r0
        DSB      
        ISB      
|L3.72|
        B        |L3.72|
        ENDP

        DCW      0x0000
|L3.76|
        DCD      ||.data||

        AREA ||i.prvHelpCommand||, CODE, READONLY, ALIGN=2

prvHelpCommand PROC
        PUSH     {r4,lr}
        LDR      r4,|L4.40|
        MOV      r2,r1
        LDR      r1,[r4,#8]  ; pxCommand
        CBNZ     r1,|L4.16|
        ADD      r1,r4,#0xc
        STR      r1,[r4,#8]  ; pxCommand
|L4.16|
        LDR      r1,[r1,#0]
        LDR      r1,[r1,#4]
        BL       strncpy
        LDR      r0,[r4,#8]  ; pxCommand
        LDR      r0,[r0,#4]
        STR      r0,[r4,#8]  ; pxCommand
        CMP      r0,#0
        BEQ      |L4.36|
        MOVS     r0,#1
|L4.36|
        POP      {r4,pc}
        ENDP

        DCW      0x0000
|L4.40|
        DCD      ||.data||

        AREA ||.arm_vfe_header||, DATA, READONLY, NOALLOC, ALIGN=2

        DCD      0x00000000

        AREA ||.bss||, DATA, NOINIT, ALIGN=0

cOutputBuffer
        %        1024

        AREA ||.constdata||, DATA, READONLY, ALIGN=2

xHelpCommand
        DCD      ||.conststring||
        DCD      ||.conststring||+0x8
        DCD      prvHelpCommand
        DCB      0x00,0x00,0x00,0x00

        AREA ||.conststring||, DATA, READONLY, MERGE=1, STRINGS, ALIGN=2

        DCB      "help",0
        DCB      0
        DCB      0
        DCB      0
        DCB      "\r\nhelp:\r\n Lists all the registered commands\r\n\r\n"
        DCB      0

        AREA ||area_number.10||, DATA, READONLY, MERGE=1, STRINGS, ALIGN=2

        EXPORTAS ||area_number.10||, ||.conststring||
        DCB      "Incorrect command parameter(s).  Enter ""help"" to view"
        DCB      " a list of available commands.\r\n\r\n",0
        DCB      "Command not recognised.  Enter 'help' to view a list of"
        DCB      " available commands.\r\n\r\n",0

        AREA ||.data||, DATA, ALIGN=2

pxLastCommandInList
        DCD      xRegisteredCommands
pxCommand
        DCD      0x00000000
|symbol_number.12|
        DCD      0x00000000
xRegisteredCommands
        DCD      xHelpCommand
        DCD      0x00000000

        EXPORT FreeRTOS_CLIGetOutputBuffer [CODE]
        EXPORT FreeRTOS_CLIGetParameter [CODE]
        EXPORT FreeRTOS_CLIProcessCommand [CODE]
        EXPORT FreeRTOS_CLIRegisterCommand [CODE]

        IMPORT ||Lib$$Request$$armlib|| [CODE,WEAK]
        IMPORT pvPortMalloc [CODE]
        IMPORT vPortEnterCritical [CODE]
        IMPORT vPortExitCritical [CODE]
        IMPORT strlen [CODE]
        IMPORT strncmp [CODE]
        IMPORT strncpy [CODE]

        KEEP prvHelpCommand
        KEEP cOutputBuffer
        KEEP xHelpCommand
        KEEP pxLastCommandInList
        KEEP pxCommand
        KEEP |symbol_number.12|
        EXPORTAS |symbol_number.12|, pxCommand
        KEEP xRegisteredCommands

        ATTR FILESCOPE
        ATTR SETVALUE Tag_ABI_PCS_wchar_t,2
        ATTR SETVALUE Tag_ABI_enum_size,1
        ATTR SETVALUE Tag_ABI_optimization_goals,3
        ATTR SETSTRING Tag_conformance,"2.09"
        ATTR SETVALUE AV,18,1

        ASSERT {ENDIAN} = "little"
        ASSERT {INTER} = {TRUE}
        ASSERT {ROPI} = {FALSE}
        ASSERT {RWPI} = {FALSE}
        ASSERT {IEEE_FULL} = {FALSE}
        ASSERT {IEEE_PART} = {FALSE}
        ASSERT {IEEE_JAVA} = {FALSE}
        END
