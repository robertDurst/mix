require './lib/machine/number'

# TODO: handle field
module InstructionGenerator
  # NOP C = 0
  def self.NOP
    base_word(op_code: 0)
  end

  # Add C = 1; F = field
  def self.Add(address:)
    base_word(op_code: 1, address_or_value: address)
  end

  # SUB C = 2; F = field
  def self.Add(address:)
    base_word(op_code: 2, address_or_value: address)
  end

  # MUL C = 3; F = field
  def self.Add(address:)
    base_word(op_code: 3, address_or_value: address)
  end

  # DIV C = 4; F = field
  def self.Add(address:)
    base_word(op_code: 4, address_or_value: address)
  end

  # NUM C = 5; F = 0
  # TODO: handle F
  def self.NUM(address:)
    base_word(op_code: 5)
  end

  # CHAR C = 5; F = 1
  # TODO: handle F
  def self.CHAR(address:)
    base_word(op_code: 5)
  end

  # HLT C = 5; F = 2
  # TODO: handle F
  def self.HLT(address:)
    base_word(op_code: 5)
  end

  # SLA (shift left A) C = 6; F = 0
  # TODO: handle F
  def self.SLA
    base_word(op_code: 6)
  end

  # SRA (shift right A) C = 6; F = 1
  # TODO: handle F
  def self.SRA
    base_word(op_code: 6)
  end

  # SLAX (shift left AX) C = 6; F = 2
  # TODO: handle F
  def self.SLAX
    base_word(op_code: 6)
  end

  # SRAX (shift right AX) C = 6; F = 3
  # TODO: handle F
  def self.SRAX
    base_word(op_code: 6)
  end

  # SLC (shift left AX circularly) C = 6; F = 4
  # TODO: handle F
  def self.SLC
    base_word(op_code: 6)
  end

  # SRC (shift right AX circularly) C = 6; F = 5
  # TODO: handle F
  def self.SRC
    base_word(op_code: 6)
  end

  # MOVE C = 7; F = number (normally 1)
 # TODO: handle F
  def self.SRC(address:)
    base_word(op_code: 7, address_or_value: address)
  end

  # LDA (load A) C = 8; F = field
  def self.LDA(address:)
    base_word(op_code: 8, address_or_value: address)
  end

  # LDi (load i) C = 8 + i; F = field
  def self.LDi(address:, index:)
    base_word(op_code: 8 + index, address_or_value: address)
  end

  # LDX (load X) C = 15; F = field
  def self.LDX(address:)
    base_word(op_code: 15, address_or_value: address)
  end

  # LDAN (load A negative) C = 16; F = field
  def self.LDAN(address:)
    base_word(op_code: 16, address_or_value: address, negative: true)
  end

  # LDiN (load i negative) C = 16 + i; F = field
  def self.LDiN(address:, index:)
    base_word(op_code: 16 + index, address_or_value: address, negative: true)
  end

  # LDXN (load X negative) C = 23; F = field
  def self.LDXN(address:)
    base_word(op_code: 23, address_or_value: address, negative: true)
  end

  # STA (store A) C = 24; F = field
  def self.STA(address:)
    base_word(op_code: 24, address_or_value: address)
  end

  # STi (store i) C = 24 + i; F = field
  def self.STi(address:, index:)
    base_word(op_code: 24 + index, address_or_value: address)
  end

  # STX (store X) C = 31; F = field
  def self.STX(address:)
    base_word(op_code: 31, address_or_value: address)
  end

  # STJ (store J) C = 32; F = field
  def self.STJ(address:)
    base_word(op_code: 32, address_or_value: address)
  end

  # STZ (store zero) C = 33; F = field
  def self.STZ(address:)
    base_word(op_code: 33, address_or_value: address)
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

  def self.base_word(op_code:, address_or_value: nil, negative: false)
    word = Word.new
    word.byte_5 = Number.new(op_code, bytes: 1).bytes[0]

    if address_or_value
      address_or_value_bytes = Number.new(address_or_value, bytes: 2).bytes
      word.byte_1 = address_or_value_bytes[0]
      word.byte_2 = address_or_value_bytes[1]
    end

    word.sign.set_negative if negative

    word
  end
end
