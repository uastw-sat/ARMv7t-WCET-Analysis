MEMORY
{
  PSRAM (rwx) : ORIGIN = 0x20000000, LENGTH = 64K
  ROM (rx)    : ORIGIN = 0x0C000000, LENGTH = 1024K
}

SECTIONS
{
  . = 0x0C000000;
  .text :
  {
      *(vectors)
      *(.text)
      *(.rodata)
  } >ROM
  .  = 0x20000000;
  .data :
  {
      *(.data)
  } >PSRAM AT > ROM
  .bss :
  {
      *(.bss)
  } >PSRAM AT > ROM
}
