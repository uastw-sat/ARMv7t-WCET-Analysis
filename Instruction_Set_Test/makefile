################################################################################
# USAGE:
# make           .... build the program image
# make debug     .... build the program image and invoke gdb
# make clean     .... remove intermediate and generated files

################################################################################
# define the name of the generated output file
#
TARGET        = basic-thumb2-instructions

################################################################################
# below only edit with care
#
SRC           = $(wildcard src/*.s)
TOOLCHAIN     = arm-none-eabi
UC            = XMC4500
UC_ID         = 4503
CPU           = cortex-m4
GDB_ARGS      = -ex "target remote :2331" -ex "monitor reset" -ex "load" -ex "monitor reset"
LINKER_FILE   = ./src/xmc4500-1024.ld

CC   = $(TOOLCHAIN)-gcc
CP   = $(TOOLCHAIN)-objcopy
OD   = $(TOOLCHAIN)-objdump
GDB  = $(TOOLCHAIN)-gdb
SIZE = $(TOOLCHAIN)-size

ASFLAGS = -x assembler-with-cpp  
CFLAGS = -mthumb -mcpu=$(CPU)
CFLAGS+= -O0 -ffunction-sections -fdata-sections
CFLAGS+= -MD -std=c99 -Wall -fms-extensions
CFLAGS+= -DUC_ID=$(UC_ID) -DARM_MATH_CM4
CFLAGS+= -g3 -fmessage-length=0
LFLAGS = -nostartfiles -Wl,-Map=bin/$(TARGET).map
CPFLAGS = -Obinary
ODFLAGS = -S

OBJS  = $(SRC:.c=.o)

#### Rules ####
all: $(OBJS) $(TARGET).elf $(TARGET)

%.o: %.c
	$(CC) -c $(CFLAGS) $(ASFLAGS) $< -o $@

$(TARGET).elf: $(OBJS)
	mkdir -p bin/
	$(CC) -T $(LINKER_FILE) $(LFLAGS) $(CFLAGS) $(ASFLAGS) -o bin/$(TARGET).elf $(OBJS) $(LIBS)

$(TARGET): $(TARGET).elf
	$(CP) $(CPFLAGS) bin/$(TARGET).elf bin/$(TARGET).bin
	$(OD) $(ODFLAGS) bin/$(TARGET).elf > bin/$(TARGET).lst
	$(OD)  -d bin/$(TARGET).elf > bin/$(TARGET)_disasm.txt
	$(SIZE) bin/$(TARGET).elf

debug: $(TARGET)
	xterm -e "JLinkGDBServer -Device XMC4500-1024 -if SWD" &
	$(GDB) bin/$(TARGET).elf $(GDB_ARGS)

clean:
	rm -f src/*.o src/*.d bin/*
