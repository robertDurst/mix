class PosNegSign
  def initialize
    @is_positive = true
  end

  def flip
    @is_positive = @is_positive ? false : true
  end

  def set_positive
    @is_positive = true
  end

  def set_negative
    @is_positive = false
  end

  def positive?
    @is_positive
  end

  def negative?
    @is_positive
  end

  def to_s
    "#{@is_positive ? '+' : '-'}"
  end
end
