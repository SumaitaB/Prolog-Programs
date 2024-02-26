bitwiseAnd(X,Y) :-
	R is X /\ Y,
        write(' Result of Bitwise AND is : '), write(R),!.


bitwiseOR(X,Y) :-
	R is X \/ Y,
        write(' Result of Bitwise OR is : '), write(R),!.

bitwiseXOR(X,Y) :-
	R is X xor Y,
        write(' Result of Bitwise XOR is : '), write(R),!.

bitwiseRight(X,Y) :-
	R is X >> Y,
        write(' Result of Bitwise Right is : '), write(R),!.

bitwiseLeft(X,Y) :-
	R is X << Y,
        write(' Result of Bitwise Left is : '), write(R),!.


bitwiseComplement(X) :-
	R is \X,
        write(' Result of Bitwise Complement is : '), write(R),!.
