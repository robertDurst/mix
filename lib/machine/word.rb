require './lib/machine/byte'

class Word
  def initialize(
    # 0 = +
    # 1 = -
    sign: 0,

    # address/value
    byte_1: Byte.new,
    byte_2: Byte.new,

    # index
    byte_3: Byte.new,

    # field
    byte_4: Byte.new,

    # op code
    byte_5: Byte.new
  )
    @content = [sign, byte_1, byte_2, byte_3, byte_4, byte_5]
  end

  def sign
    @content[0]
  end

  def byte_1
    @content[1]
  end

  def byte_2
    @content[2]
  end

  def byte_3
    @content[3]
  end

  def byte_4
    @content[4]
  end

  def byte_5
    @content[5]
  end

  def to_s
    output_str = "|"

    output_str << sign == 0 ? "+" : "-"
    output_str << " #{byte_1.to_s}"
    output_str << " #{byte_2.to_s}"
    output_str << " #{byte_3.to_s}"
    output_str << " #{byte_4.to_s}"
    output_str << " #{byte_5.to_s}"

    output_str << "|"
  end
end
