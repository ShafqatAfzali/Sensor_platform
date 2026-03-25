################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Middlewares/lvgl_lib/src/stdlib/rtthread/lv_mem_core_rtthread.c \
../Middlewares/lvgl_lib/src/stdlib/rtthread/lv_sprintf_rtthread.c \
../Middlewares/lvgl_lib/src/stdlib/rtthread/lv_string_rtthread.c 

OBJS += \
./Middlewares/lvgl_lib/src/stdlib/rtthread/lv_mem_core_rtthread.o \
./Middlewares/lvgl_lib/src/stdlib/rtthread/lv_sprintf_rtthread.o \
./Middlewares/lvgl_lib/src/stdlib/rtthread/lv_string_rtthread.o 

C_DEPS += \
./Middlewares/lvgl_lib/src/stdlib/rtthread/lv_mem_core_rtthread.d \
./Middlewares/lvgl_lib/src/stdlib/rtthread/lv_sprintf_rtthread.d \
./Middlewares/lvgl_lib/src/stdlib/rtthread/lv_string_rtthread.d 


# Each subdirectory must supply rules for building sources it contributes
Middlewares/lvgl_lib/src/stdlib/rtthread/%.o Middlewares/lvgl_lib/src/stdlib/rtthread/%.su Middlewares/lvgl_lib/src/stdlib/rtthread/%.cyclo: ../Middlewares/lvgl_lib/src/stdlib/rtthread/%.c Middlewares/lvgl_lib/src/stdlib/rtthread/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F446xx -c -I../Application -I"C:/Users/shafg/Desktop/Projects_Firmware/sensor_platform/Middlewares/lvgl_lib" -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I../Middlewares/Third_Party/FreeRTOS/Source/include -I../Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS_V2 -I../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Middlewares-2f-lvgl_lib-2f-src-2f-stdlib-2f-rtthread

clean-Middlewares-2f-lvgl_lib-2f-src-2f-stdlib-2f-rtthread:
	-$(RM) ./Middlewares/lvgl_lib/src/stdlib/rtthread/lv_mem_core_rtthread.cyclo ./Middlewares/lvgl_lib/src/stdlib/rtthread/lv_mem_core_rtthread.d ./Middlewares/lvgl_lib/src/stdlib/rtthread/lv_mem_core_rtthread.o ./Middlewares/lvgl_lib/src/stdlib/rtthread/lv_mem_core_rtthread.su ./Middlewares/lvgl_lib/src/stdlib/rtthread/lv_sprintf_rtthread.cyclo ./Middlewares/lvgl_lib/src/stdlib/rtthread/lv_sprintf_rtthread.d ./Middlewares/lvgl_lib/src/stdlib/rtthread/lv_sprintf_rtthread.o ./Middlewares/lvgl_lib/src/stdlib/rtthread/lv_sprintf_rtthread.su ./Middlewares/lvgl_lib/src/stdlib/rtthread/lv_string_rtthread.cyclo ./Middlewares/lvgl_lib/src/stdlib/rtthread/lv_string_rtthread.d ./Middlewares/lvgl_lib/src/stdlib/rtthread/lv_string_rtthread.o ./Middlewares/lvgl_lib/src/stdlib/rtthread/lv_string_rtthread.su

.PHONY: clean-Middlewares-2f-lvgl_lib-2f-src-2f-stdlib-2f-rtthread

