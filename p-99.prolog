

is_square(0,0).
is_square(1,1).
is_square(X,Y) :-
	Y is X*X.

is_sum(X,Y,Z) :-
	Z is X+Y.

%% Problem 1

my_last([X],X).
my_last([F|R],X):-
	my_last(R,X).

%% Problem 2

%my_secondlast([X],[]).
my_secondlast([F|[X|[L]]],X).
my_secondlast([F|R],X):-
	my_secondlast(R,X).

%% Problem 3 

element_at(1,[F|R],F).
element_at(Z,[F|R],Result):-
	Z > 1,
	X is Z-1,
	element_at(X,R,Result).

%% Problem 4

my_length([],0).
my_length([F],1).
my_length([F|R],Y):-
	my_length(R,Z),
	Y is Z+1.

%% Problem 5

my_reverse([],[]).
my_reverse([X],[X]).
my_reverse([F|[X]],[X|[F]]).
%% WIP ---
%my_reverse([F|R],Result) :-