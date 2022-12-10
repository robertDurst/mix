require './lib/machine/word'

# Knuth's theoretical machine
class Mix
  def initialize
    # 100 bytes
    @memory = 20.times.map { |_| Word.new }

    @register_a = Word.new
    @register_x = Word.new

    @register_i_1 = [1, Byte.new, Byte.new]
    @register_i_2 = [1, Byte.new, Byte.new]
    @register_i_3 = [1, Byte.new, Byte.new]
    @register_i_4 = [1, Byte.new, Byte.new]
    @register_i_5 = [1, Byte.new, Byte.new]
    @register_i_6 = [1, Byte.new, Byte.new]

    @register_j = [1, Byte.new, Byte.new]

    @overflow_toggle = 1
    @comparison_indicator = 0 # LESS, EQUAL, or GREATER
  end
end
