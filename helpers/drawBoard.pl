%% === Print functions === %%

% Start printing the board recursivly (loop style)
printBoard(Board) :-
  write('+--------------------------------+'),nl,
  write('|  |1 |2 |3 |4 |5 |6 |7 |8 |9 |10|'), nl,
  write('|--+--+--+--+--+--+--+--+--+--+--|'), nl,
  printBoard(Board, 1), !.
% Calls the PrintLine function and iterates
printBoard(Board, Line) :-
  printLine(Board, Line),
  printGrid,
  NextLine is Line + 1,
  printBoard(Board, NextLine).
% End of the loop
printBoard( _, 11) :-
  nl,!.

% Print a seperation line
printGrid :-
  write('|--+--+--+--+--+--+--+--+--+--+--|'), nl.

% Start printing a line recursivly (loop style)
printLine(Board, Line) :-
   write('|'),
   printLine(Board, Line, 0).
% Print a piece of the line then recursiv call
printLine(Board, Line, 0) :-
  write(Line),
  write(' |'),
  printLine(Board, Line, 1).
printLine(Board, Line, Col) :-
  getPiece(Board, Line, Col, Piece),
  pieceToSymbol(Piece, Symbol),
  write(Symbol),
  write('|'),
  NextCol is Col + 1,
  printLine(Board, Line, NextCol).
% End of the loop
printLine( _, _, 11) :- nl,!.

% Convert pice code to graphic symbol
pieceToSymbol(nl, '  ').
pieceToSymbol(em, '  ').
pieceToSymbol(bq, 'B ').
pieceToSymbol(wq, 'W ').
pieceToSymbol(bp, 'b ').
pieceToSymbol(wp, 'w ').
pieceToSymbol(Piece, Piece).
