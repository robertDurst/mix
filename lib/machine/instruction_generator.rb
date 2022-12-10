require './lib/machine/number'

# TODO: handle field
module InstructionGenerator
  # NOP C = 0
  def self.NOP
    word = Word.new
    word.byte_5 = Number.new(0, bytes: 1).bytes[0]
  end

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
  # LDi (load i) C = 8 + i; F = field
  # LDX (load X) C = 15; F = field
  # LDAN (load A negative) C = 16; F = field
  # LDiN (load i negative) C = 16 + i; F = field
  # LDXN (load X negative) C = 23; F = field
  # STA (store A) C = 24; F = field
  def self.STA(value:)
    word = Word.new
    word.byte_5 = Number.new(24, bytes: 1).bytes[0]

    value_bytes = Number.new(value, bytes: 2).bytes
    word.byte_1 = value_bytes[0]
    word.byte_2 = value_bytes[1]

    word
  end

  # STi (store i) C = 24 + i; F = field
  def self.STi(value:, index:)
    word = Word.new
    word.byte_5 = Number.new(24 + index, bytes: 1).bytes[0]

    value_bytes = Number.new(value, bytes: 2).bytes
    word.byte_1 = value_bytes[0]
    word.byte_2 = value_bytes[1]

    word
  end

  # STX (store X) C = 31; F = field
  def self.STX(value:)
    word = Word.new
    word.byte_5 = Number.new(31, bytes: 1).bytes[0]

    value_bytes = Number.new(value, bytes: 2).bytes
    word.byte_1 = value_bytes[0]
    word.byte_2 = value_bytes[1]

    word
  end

  # STJ (store J) C = 32; F = field
  def self.STJ(value:)
    word = Word.new
    word.byte_5 = Number.new(32, bytes: 1).bytes[0]

    value_bytes = Number.new(value, bytes: 2).bytes
    word.byte_1 = value_bytes[0]
    word.byte_2 = value_bytes[1]

    word
  end

  # STZ (store zero) C = 33; F = field
  def self.STZ(address:)
    word = Word.new
    word.byte_5 = Number.new(33, bytes: 1).bytes[0]

    address_bytes = Number.new(address, bytes: 2).bytes
    word.byte_1 = address_bytes[0]
    word.byte_2 = address_bytes[1]

    word
  end

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
  # DECA (decrease A) C = 48; F = 1
  # INCA (increase A) C = 48; F = 0
  # ENTA (enter A) C = 48; F = 2
  # ENNA (enter negative A) C = 48; F = 3
  # INCi (increase i) C = 48 + i; F = 0
  # DECi (decrease i) C = 48 + i; F = 1
  # ENTi (enter i) C = 48 + i; F = 2
  # ENNi (enter negative i) C = 48 + i; F = 3
  # INCX (increase X) C = 55; F = 0
  # DECX (decrease X) C = 55; F = 1
  # ENTX (enter X) C = 55; F = 2
  # ENNX (enter negative X) C = 55; F = 3
  # CMPA (compare A) C = 56; F = field
  # CMPi (compare i) C = 56 + i; F = field
  # CMPX (compare X) C = 63; F = field
end
