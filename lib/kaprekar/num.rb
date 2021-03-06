# Monkey patch Fixnum class to sort a string (assumes input is integers)
class Fixnum
  def backward_sort
    self.to_s.split('').sort.reverse.join.to_i
  end

  def forward_sort
    self.to_s.split('').sort.join.to_i
  end
end
