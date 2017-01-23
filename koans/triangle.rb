def triangle(a, b, c)
  
  s = (a + b + c) / 2.0
  
  # the following must be positive to be a valid triangle
  ok = (s - a) * (s - b) * (s - c)
  
  if a <= 0 || b <= 0 || c <= 0 || ok <= 0 then 
    raise TriangleError
  end
  
  if a == b && b == c then
    :equilateral
  elsif a == b || a == c || b == c then
    :isosceles
  else
    :scalene
  end
end

# Error class used in part 2.  No need to change this code.
class TriangleError < StandardError
end
