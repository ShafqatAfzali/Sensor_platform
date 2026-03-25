################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Middlewares/lvgl_lib/src/drivers/display/st7796/lv_st7796.c 

OBJS += \
./Middlewares/lvgl_lib/src/drivers/display/st7796/lv_st7796.o 

C_DEPS += \
./Middlewares/lvgl_lib/src/drivers/display/st7796/lv_st7796.d 


# Each subdirectory must supply rules for building sources it contributes
Middlewares/lvgl_lib/src/drivers/display/st7796/%.o Middlewares/lvgl_lib/src/drivers/display/st7796/%.su Middlewares/lvgl_lib/src/drivers/display/st7796/%.cyclo: ../Middlewares/lvgl_lib/src/drivers/display/st7796/%.c Middlewares/lvgl_lib/src/drivers/display/st7796/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F446xx -c -I../Application -I"C:/Users/shafg/Desktop/Projects_Firmware/sensor_platform/Middlewares/lvgl_lib" -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I../Middlewares/Third_Party/FreeRTOS/Source/include -I../Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS_V2 -I../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Middlewares-2f-lvgl_lib-2f-src-2f-drivers-2f-display-2f-st7796

clean-Middlewares-2f-lvgl_lib-2f-src-2f-drivers-2f-display-2f-st7796:
	-$(RM) ./Middlewares/lvgl_lib/src/drivers/display/st7796/lv_st7796.cyclo ./Middlewares/lvgl_lib/src/drivers/display/st7796/lv_st7796.d ./Middlewares/lvgl_lib/src/drivers/display/st7796/lv_st7796.o ./Middlewares/lvgl_lib/src/drivers/display/st7796/lv_st7796.su

.PHONY: clean-Middlewares-2f-lvgl_lib-2f-src-2f-drivers-2f-display-2f-st7796

