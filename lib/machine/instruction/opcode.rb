module Machine
  module Instruction
    module Opcode
      NOP = 0
      # Add C = 1; F = field
      # SUB C = 2; F = field
      # MUL C = 3; F = field
      # DIV C = 4; F = field
      # NUM C = 5; F = 0
      # CHAR C = 5; F = 1
      # HLT C = 5; F = 2
      # SLA (shift left A) C = 6; F = 0
      # SRA (shift right A) C = 6; F = 1
      # SLAX (shift left AX) C = 6; F = 2
      # SRAX (shift right AX) C = 6; F = 3
      # SLC (shift left AX circularly) C = 6; F = 4
      # SRC (shirt right AX circularly) C = 6; F = 5
      # MOVE C = 7; F = number (normally 1)
      # LDA (load A) C = 8; F = field
      LDA = 8
      LDI_BASE = 8
      LDX = 15
      LDAN = 16
      LDIN_BASE = 16
      LDXN = 23
      STA = 24
      STI_BASE = 24
      STX = 31
      STJ = 32
      STZ = 33
      # JBUS C = 34; F = unit
      # IOC C = 35; F = unit
      # IN C = 36; F = unit
      # OUT C = 37; F = unit
      # JRED C = 38; F = unit
      # JMP (jump) C = 39; F = 0
      # JSJ (jump, save J) C = 39; F = 1
      # JOV (jump on overflow) C = 39; F = 2
      # JNOV (jump on no overflow) C = 39; F = 3
      # JL (jump on less than) C = 39; F = 4
      # JE (jump on equal to) C = 39; F = 5
      # JG (jump on greater than) C = 39; F = 6
      # JGE (jump on greater than or equal to) C = 39; F = 7
      # JNE (jump on not equal to) C = 39; F = 8
      # JLE (jump on less than or equal to) C = 39; F = 9
      # JAN (jump A negative) C = 40; F = 0
      # JAZ (jump A zero) C = 40; F = 1
      # JAP (jump A positive) C = 40; F = 2
      # JANN (jump A nonnegative) C = 40; F = 3
      # JANZ (jump A nonzero) C = 40; F = 4
      # JANP (jump A nonpositive) C = 40; F = 5
      # JiN (jump i negative) C = 40 + i; F = 0
      # JiZ (jump i zero) C = 40 + i; F = 1
      # JiP (jump i positive) C = 40 + i; F = 2
      # JiNN (jump i nonnegative) C = 40 + i; F = 3
      # JiNZ (jump i nonzero) C = 40 + i; F = 4
      # JiNP (jump i nonpositive) C = 40 + i; F = 5
      # JXN (jump X negative) C = 47; F = 0
      # JXZ (jump X zero) C = 47; F = 1
      # JXP (jump X positive) C = 47; F = 2
      # JXNN (jump X nonnegative) C = 47; F = 3
      # JXNZ (jump X nonzero) C = 47; F = 4
      # JXNP (jump X nonpositive) C = 47; F = 5
      INCA = 48
      DECA = 48
      ENTA = 48
      ENNA = 48
      INCI_BASE = 48
      DECI_BASE = 48
      ENTI_BASE = 48
      ENNI_BASE = 48
      INCX = 55
      DECX = 55
      ENTX = 55
      ENNX = 55
      # CMPA (compare A) C = 56; F = field
      # CMPi (compare i) C = 56 + i; F = field
      # CMPX (compare X) C = 63; F = field
    end
  end
end
