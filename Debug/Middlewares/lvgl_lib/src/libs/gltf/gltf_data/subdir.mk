################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Middlewares/lvgl_lib/src/libs/gltf/gltf_data/lv_gltf_model_loader.c 

OBJS += \
./Middlewares/lvgl_lib/src/libs/gltf/gltf_data/lv_gltf_model_loader.o 

C_DEPS += \
./Middlewares/lvgl_lib/src/libs/gltf/gltf_data/lv_gltf_model_loader.d 


# Each subdirectory must supply rules for building sources it contributes
Middlewares/lvgl_lib/src/libs/gltf/gltf_data/%.o Middlewares/lvgl_lib/src/libs/gltf/gltf_data/%.su Middlewares/lvgl_lib/src/libs/gltf/gltf_data/%.cyclo: ../Middlewares/lvgl_lib/src/libs/gltf/gltf_data/%.c Middlewares/lvgl_lib/src/libs/gltf/gltf_data/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F446xx -c -I../Application -I"C:/Users/shafg/Desktop/Projects_Firmware/sensor_platform/Middlewares/lvgl_lib" -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I../Middlewares/Third_Party/FreeRTOS/Source/include -I../Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS_V2 -I../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Middlewares-2f-lvgl_lib-2f-src-2f-libs-2f-gltf-2f-gltf_data

clean-Middlewares-2f-lvgl_lib-2f-src-2f-libs-2f-gltf-2f-gltf_data:
	-$(RM) ./Middlewares/lvgl_lib/src/libs/gltf/gltf_data/lv_gltf_model_loader.cyclo ./Middlewares/lvgl_lib/src/libs/gltf/gltf_data/lv_gltf_model_loader.d ./Middlewares/lvgl_lib/src/libs/gltf/gltf_data/lv_gltf_model_loader.o ./Middlewares/lvgl_lib/src/libs/gltf/gltf_data/lv_gltf_model_loader.su

.PHONY: clean-Middlewares-2f-lvgl_lib-2f-src-2f-libs-2f-gltf-2f-gltf_data

