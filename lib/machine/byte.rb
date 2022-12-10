class Byte
  attr_reader :content

  def initialize(content: [0, 0, 0, 0, 0, 0, 0, 0])\
    @content = content
  end

  def to_decimal
    sum = 0

    @content.reverse.each_with_index do |num, i|
      sum += num * (2 ** i)
    end

    sum
  end

  def to_s
    "#{@content}"
  end
end
