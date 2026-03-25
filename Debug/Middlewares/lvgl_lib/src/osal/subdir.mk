################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Middlewares/lvgl_lib/src/osal/lv_cmsis_rtos2.c \
../Middlewares/lvgl_lib/src/osal/lv_freertos.c \
../Middlewares/lvgl_lib/src/osal/lv_linux.c \
../Middlewares/lvgl_lib/src/osal/lv_mqx.c \
../Middlewares/lvgl_lib/src/osal/lv_os.c \
../Middlewares/lvgl_lib/src/osal/lv_os_none.c \
../Middlewares/lvgl_lib/src/osal/lv_pthread.c \
../Middlewares/lvgl_lib/src/osal/lv_rtthread.c \
../Middlewares/lvgl_lib/src/osal/lv_sdl2.c \
../Middlewares/lvgl_lib/src/osal/lv_windows.c 

OBJS += \
./Middlewares/lvgl_lib/src/osal/lv_cmsis_rtos2.o \
./Middlewares/lvgl_lib/src/osal/lv_freertos.o \
./Middlewares/lvgl_lib/src/osal/lv_linux.o \
./Middlewares/lvgl_lib/src/osal/lv_mqx.o \
./Middlewares/lvgl_lib/src/osal/lv_os.o \
./Middlewares/lvgl_lib/src/osal/lv_os_none.o \
./Middlewares/lvgl_lib/src/osal/lv_pthread.o \
./Middlewares/lvgl_lib/src/osal/lv_rtthread.o \
./Middlewares/lvgl_lib/src/osal/lv_sdl2.o \
./Middlewares/lvgl_lib/src/osal/lv_windows.o 

C_DEPS += \
./Middlewares/lvgl_lib/src/osal/lv_cmsis_rtos2.d \
./Middlewares/lvgl_lib/src/osal/lv_freertos.d \
./Middlewares/lvgl_lib/src/osal/lv_linux.d \
./Middlewares/lvgl_lib/src/osal/lv_mqx.d \
./Middlewares/lvgl_lib/src/osal/lv_os.d \
./Middlewares/lvgl_lib/src/osal/lv_os_none.d \
./Middlewares/lvgl_lib/src/osal/lv_pthread.d \
./Middlewares/lvgl_lib/src/osal/lv_rtthread.d \
./Middlewares/lvgl_lib/src/osal/lv_sdl2.d \
./Middlewares/lvgl_lib/src/osal/lv_windows.d 


# Each subdirectory must supply rules for building sources it contributes
Middlewares/lvgl_lib/src/osal/%.o Middlewares/lvgl_lib/src/osal/%.su Middlewares/lvgl_lib/src/osal/%.cyclo: ../Middlewares/lvgl_lib/src/osal/%.c Middlewares/lvgl_lib/src/osal/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F446xx -c -I../Application -I"C:/Users/shafg/Desktop/Projects_Firmware/sensor_platform/Middlewares/lvgl_lib" -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I../Middlewares/Third_Party/FreeRTOS/Source/include -I../Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS_V2 -I../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Middlewares-2f-lvgl_lib-2f-src-2f-osal

clean-Middlewares-2f-lvgl_lib-2f-src-2f-osal:
	-$(RM) ./Middlewares/lvgl_lib/src/osal/lv_cmsis_rtos2.cyclo ./Middlewares/lvgl_lib/src/osal/lv_cmsis_rtos2.d ./Middlewares/lvgl_lib/src/osal/lv_cmsis_rtos2.o ./Middlewares/lvgl_lib/src/osal/lv_cmsis_rtos2.su ./Middlewares/lvgl_lib/src/osal/lv_freertos.cyclo ./Middlewares/lvgl_lib/src/osal/lv_freertos.d ./Middlewares/lvgl_lib/src/osal/lv_freertos.o ./Middlewares/lvgl_lib/src/osal/lv_freertos.su ./Middlewares/lvgl_lib/src/osal/lv_linux.cyclo ./Middlewares/lvgl_lib/src/osal/lv_linux.d ./Middlewares/lvgl_lib/src/osal/lv_linux.o ./Middlewares/lvgl_lib/src/osal/lv_linux.su ./Middlewares/lvgl_lib/src/osal/lv_mqx.cyclo ./Middlewares/lvgl_lib/src/osal/lv_mqx.d ./Middlewares/lvgl_lib/src/osal/lv_mqx.o ./Middlewares/lvgl_lib/src/osal/lv_mqx.su ./Middlewares/lvgl_lib/src/osal/lv_os.cyclo ./Middlewares/lvgl_lib/src/osal/lv_os.d ./Middlewares/lvgl_lib/src/osal/lv_os.o ./Middlewares/lvgl_lib/src/osal/lv_os.su ./Middlewares/lvgl_lib/src/osal/lv_os_none.cyclo ./Middlewares/lvgl_lib/src/osal/lv_os_none.d ./Middlewares/lvgl_lib/src/osal/lv_os_none.o ./Middlewares/lvgl_lib/src/osal/lv_os_none.su ./Middlewares/lvgl_lib/src/osal/lv_pthread.cyclo ./Middlewares/lvgl_lib/src/osal/lv_pthread.d ./Middlewares/lvgl_lib/src/osal/lv_pthread.o ./Middlewares/lvgl_lib/src/osal/lv_pthread.su ./Middlewares/lvgl_lib/src/osal/lv_rtthread.cyclo ./Middlewares/lvgl_lib/src/osal/lv_rtthread.d ./Middlewares/lvgl_lib/src/osal/lv_rtthread.o ./Middlewares/lvgl_lib/src/osal/lv_rtthread.su ./Middlewares/lvgl_lib/src/osal/lv_sdl2.cyclo ./Middlewares/lvgl_lib/src/osal/lv_sdl2.d ./Middlewares/lvgl_lib/src/osal/lv_sdl2.o ./Middlewares/lvgl_lib/src/osal/lv_sdl2.su ./Middlewares/lvgl_lib/src/osal/lv_windows.cyclo ./Middlewares/lvgl_lib/src/osal/lv_windows.d ./Middlewares/lvgl_lib/src/osal/lv_windows.o ./Middlewares/lvgl_lib/src/osal/lv_windows.su

.PHONY: clean-Middlewares-2f-lvgl_lib-2f-src-2f-osal

