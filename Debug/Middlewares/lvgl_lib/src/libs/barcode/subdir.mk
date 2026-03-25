################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Middlewares/lvgl_lib/src/libs/barcode/code128.c \
../Middlewares/lvgl_lib/src/libs/barcode/lv_barcode.c 

OBJS += \
./Middlewares/lvgl_lib/src/libs/barcode/code128.o \
./Middlewares/lvgl_lib/src/libs/barcode/lv_barcode.o 

C_DEPS += \
./Middlewares/lvgl_lib/src/libs/barcode/code128.d \
./Middlewares/lvgl_lib/src/libs/barcode/lv_barcode.d 


# Each subdirectory must supply rules for building sources it contributes
Middlewares/lvgl_lib/src/libs/barcode/%.o Middlewares/lvgl_lib/src/libs/barcode/%.su Middlewares/lvgl_lib/src/libs/barcode/%.cyclo: ../Middlewares/lvgl_lib/src/libs/barcode/%.c Middlewares/lvgl_lib/src/libs/barcode/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F446xx -c -I../Application -I"C:/Users/shafg/Desktop/Projects_Firmware/sensor_platform/Middlewares/lvgl_lib" -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I../Middlewares/Third_Party/FreeRTOS/Source/include -I../Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS_V2 -I../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Middlewares-2f-lvgl_lib-2f-src-2f-libs-2f-barcode

clean-Middlewares-2f-lvgl_lib-2f-src-2f-libs-2f-barcode:
	-$(RM) ./Middlewares/lvgl_lib/src/libs/barcode/code128.cyclo ./Middlewares/lvgl_lib/src/libs/barcode/code128.d ./Middlewares/lvgl_lib/src/libs/barcode/code128.o ./Middlewares/lvgl_lib/src/libs/barcode/code128.su ./Middlewares/lvgl_lib/src/libs/barcode/lv_barcode.cyclo ./Middlewares/lvgl_lib/src/libs/barcode/lv_barcode.d ./Middlewares/lvgl_lib/src/libs/barcode/lv_barcode.o ./Middlewares/lvgl_lib/src/libs/barcode/lv_barcode.su

.PHONY: clean-Middlewares-2f-lvgl_lib-2f-src-2f-libs-2f-barcode

