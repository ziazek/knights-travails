# Knight's Travails

## About

Best of Ruby Quiz, Chapter 10

by Jason Bailey

Given a standard 8 x 8 chessboard where each position is indicated in algebraic notation (with the lower left corner being a1), design a script that accepts two or more arguments.

The first argument indicates the starting position of the knight. The second argument indicates the ending position of the knight. Any additional arguments indicate positions that are forbidden to the knight.

Return an array indicating the shortest path that the knight must travel to get to the end position without landing on one of the forbidden squares. If there is no valid path to the destination return nil.

```ruby
$ knights_travails a8 b7 b6
[ c7 , b5 , d6 , b7 ]

$ knights_travails a8 g6 b6 c7
nil
```

## Requirements

Ruby 2.2.2

## Usage

run `bundle install`

## Understanding the Question

- Accept capital letters and downcase them.

## Results

## Review

## License

This code is released under the [MIT License](http://www.opensource.org/licenses/MIT)


