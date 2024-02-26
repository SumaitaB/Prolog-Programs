% Write a Prolog program to implement GCD of two numbers.

/* GCD of two numbers. */
gcd(X,0,X).
gcd(X,Y,Z):-
 R is mod(X,Y),
 gcd(Y,R,Z).
