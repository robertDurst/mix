class Number
  attr_reader :decimal, :binary, :bytes

  def initialize(number, bytes: 2)
    @bits_per_byte = 8
    @bytes_per_number = bytes

    raise "Overflow" if number >= (2 ** (@bytes_per_number * @bits_per_byte))

    @decimal = number
    @binary = decimal_to_binary(number)
    @bytes = to_bytes
  end

  def self.bytes_to_decimal(bytes)
    sum = 0

    bytes.reverse.each_with_index do |byte, i|
      byte.content.reverse.each_with_index do |num, j|
        sum += num * (2 ** ((i * 8) + j))
      end
    end

    sum
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
      bytes << Byte.new(content: @binary[i * @bits_per_byte .. ((i + 1) * @bits_per_byte) - 1])

      i += 1
    end

    bytes
  end

  private

  def decimal_to_binary(number)
    return (@bytes_per_number * @bits_per_byte).times.map { |_| 0 } if number == 0

    largest = round_down(Math.log2 number)
    nums = (@bytes_per_number * @bits_per_byte).times.map { |_| 0 }

    remainder = number
    while largest >= 0
      nums[largest] =  remainder / (2 ** largest)
      remainder = remainder % (2 ** largest)

      largest -= 1
    end

    nums[0..(@bytes_per_number * @bits_per_byte - 1)].reverse
  end

  def round_down(num)
    rounded = num.round
    # rounded < num ? rounded : rounded - 1
  end

  def binary_to_decimal
  end
end
