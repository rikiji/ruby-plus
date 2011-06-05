#!/usr/bin/ruby

class String
  # string to range
  def to_r
    if self.match(/\.\./)
      Range.new(*self.split("..").map{|s|s.to_i})
    else
      Range.new(*[self.to_i,self.to_i])
    end
  end
end
