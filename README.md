# Chess Validator

A company that specializes in building mediocre games for social networking platforms has offered you a fistful of cash in the form of a one percent profit sharing agreement and free pizza. All you need to do is prove that you're the kind of rockstar programmer they need on staff by taking a simple test. Because you know that you're exactly the sort of ninja frogman devops superstar that they're looking for, you decide to give it a shot.

Your task is to create a Chess move validator: given a list of moves and a board, you are expected to determine whether each move is LEGAL or ILLEGAL. Some sample input and output files are provided to make this task a little bit easier for you to work on.

## The Board

The board is represented in the simple ASCII format shown below:

```
bR bN bB bQ bK bB bN bR
bP bP bP bP bP bP bP bP
-- -- -- -- -- -- -- --
-- -- -- -- -- -- -- --
-- -- -- -- -- -- -- --
-- -- -- -- -- -- -- --
wP wP wP wP wP wP wP wP
wR wN wB wQ wK wB wN wR
```

Each piece is represented by two characters. The first character represents the player's color, and the second character represents the rank of the piece. Empty squares are represented by `--`.

## Evaluating Moves

Moves are listed using coordinates similar to [algebraic chess notation](http://en.wikipedia.org/wiki/Algebraic_notation_%28chess%29), but start and ending positions are provided explicitly for each move to avoid the need to resolve ambiguities. One move is listed per line in the moves file, as shown below:

```
a2 a3
a2 a4
a2 a5
a7 a6
a7 a5
a7 a4
a7 b6
b8 a6
b8 c6
b8 d7
e2 e3
e3 e2
```

Each move should be evaluated independently against the provided board layout. The purpose of your validator will be to determine whether a given move is legal based on the initial board state: it is not meant to evaluate a sequence of moves.

While the _simple_moves.txt_ file only checks some basic pawn and knight moves, the _complex_moves.txt_ exercises most of the kinds of moves you would find in an ordinary chess game, as well as various forms of invalid moves. While you are expected to test for whether a move would be illegal due to creating a check condition, you can assume that no moves involve castling or en-passant conditions.

## Expected Output

For each move in your input file, there should be a corresponding line in your output file which indicates whether the move was LEGAL or ILLEGAL. For example, given the previously shown board (_simple_board.txt_) and move list (_simple_moves.txt_), your validator should output the following results:

```
LEGAL
LEGAL
ILLEGAL
LEGAL
LEGAL
ILLEGAL
ILLEGAL
LEGAL
LEGAL
ILLEGAL
LEGAL
ILLEGAL
```

## simple_board.txt

```
bR bN bB bQ bK bB bN bR
bP bP bP bP bP bP bP bP
-- -- -- -- -- -- -- --
-- -- -- -- -- -- -- --
-- -- -- -- -- -- -- --
-- -- -- -- -- -- -- --
wP wP wP wP wP wP wP wP
wR wN wB wQ wK wB wN wR
```

## simple_moves.txt

```
a2 a3
a2 a4
a2 a5
a7 a6
a7 a5
a7 a4
a7 b6
b8 a6
b8 c6
b8 d7
e2 e3
e3 e2
```

## simple_results.txt

```
LEGAL
LEGAL
ILLEGAL
LEGAL
LEGAL
ILLEGAL
ILLEGAL
LEGAL
LEGAL
ILLEGAL
LEGAL
ILLEGAL
```

## complex_board.txt

```
bK -- -- -- -- bB -- --
-- -- -- -- -- bP -- --
-- bP wR -- wB -- bN --
wN -- bP bR -- -- -- wP
-- -- -- -- wK wQ -- wP
wR -- bB wN wP -- -- --
-- wP bQ -- -- wP -- --
-- -- -- -- -- wB -- --
```

## complex_moves.txt

```
b2 b3
f2 b7
b4 a8
a8 g5
b2 b4
h7 f6
e3 b1
b7 e4
b2 b5
g7 g2
f7 f8
g7 e8
f5 g5
f7 f6
c3 a2
e1 c1
f7 f5
g8 c6
b2 d5
f7 f4
f6 f3
c5 f4
b6 a5
c3 d7
b2 f6
e4 d8
d2 g6
b2 c3
a3 g5
h6 e8
d3 b5
d6 f3
c5 c4
f6 a3
b7 c1
f1 f1
b6 b4
a7 e5
b6 c5
c2 e7
d4 f5
a7 g8
a7 d1
c5 b4
c4 e3
h4 h3
b5 b2
b2 g4
h3 h4
h8 d3
h8 h7
h2 h3
e8 c4
a3 a1
d3 b5
a3 a1
d5 d3
d5 f5
b4 f6
d5 g2
c8 d4
d5 b5
c6 d5
f3 b5
a1 g6
g6 e5
d3 e6
g6 a7
g6 h4
c6 d8
a3 h8
g8 f8
c7 f2
d3 c4
a5 a4
a5 b5
f1 a8
c2 g1
e5 a4
h5 f1
e6 g4
g5 h2
c3 b2
h2 c7
e6 f3
c3 c4
f1 c4
b3 a6
c4 b3
c1 h6
a5 c5
f4 f7
c2 c6
f6 g2
d2 a1
e4 a3
c2 d3
a8 c6
d6 d1
c2 e4
d6 g2
a6 a7
c2 c4
a8 a7
c4 d3
c3 h5
b4 c7
e6 d5
b6 d6
e5 f8
f1 f6
a8 a6
a8 c6
e4 e5
h2 a5
c8 e1
e3 h2
f3 h3
```
