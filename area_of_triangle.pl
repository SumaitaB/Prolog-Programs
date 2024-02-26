area :-
   write('Write the base length of the triangle: '),
   read(B),
   write('Write the height length of the triangle: '),
   read(H),
   process(B,H).

process(B,H) :-
   A is 0.5 * B * H,
   write('Area of triangle is : '),write(A),nl, area.
