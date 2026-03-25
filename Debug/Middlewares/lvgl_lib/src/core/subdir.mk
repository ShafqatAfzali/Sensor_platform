################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Middlewares/lvgl_lib/src/core/lv_group.c \
../Middlewares/lvgl_lib/src/core/lv_obj.c \
../Middlewares/lvgl_lib/src/core/lv_obj_class.c \
../Middlewares/lvgl_lib/src/core/lv_obj_draw.c \
../Middlewares/lvgl_lib/src/core/lv_obj_event.c \
../Middlewares/lvgl_lib/src/core/lv_obj_id_builtin.c \
../Middlewares/lvgl_lib/src/core/lv_obj_pos.c \
../Middlewares/lvgl_lib/src/core/lv_obj_property.c \
../Middlewares/lvgl_lib/src/core/lv_obj_scroll.c \
../Middlewares/lvgl_lib/src/core/lv_obj_style.c \
../Middlewares/lvgl_lib/src/core/lv_obj_style_gen.c \
../Middlewares/lvgl_lib/src/core/lv_obj_tree.c \
../Middlewares/lvgl_lib/src/core/lv_observer.c \
../Middlewares/lvgl_lib/src/core/lv_refr.c 

OBJS += \
./Middlewares/lvgl_lib/src/core/lv_group.o \
./Middlewares/lvgl_lib/src/core/lv_obj.o \
./Middlewares/lvgl_lib/src/core/lv_obj_class.o \
./Middlewares/lvgl_lib/src/core/lv_obj_draw.o \
./Middlewares/lvgl_lib/src/core/lv_obj_event.o \
./Middlewares/lvgl_lib/src/core/lv_obj_id_builtin.o \
./Middlewares/lvgl_lib/src/core/lv_obj_pos.o \
./Middlewares/lvgl_lib/src/core/lv_obj_property.o \
./Middlewares/lvgl_lib/src/core/lv_obj_scroll.o \
./Middlewares/lvgl_lib/src/core/lv_obj_style.o \
./Middlewares/lvgl_lib/src/core/lv_obj_style_gen.o \
./Middlewares/lvgl_lib/src/core/lv_obj_tree.o \
./Middlewares/lvgl_lib/src/core/lv_observer.o \
./Middlewares/lvgl_lib/src/core/lv_refr.o 

C_DEPS += \
./Middlewares/lvgl_lib/src/core/lv_group.d \
./Middlewares/lvgl_lib/src/core/lv_obj.d \
./Middlewares/lvgl_lib/src/core/lv_obj_class.d \
./Middlewares/lvgl_lib/src/core/lv_obj_draw.d \
./Middlewares/lvgl_lib/src/core/lv_obj_event.d \
./Middlewares/lvgl_lib/src/core/lv_obj_id_builtin.d \
./Middlewares/lvgl_lib/src/core/lv_obj_pos.d \
./Middlewares/lvgl_lib/src/core/lv_obj_property.d \
./Middlewares/lvgl_lib/src/core/lv_obj_scroll.d \
./Middlewares/lvgl_lib/src/core/lv_obj_style.d \
./Middlewares/lvgl_lib/src/core/lv_obj_style_gen.d \
./Middlewares/lvgl_lib/src/core/lv_obj_tree.d \
./Middlewares/lvgl_lib/src/core/lv_observer.d \
./Middlewares/lvgl_lib/src/core/lv_refr.d 


# Each subdirectory must supply rules for building sources it contributes
Middlewares/lvgl_lib/src/core/%.o Middlewares/lvgl_lib/src/core/%.su Middlewares/lvgl_lib/src/core/%.cyclo: ../Middlewares/lvgl_lib/src/core/%.c Middlewares/lvgl_lib/src/core/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F446xx -c -I../Application -I"C:/Users/shafg/Desktop/Projects_Firmware/sensor_platform/Middlewares/lvgl_lib" -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I../Middlewares/Third_Party/FreeRTOS/Source/include -I../Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS_V2 -I../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Middlewares-2f-lvgl_lib-2f-src-2f-core

clean-Middlewares-2f-lvgl_lib-2f-src-2f-core:
	-$(RM) ./Middlewares/lvgl_lib/src/core/lv_group.cyclo ./Middlewares/lvgl_lib/src/core/lv_group.d ./Middlewares/lvgl_lib/src/core/lv_group.o ./Middlewares/lvgl_lib/src/core/lv_group.su ./Middlewares/lvgl_lib/src/core/lv_obj.cyclo ./Middlewares/lvgl_lib/src/core/lv_obj.d ./Middlewares/lvgl_lib/src/core/lv_obj.o ./Middlewares/lvgl_lib/src/core/lv_obj.su ./Middlewares/lvgl_lib/src/core/lv_obj_class.cyclo ./Middlewares/lvgl_lib/src/core/lv_obj_class.d ./Middlewares/lvgl_lib/src/core/lv_obj_class.o ./Middlewares/lvgl_lib/src/core/lv_obj_class.su ./Middlewares/lvgl_lib/src/core/lv_obj_draw.cyclo ./Middlewares/lvgl_lib/src/core/lv_obj_draw.d ./Middlewares/lvgl_lib/src/core/lv_obj_draw.o ./Middlewares/lvgl_lib/src/core/lv_obj_draw.su ./Middlewares/lvgl_lib/src/core/lv_obj_event.cyclo ./Middlewares/lvgl_lib/src/core/lv_obj_event.d ./Middlewares/lvgl_lib/src/core/lv_obj_event.o ./Middlewares/lvgl_lib/src/core/lv_obj_event.su ./Middlewares/lvgl_lib/src/core/lv_obj_id_builtin.cyclo ./Middlewares/lvgl_lib/src/core/lv_obj_id_builtin.d ./Middlewares/lvgl_lib/src/core/lv_obj_id_builtin.o ./Middlewares/lvgl_lib/src/core/lv_obj_id_builtin.su ./Middlewares/lvgl_lib/src/core/lv_obj_pos.cyclo ./Middlewares/lvgl_lib/src/core/lv_obj_pos.d ./Middlewares/lvgl_lib/src/core/lv_obj_pos.o ./Middlewares/lvgl_lib/src/core/lv_obj_pos.su ./Middlewares/lvgl_lib/src/core/lv_obj_property.cyclo ./Middlewares/lvgl_lib/src/core/lv_obj_property.d ./Middlewares/lvgl_lib/src/core/lv_obj_property.o ./Middlewares/lvgl_lib/src/core/lv_obj_property.su ./Middlewares/lvgl_lib/src/core/lv_obj_scroll.cyclo ./Middlewares/lvgl_lib/src/core/lv_obj_scroll.d ./Middlewares/lvgl_lib/src/core/lv_obj_scroll.o ./Middlewares/lvgl_lib/src/core/lv_obj_scroll.su ./Middlewares/lvgl_lib/src/core/lv_obj_style.cyclo ./Middlewares/lvgl_lib/src/core/lv_obj_style.d ./Middlewares/lvgl_lib/src/core/lv_obj_style.o ./Middlewares/lvgl_lib/src/core/lv_obj_style.su ./Middlewares/lvgl_lib/src/core/lv_obj_style_gen.cyclo ./Middlewares/lvgl_lib/src/core/lv_obj_style_gen.d ./Middlewares/lvgl_lib/src/core/lv_obj_style_gen.o ./Middlewares/lvgl_lib/src/core/lv_obj_style_gen.su ./Middlewares/lvgl_lib/src/core/lv_obj_tree.cyclo ./Middlewares/lvgl_lib/src/core/lv_obj_tree.d ./Middlewares/lvgl_lib/src/core/lv_obj_tree.o ./Middlewares/lvgl_lib/src/core/lv_obj_tree.su ./Middlewares/lvgl_lib/src/core/lv_observer.cyclo ./Middlewares/lvgl_lib/src/core/lv_observer.d ./Middlewares/lvgl_lib/src/core/lv_observer.o ./Middlewares/lvgl_lib/src/core/lv_observer.su ./Middlewares/lvgl_lib/src/core/lv_refr.cyclo ./Middlewares/lvgl_lib/src/core/lv_refr.d ./Middlewares/lvgl_lib/src/core/lv_refr.o ./Middlewares/lvgl_lib/src/core/lv_refr.su

.PHONY: clean-Middlewares-2f-lvgl_lib-2f-src-2f-core

