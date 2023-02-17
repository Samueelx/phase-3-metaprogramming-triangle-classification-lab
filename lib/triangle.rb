class Triangle
  attr_accessor :one, :two, :three

  def initialize(one, two, three)
    @one = one
    @two = two
    @three = three
    @sides = []
    @sides.push(@one, @two, @three)  
  end

  def triangle_inequality?
    sorted_sides = @sides.sort
    if sorted_sides[0...-1].sum > @sides.max
      return true
    else return false
    end
  end

  def kind
    if self.one == 0 || self.two == 0 || self.three == 0
      raise TriangleError, "Each side must be larger than 0."
    elsif self.one < 0 || self.two < 0 || self.three < 0
      raise TriangleError, "Triangle cannot have negative value"
    elsif !self.triangle_inequality?
      raise TriangleError, "Failed triange inequality test."
    else self.type
    end
  end

  def type
    if @one == @two && @two == @three
      return :equilateral
    elsif !!@sides.combination(2).find{|a, b| a == b}
      return :isosceles
    else return :scalene
    end
  end

  class TriangleError < StandardError
  end
end

triangle = Triangle.new(3, 4, 3);
