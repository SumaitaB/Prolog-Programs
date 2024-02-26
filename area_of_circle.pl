area :-
   write('Write the radius of a circle: '),
   read(R),
   process(R).
process(R) :-
   A is 3.1416 * R * R,
   write('Area of circle is : '),write(A),nl, area.
