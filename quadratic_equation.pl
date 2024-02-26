 equation:-
 write('Enter A='),
 read(A),
 write('Enter B='),
 read(B),
 write('Enter C='),
 read(C),
 quadroot(A,B,C),!.

 quadroot(A,B,C):-
 D=(B*B)-(4*A*C),
 sol(A,B,C,D),!.

 sol(_,_,_,D):-
 D<0,
 write('Root are Imaginary'),!.

 sol(A,B,_,D):-
 X1=(-B+sqrt(D))/2*A,
 X2=(-B-sqrt(D))/2*A,
 write('X1=',X1),
 write('X2=',X2),!.

 equal(X1,X2):-
 X1=X2,
 write('Roots are equal'),!.

 equal(X1,X2):-
 X1==X2,
 write('Roots are real'),!.
