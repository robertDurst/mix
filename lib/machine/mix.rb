require './lib/machine/word'

# Knuth's theoretical machine
class Mix
  def initialize
    # 100 bytes
    @memory = 20.times.map { |_| Word.new }

    @register_a = Word.new
    @register_x = Word.new

    @register_i_1 = [PosNegSign.new, Byte.new, Byte.new]
    @register_i_2 = [PosNegSign.new, Byte.new, Byte.new]
    @register_i_3 = [PosNegSign.new, Byte.new, Byte.new]
    @register_i_4 = [PosNegSign.new, Byte.new, Byte.new]
    @register_i_5 = [PosNegSign.new, Byte.new, Byte.new]
    @register_i_6 = [PosNegSign.new, Byte.new, Byte.new]

    @register_j = [PosNegSign.new, Byte.new, Byte.new]

    @overflow_toggle = false
    @comparison_indicator = 'LESS' # LESS, EQUAL, or GREATER
  end
end
