################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Middlewares/lvgl_lib/src/libs/fsdrv/lv_fs_cbfs.c \
../Middlewares/lvgl_lib/src/libs/fsdrv/lv_fs_fatfs.c \
../Middlewares/lvgl_lib/src/libs/fsdrv/lv_fs_frogfs.c \
../Middlewares/lvgl_lib/src/libs/fsdrv/lv_fs_littlefs.c \
../Middlewares/lvgl_lib/src/libs/fsdrv/lv_fs_memfs.c \
../Middlewares/lvgl_lib/src/libs/fsdrv/lv_fs_posix.c \
../Middlewares/lvgl_lib/src/libs/fsdrv/lv_fs_stdio.c \
../Middlewares/lvgl_lib/src/libs/fsdrv/lv_fs_uefi.c \
../Middlewares/lvgl_lib/src/libs/fsdrv/lv_fs_win32.c 

OBJS += \
./Middlewares/lvgl_lib/src/libs/fsdrv/lv_fs_cbfs.o \
./Middlewares/lvgl_lib/src/libs/fsdrv/lv_fs_fatfs.o \
./Middlewares/lvgl_lib/src/libs/fsdrv/lv_fs_frogfs.o \
./Middlewares/lvgl_lib/src/libs/fsdrv/lv_fs_littlefs.o \
./Middlewares/lvgl_lib/src/libs/fsdrv/lv_fs_memfs.o \
./Middlewares/lvgl_lib/src/libs/fsdrv/lv_fs_posix.o \
./Middlewares/lvgl_lib/src/libs/fsdrv/lv_fs_stdio.o \
./Middlewares/lvgl_lib/src/libs/fsdrv/lv_fs_uefi.o \
./Middlewares/lvgl_lib/src/libs/fsdrv/lv_fs_win32.o 

C_DEPS += \
./Middlewares/lvgl_lib/src/libs/fsdrv/lv_fs_cbfs.d \
./Middlewares/lvgl_lib/src/libs/fsdrv/lv_fs_fatfs.d \
./Middlewares/lvgl_lib/src/libs/fsdrv/lv_fs_frogfs.d \
./Middlewares/lvgl_lib/src/libs/fsdrv/lv_fs_littlefs.d \
./Middlewares/lvgl_lib/src/libs/fsdrv/lv_fs_memfs.d \
./Middlewares/lvgl_lib/src/libs/fsdrv/lv_fs_posix.d \
./Middlewares/lvgl_lib/src/libs/fsdrv/lv_fs_stdio.d \
./Middlewares/lvgl_lib/src/libs/fsdrv/lv_fs_uefi.d \
./Middlewares/lvgl_lib/src/libs/fsdrv/lv_fs_win32.d 


# Each subdirectory must supply rules for building sources it contributes
Middlewares/lvgl_lib/src/libs/fsdrv/%.o Middlewares/lvgl_lib/src/libs/fsdrv/%.su Middlewares/lvgl_lib/src/libs/fsdrv/%.cyclo: ../Middlewares/lvgl_lib/src/libs/fsdrv/%.c Middlewares/lvgl_lib/src/libs/fsdrv/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F446xx -c -I../Application -I"C:/Users/shafg/Desktop/Projects_Firmware/sensor_platform/Middlewares/lvgl_lib" -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I../Middlewares/Third_Party/FreeRTOS/Source/include -I../Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS_V2 -I../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Middlewares-2f-lvgl_lib-2f-src-2f-libs-2f-fsdrv

clean-Middlewares-2f-lvgl_lib-2f-src-2f-libs-2f-fsdrv:
	-$(RM) ./Middlewares/lvgl_lib/src/libs/fsdrv/lv_fs_cbfs.cyclo ./Middlewares/lvgl_lib/src/libs/fsdrv/lv_fs_cbfs.d ./Middlewares/lvgl_lib/src/libs/fsdrv/lv_fs_cbfs.o ./Middlewares/lvgl_lib/src/libs/fsdrv/lv_fs_cbfs.su ./Middlewares/lvgl_lib/src/libs/fsdrv/lv_fs_fatfs.cyclo ./Middlewares/lvgl_lib/src/libs/fsdrv/lv_fs_fatfs.d ./Middlewares/lvgl_lib/src/libs/fsdrv/lv_fs_fatfs.o ./Middlewares/lvgl_lib/src/libs/fsdrv/lv_fs_fatfs.su ./Middlewares/lvgl_lib/src/libs/fsdrv/lv_fs_frogfs.cyclo ./Middlewares/lvgl_lib/src/libs/fsdrv/lv_fs_frogfs.d ./Middlewares/lvgl_lib/src/libs/fsdrv/lv_fs_frogfs.o ./Middlewares/lvgl_lib/src/libs/fsdrv/lv_fs_frogfs.su ./Middlewares/lvgl_lib/src/libs/fsdrv/lv_fs_littlefs.cyclo ./Middlewares/lvgl_lib/src/libs/fsdrv/lv_fs_littlefs.d ./Middlewares/lvgl_lib/src/libs/fsdrv/lv_fs_littlefs.o ./Middlewares/lvgl_lib/src/libs/fsdrv/lv_fs_littlefs.su ./Middlewares/lvgl_lib/src/libs/fsdrv/lv_fs_memfs.cyclo ./Middlewares/lvgl_lib/src/libs/fsdrv/lv_fs_memfs.d ./Middlewares/lvgl_lib/src/libs/fsdrv/lv_fs_memfs.o ./Middlewares/lvgl_lib/src/libs/fsdrv/lv_fs_memfs.su ./Middlewares/lvgl_lib/src/libs/fsdrv/lv_fs_posix.cyclo ./Middlewares/lvgl_lib/src/libs/fsdrv/lv_fs_posix.d ./Middlewares/lvgl_lib/src/libs/fsdrv/lv_fs_posix.o ./Middlewares/lvgl_lib/src/libs/fsdrv/lv_fs_posix.su ./Middlewares/lvgl_lib/src/libs/fsdrv/lv_fs_stdio.cyclo ./Middlewares/lvgl_lib/src/libs/fsdrv/lv_fs_stdio.d ./Middlewares/lvgl_lib/src/libs/fsdrv/lv_fs_stdio.o ./Middlewares/lvgl_lib/src/libs/fsdrv/lv_fs_stdio.su ./Middlewares/lvgl_lib/src/libs/fsdrv/lv_fs_uefi.cyclo ./Middlewares/lvgl_lib/src/libs/fsdrv/lv_fs_uefi.d ./Middlewares/lvgl_lib/src/libs/fsdrv/lv_fs_uefi.o ./Middlewares/lvgl_lib/src/libs/fsdrv/lv_fs_uefi.su ./Middlewares/lvgl_lib/src/libs/fsdrv/lv_fs_win32.cyclo ./Middlewares/lvgl_lib/src/libs/fsdrv/lv_fs_win32.d ./Middlewares/lvgl_lib/src/libs/fsdrv/lv_fs_win32.o ./Middlewares/lvgl_lib/src/libs/fsdrv/lv_fs_win32.su

.PHONY: clean-Middlewares-2f-lvgl_lib-2f-src-2f-libs-2f-fsdrv

