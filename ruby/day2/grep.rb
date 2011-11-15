#!/usr/bin/env ruby

filename = ARGV[0]
pattern = ARGV[1]
num = 0

# THE WORLD'S DUMBEST GREP PROGRAM

File.open(filename, 'r').each do |line|
  puts "#{num}: #{line}" if line.match /#{pattern}/
  num += 1
end
