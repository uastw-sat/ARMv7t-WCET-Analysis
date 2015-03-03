GCC output: 
cmp/basic-thumb2-instructions_gccdisasm.txt
bin/disasm-gcc.txt

ARMv7-Loader output: 
cmp/basic-thumb2-instructions_loaderdisasm.txt
bin/disasm-armv7-loader.txt

##################################################
Equivalences
##################################################
BKPT 0x<imm8> == BKPT #<imm8>(gcc prints hex value, armv7 reference manual says #<imm8>)
STM == STMIA
LDM == LDMIA

MOV{s}.w Rd, Rn , {ASR,LSL, LSR, ROR, RRX} #value == {ASR,LSL,LSR,ROR,RRX}{s} Rd, Rn #value

ldr.w r8, [sp], #4 == pop.w r8
str.w lr [sp, #-4] == push.w lr

GCC uses cpsr instead of apsr:
  *) MSR reg, apsr == MRS reg, cpsr
  *) MRS apsr_nzcvq, reg == MRS cpsr_f, reg
  *) MRS apsr_g, reg == MRS cpsr_s, reg
  *) MRS apsr_nzcvqg, reg == MRS cpsr_fs, reg