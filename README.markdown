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
- Use a breadth-first search:
- Find the nearest valid squares.
- Save an array of visited squares so we don't revisit them. *Anything that launches from a revisited square cannot be the shortest path.*
- Repeat.
- Once the end square matches, return the sequence of squares that got us there.

## Results

`$ ./knights_travails.rb a8 g1 h3 g5 f4 d4 e2 d7 e5`
```
[ c7 ]
[ b6 ]
[ c7, e8 ]
[ c7, e6 ]
[ c7, d5 ]
[ c7, b5 ]
[ c7, a6 ]
[ b6, c8 ]
[ b6, c4 ]
[ b6, a4 ]
[ c7, e8, g7 ]
[ c7, e8, f6 ]
[ c7, e8, d6 ]
[ c7, e6, d8 ]
[ c7, e6, f8 ]
[ c7, e6, c5 ]
[ c7, d5, e7 ]
[ c7, d5, e3 ]
[ c7, d5, c3 ]
[ c7, d5, b4 ]
[ c7, b5, a7 ]
[ c7, b5, a3 ]
[ c7, a6, b8 ]
[ b6, c4, d2 ]
[ b6, c4, b2 ]
[ b6, c4, a5 ]
[ c7, e8, g7, h5 ]
[ c7, e8, g7, f5 ]
[ c7, e8, f6, g8 ]
[ c7, e8, f6, h7 ]
[ c7, e8, f6, g4 ]
[ c7, e8, f6, e4 ]
[ c7, e8, d6, f7 ]
[ c7, e8, d6, b7 ]
[ c7, e6, d8, c6 ]
[ c7, e6, f8, g6 ]
[ c7, e6, c5, d3 ]
[ c7, e6, c5, b3 ]
[ c7, d5, e3, g2 ]
[ c7, d5, e3, f1 ]
[ c7, d5, e3, d1 ]
[ c7, d5, e3, c2 ]
[ c7, d5, c3, b1 ]
[ c7, d5, c3, a2 ]
[ b6, c4, d2, f3 ]
[ c7, e8, g7, h5, g3 ]
[ c7, e8, g7, f5, h6 ]
[ c7, e8, g7, f5, h4 ]
[ c7, e8, f6, g4, h2 ]
[ c7, e8, f6, g4, f2 ]
[ c7, e8, d6, f7, h8 ]
[ c7, e6, c5, d3, e1 ]
[ c7, e6, c5, d3, c1 ]
[ c7, e6, c5, b3, a1 ]
[ b6, c4, d2, f3, g1 ]
```

## Review

Quite close to the author's solution.

Attempted with RubyTree, but could not access the end-nodes directly, so it made the solution too complex. Sticking with simple Arrays works better.

## License

This code is released under the [MIT License](http://www.opensource.org/licenses/MIT)


