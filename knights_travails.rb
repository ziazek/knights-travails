#!/usr/bin/env ruby

require 'pry-byebug'
require 'tree'

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
    @number = number.to_i
  end

  def to_s
    "#{letter}#{number}"
  end

  def valid_moves(forbidden, visited_squares)
    result = []
    MOVES.each do |move|
      valid_letters = ("a".."h").to_a
      valid_numbers = (1..8).to_a
      current_letter_index = valid_letters.index(letter)
      current_number_index = valid_numbers.index(number)
      new_letter_index = current_letter_index + move[0]
      new_number_index = current_number_index + move[1]
      # next if the square is invalid
      next unless (0..7) === new_letter_index && (0..7) === new_number_index
      new_square =  Square.new(valid_letters[new_letter_index], valid_numbers[new_number_index])
      # next if the square is forbidden
      next if forbidden.include?(new_square.to_s)
      # don't visit already-visited squares
      next if visited_squares.include?(new_square.to_s)
      result << new_square
    end
    result
  end
end

class NoValidMoves < StandardError; end

class Knight
  attr_accessor :start_pos, :end_pos, :forbidden, :tree, :current_lines, :visited_squares
  def initialize(start_pos, end_pos, forbidden)
    @start_pos = Square.new(*start_pos.chars)
    @end_pos = Square.new(*end_pos.chars)
    @forbidden = forbidden
    @current_lines = [[@start_pos]] # an array of arrays
    @visited_squares = [start_pos]
  end

  def shortest_path
    # root node is the start pos
    path = catch(:found) do
      loop do
        add_next_moves
      end
    end
    pretty_print(path)
  rescue NoValidMoves
    puts 'nil'
  end

  def add_next_moves
    new_lines = []
    # binding.pry
    self.current_lines.each do |line|
      square = line.last
      square.valid_moves(forbidden, visited_squares).each do |sq|
        new_line = line.dup << sq 
        new_lines << new_line
        visited_squares << sq.to_s

        # binding.pry
        throw(:found, new_line) if sq.to_s == end_pos.to_s
        pretty_print(new_line)
      end
    end
    raise NoValidMoves if new_lines.empty?
    self.current_lines = new_lines
  end

  def pretty_print(path)
    print "[ "
    print path.drop(1).map(&:to_s).join ', '
    print " ]"
    puts
  end
end

knight = Knight.new(args.shift, args.shift, args)
knight.shortest_path

