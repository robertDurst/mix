class Number
  attr_reader :decimal, :binary, :bytes

  def initialize(number)
    @bits_per_byte = 8
    @bytes_per_number = 2

    raise "Overflow" if number >= (2 ** (@bytes_per_number * @bits_per_byte))

    @decimal = number
    @binary = decimal_to_binary(number)
    @bytes = to_bytes
  end

  def to_s
    output_str = ""

    @bytes.each do |byte|
      output_str << byte.to_s
    end

    output_str
  end

  def to_bytes
    bytes = []

    i = 0
    while i < @bytes_per_number
      bytes << Byte.new(content: @binary[i * @bits_per_byte, (i + 1) * @bits_per_byte])

      i += 1
    end

    bytes
  end

  private

  def decimal_to_binary(number)
    largest = round_down(Math.log2 number)
    nums = (@bytes_per_number * @bits_per_byte).times.map { |_| 0 }

    remainder = number
    while largest >= 0
      nums[largest] =  remainder / (2 ** largest)
      remainder = remainder % (2 ** largest)
      largest -= 1
    end

    nums.reverse
  end

  def round_down(num)
    rounded = num.round
    rounded < num ? rounded : rounded - 1
  end

  def binary_to_decimal
  end
end
