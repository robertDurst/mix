class Byte
  attr_reader :content

  def initialize(content: [0, 0, 0, 0, 0, 0, 0, 0])\
    @content = content
  end

  def to_s
    "#{@content}"
  end
end
