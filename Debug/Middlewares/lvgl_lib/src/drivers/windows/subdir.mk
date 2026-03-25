################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Middlewares/lvgl_lib/src/drivers/windows/lv_windows_context.c \
../Middlewares/lvgl_lib/src/drivers/windows/lv_windows_display.c \
../Middlewares/lvgl_lib/src/drivers/windows/lv_windows_input.c 

OBJS += \
./Middlewares/lvgl_lib/src/drivers/windows/lv_windows_context.o \
./Middlewares/lvgl_lib/src/drivers/windows/lv_windows_display.o \
./Middlewares/lvgl_lib/src/drivers/windows/lv_windows_input.o 

C_DEPS += \
./Middlewares/lvgl_lib/src/drivers/windows/lv_windows_context.d \
./Middlewares/lvgl_lib/src/drivers/windows/lv_windows_display.d \
./Middlewares/lvgl_lib/src/drivers/windows/lv_windows_input.d 


# Each subdirectory must supply rules for building sources it contributes
Middlewares/lvgl_lib/src/drivers/windows/%.o Middlewares/lvgl_lib/src/drivers/windows/%.su Middlewares/lvgl_lib/src/drivers/windows/%.cyclo: ../Middlewares/lvgl_lib/src/drivers/windows/%.c Middlewares/lvgl_lib/src/drivers/windows/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F446xx -c -I../Application -I"C:/Users/shafg/Desktop/Projects_Firmware/sensor_platform/Middlewares/lvgl_lib" -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I../Middlewares/Third_Party/FreeRTOS/Source/include -I../Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS_V2 -I../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Middlewares-2f-lvgl_lib-2f-src-2f-drivers-2f-windows

clean-Middlewares-2f-lvgl_lib-2f-src-2f-drivers-2f-windows:
	-$(RM) ./Middlewares/lvgl_lib/src/drivers/windows/lv_windows_context.cyclo ./Middlewares/lvgl_lib/src/drivers/windows/lv_windows_context.d ./Middlewares/lvgl_lib/src/drivers/windows/lv_windows_context.o ./Middlewares/lvgl_lib/src/drivers/windows/lv_windows_context.su ./Middlewares/lvgl_lib/src/drivers/windows/lv_windows_display.cyclo ./Middlewares/lvgl_lib/src/drivers/windows/lv_windows_display.d ./Middlewares/lvgl_lib/src/drivers/windows/lv_windows_display.o ./Middlewares/lvgl_lib/src/drivers/windows/lv_windows_display.su ./Middlewares/lvgl_lib/src/drivers/windows/lv_windows_input.cyclo ./Middlewares/lvgl_lib/src/drivers/windows/lv_windows_input.d ./Middlewares/lvgl_lib/src/drivers/windows/lv_windows_input.o ./Middlewares/lvgl_lib/src/drivers/windows/lv_windows_input.su

.PHONY: clean-Middlewares-2f-lvgl_lib-2f-src-2f-drivers-2f-windows

