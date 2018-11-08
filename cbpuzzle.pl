:- use_module(library(lambda)).

cbpuzzle :-
	cbpuzzle(Moves),
	display(Moves).

cbpuzzle(Moves) :-
	play([1], [2,3,4,5,6,7,8,9,10,11,12,13,14,15], [], Moves).

play(_, [_], List, Moves) :-
	reverse(List, Moves).

play(To, Over, List, Moves) :-
	select(F, Over, Ov1),
	select(O, Ov1, Ov2),
	select(T, To, T1),
	move(F, O, T),
	play([F, O | T1], [T | Ov2], [move(F,O,T) | List], Moves).



move(F,2,T) :-
	member([F,T], [[1,4], [4,1]]).

move(F,3,T) :-
	member([F,T], [[1,6], [6,1]]).

move(F,4,T) :-
	member([F,T], [[2,7], [7,2]]).

move(F,5,T) :-
	member([F,T], [[2,9], [9,2]]).

move(F,5,T) :-
	member([F,T], [[3,8], [8,3]]).

move(F,6,T) :-
	member([F,T], [[3,10], [10,3]]).

move(F,5,T) :-
	member([F,T], [[4,6], [6,4]]).

move(F,7,T) :-
	member([F,T], [[4,11], [11,4]]).

move(F,8,T) :-
	member([F,T], [[4,13], [13,4]]).

move(F,8,T) :-
	member([F,T], [[5,12], [12,5]]).

move(F,9,T) :-
	member([F,T], [[5,14], [14,5]]).

move(F,9,T) :-
	member([F,T], [[6,13], [13,6]]).

move(F,10,T) :-
	member([F,T], [[6,15], [15,6]]).

move(F,8,T) :-
	member([F,T], [[9,7], [7,9]]).

move(F,9,T) :-
	member([F,T], [[10,8], [8,10]]).

move(F,12,T) :-
	member([F,T], [[11,13], [13,11]]).

move(F,13,T) :-
	member([F,T], [[12,14], [14,12]]).

move(F,14,T) :-
	member([F,T], [[15,13], [13,15]]).



display(Solutions) :-
	display(Solutions, [1]).

display([], To) :-
	numlist(1, 15, List),
	maplist(\X^I^(member(X, To) -> I = 0; I = 1),
		List,
		[I1,I2,I3,I4,I5,I6,I7,I8,I9,I10,I11,I12,I13,I14,I15]),
	format('    ~w        ~n', [I1]),
	format('   ~w ~w      ~n', [I2,I3]),
	format('  ~w ~w ~w    ~n', [I4,I5,I6]),
	format(' ~w ~w ~w ~w  ~n', [I7,I8,I9,I10]),
	format('~w ~w ~w ~w ~w~n', [I11,I12,I13,I14,I15]),
        writeln(solved).

display([move(Start, Middle, Ending) | Tail], To) :-
	numlist(1, 15, List),
	maplist(\X^I^(member(X, To) -> I = 0; I = 1),
		List,
		[I1,I2,I3,I4,I5,I6,I7,I8,I9,I10,I11,I12,I13,I14,I15]),
	format('    ~w        ~n', [I1]),
	format('   ~w ~w      ~n', [I2,I3]),
	format('  ~w ~w ~w    ~n', [I4,I5,I6]),
	format(' ~w ~w ~w ~w  ~n', [I7,I8,I9,I10]),
	format('~w ~w ~w ~w ~w~n', [I11,I12,I13,I14,I15]),
	format('From ~w to ~w over ~w~n~n~n', [Start, Ending, Middle]),
	select(Ending, To, T1),
	display(Tail, [Start, Middle | T1]).
