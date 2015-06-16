#!/usr/bin/env ruby

require 'pry-byebug'

unless ARGV.size >= 2
  puts "Usage: #{$PROGRAM_NAME} START_POS(e.g. a8) END_POS *FORBIDDEN_POS"
  exit
end

# verify validity of args
args = ARGV.map do |argv|
  raise "#{argv} is invalid" unless /^[a-h][1-8]$/ === argv.downcase 
  argv.downcase
end

# loop and build tree for each possible square.
# once the answer is found, save the number of moves it took.
# all other trees to stop searching once the number of moves is exceeded.

class Square
  attr_accessor :letter, :number

  MOVES = [
    [-1, 2],
    [1, 2],
    [2, 1],
    [2, -1],
    [1, -2],
    [-1, -2],
    [-2, -1],
    [-2, 1]
  ]

  def initialize(letter, number)
    @letter = letter 
    @number = number
  end
end

class Knight
  attr_accessor :start_pos, :end_pos, :forbidden, :tree
  def initialize(start_pos, end_pos, forbidden)
    @start_pos = Square.new(*start_pos.chars)
    @end_pos = Square.new(*end_pos.chars)
    @forbidden = forbidden
    @tree = []
  end

  def shortest_path
    # todo
  end
end

knight = Knight.new(args.shift, args.shift, args)
knight.shortest_path

