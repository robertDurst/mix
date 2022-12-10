require './lib/machine/byte'
require './lib/machine/pos_neg_sign'

class Word
  attr_accessor :sign, :byte_1, :byte_2, :byte_3, :byte_4, :byte_5

  def initialize(
    sign: PosNegSign.new,

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
    @sign = sign
    @byte_1 = byte_1
    @byte_2 = byte_2
    @byte_3 = byte_3
    @byte_4 = byte_4
    @byte_5 = byte_5
  end

  def to_s
    output_str = "|"

    output_str << sign
    output_str << " #{byte_1.to_s}"
    output_str << " #{byte_2.to_s}"
    output_str << " #{byte_3.to_s}"
    output_str << " #{byte_4.to_s}"
    output_str << " #{byte_5.to_s}"

    output_str << "|"
  end
end
