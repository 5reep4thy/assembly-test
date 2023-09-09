.global _start
.align 2
_start:
  ADR X1, helloworld3
  LDR X1, hexstr
  ADRP X2, helloworld@PAGE
  ADRP X4, helloworld2@PAGE
  MOV X3, X2
  ADD X2, X2, helloworld@PAGEOFF
  ADD X4, X4, helloworld2@PAGEOFF
  MOV X0, #0x0001
  MOV X1, #0xff10
  BL add2nos
  MOV X0, #0x10
  ADRP X2, regtext@PAGE
  ADD X2, X2, regtext@PAGEOFF
  B printregister
printregister:
  AND X6, X5, #0xf
  CMP X6, #10
  B.GE putalpha
  ADD X6, X6, #'0'
  STRB W6, [X2]
  LSR X5, X5, #4
  ADD X2, X2, #1
  SUBS X0, X0, #0x1
  B.NE printregister
  MOV X0, #1
  ADRP X1, regtext@PAGE
  ADD X1, X1, regtext@PAGEOFF
  MOV X2, #0x10
  MOV x16, #4
  SVC #0x80

  MOV X0, #0x0
  MOV x16, #0x1
  SVC #0x80
putalpha:
  ADD X6, X6, #('a'-10)
  STRB W6, [X2]
  LSR X5, X5, #4
  ADD X2, X2, #1
  SUBS X0, X0, #0x1
  B.NE printregister



  


helloworld3: .ascii  "Hello World!\n"

.data
helloworld: .ascii "Hello World\n"
helloworld2: .ascii "H2llo World\n"

regtext: .fill 8, 8, 0xf

.text
.align 4
hexstr: .word 0xffffff

.align 4
datai:
.word 0xffffff
