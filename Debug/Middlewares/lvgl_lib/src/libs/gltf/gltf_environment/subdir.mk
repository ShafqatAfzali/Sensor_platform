################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Middlewares/lvgl_lib/src/libs/gltf/gltf_environment/lv_gltf_ibl_sampler.c 

OBJS += \
./Middlewares/lvgl_lib/src/libs/gltf/gltf_environment/lv_gltf_ibl_sampler.o 

C_DEPS += \
./Middlewares/lvgl_lib/src/libs/gltf/gltf_environment/lv_gltf_ibl_sampler.d 


# Each subdirectory must supply rules for building sources it contributes
Middlewares/lvgl_lib/src/libs/gltf/gltf_environment/%.o Middlewares/lvgl_lib/src/libs/gltf/gltf_environment/%.su Middlewares/lvgl_lib/src/libs/gltf/gltf_environment/%.cyclo: ../Middlewares/lvgl_lib/src/libs/gltf/gltf_environment/%.c Middlewares/lvgl_lib/src/libs/gltf/gltf_environment/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F446xx -c -I../Application -I"C:/Users/shafg/Desktop/Projects_Firmware/sensor_platform/Middlewares/lvgl_lib" -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I../Middlewares/Third_Party/FreeRTOS/Source/include -I../Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS_V2 -I../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Middlewares-2f-lvgl_lib-2f-src-2f-libs-2f-gltf-2f-gltf_environment

clean-Middlewares-2f-lvgl_lib-2f-src-2f-libs-2f-gltf-2f-gltf_environment:
	-$(RM) ./Middlewares/lvgl_lib/src/libs/gltf/gltf_environment/lv_gltf_ibl_sampler.cyclo ./Middlewares/lvgl_lib/src/libs/gltf/gltf_environment/lv_gltf_ibl_sampler.d ./Middlewares/lvgl_lib/src/libs/gltf/gltf_environment/lv_gltf_ibl_sampler.o ./Middlewares/lvgl_lib/src/libs/gltf/gltf_environment/lv_gltf_ibl_sampler.su

.PHONY: clean-Middlewares-2f-lvgl_lib-2f-src-2f-libs-2f-gltf-2f-gltf_environment

