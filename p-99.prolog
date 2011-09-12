
%% not part of any problem
starts_same([],[]).
starts_same(_,[]).
starts_same([],_).
starts_same([First|XRest],[First|YRest]):-
	starts_same(XRest,YRest).


is_square(0,0).
is_square(1,1).
is_square(X,Y) :-
	Y is X*X.

is_sum(X,Y,Z) :-
	Z is X+Y.

%% Problem 1

my_last([X],X).
my_last([_|R],X):-
	my_last(R,X).

%% Problem 2

%my_secondlast([X],[]).
my_secondlast([_|[X|[_]]],X).
my_secondlast([_|R],X):-
	my_secondlast(R,X).

%% Problem 3 

element_at(1,[F|_],F).
element_at(Z,[_|R],Result):-
	Z > 1,
	X is Z-1,
	element_at(X,R,Result).

%% Problem 4
% length of list

my_length([],0).
my_length([_],1).
my_length([_|R],Y):-
	my_length(R,Z),
	Y is Z+1.

%% Problem 5
%% Reverse a list

% called normally, start the recursive call with acc set null
my_reverse(Normal,Reversed):-
	my_reverse(Normal,Reversed,[]).
% if normal is empty, than Reversed is Accumulator (we're done)
my_reverse([],Reversed,Reversed).
% otherwise, start (or continue) building the accumulator
my_reverse([First|Rest],Reversed,Accumulator):-
	my_reverse(Rest,Reversed,[First|Accumulator]).

%% Problem 6
%% discover palindromes

is_palandrome(X):- my_reverse(X,X).


%% Problem 7
% solution using hint 
%  -"Use the predefined predicates is_list/1 and append/3"
my_flatten([],[]).
my_flatten([Xf|Xr],Y):-
	is_list(Xf),
	!,
	my_flatten(Xf,Squished),
	append(Squished,Xr,New),
	my_flatten(New,Y).
my_flatten([First|Xr],[First|Yr]):-
	not(is_list(Xf)),
	my_flatten(Xr,Yr).
	
	