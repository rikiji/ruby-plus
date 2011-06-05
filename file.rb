#!/usr/bin/ruby

class File
  def self.csv filename
    h = Hash.new
    File.open(filename,"r") do |f|
      f.each_line do |line|
        key, a = line.chomp.split(",").map{ |e| e.gsub(/"(.*)"/,"\\1") }      
        h[key] = a
      end
    end
    h
  end

  def group_line n
    a = Array.new
    self.each_line do |line|
      a << line
      if a.size == n
        yield a
        a = Array.new
      end
    end   
  end
end
