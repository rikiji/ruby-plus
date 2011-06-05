#!/usr/bin/ruby

class Array
  def sum
    inject(0) do |sum,x|
      sum+x
    end
  end

  def avg
    sum / size.to_f
  end
  
  def rand
    self[Kernel.rand self.size]
  end
end
