% Define roads with distances

road(dhaka,chittagong, 9).
road(chittagong,khulna, 3).
road(dhaka,khulna, 6).
road(dhaka,rajshahi, 5).
road(rajshahi,dhaka, 5).
road(sylhet,dhaka, 4).
road(sylhet,rajshahi, 8).

% Predicate to get the road from Start to End

get_road(Start, End, Visited, Result) :-
    get_road(Start, End, [Start], 0, Visited, Result).

% Base case: Direct road from Start to End

get_road(Start, End, Waypoints, DistanceAcc, Visited, TotalDistance) :-
    road(Start, End, Distance),
    reverse([End|Waypoints], Visited),
    TotalDistance is DistanceAcc + Distance.

% Recursive case: Find a road through intermediate waypoints

get_road(Start, End, Waypoints, DistanceAcc, Visited, TotalDistance) :-
    road(Start, Waypoint, Distance),
    \+ member(Waypoint, Waypoints),
    NewDistanceAcc is DistanceAcc + Distance,
    get_road(Waypoint, End, [Waypoint|Waypoints], NewDistanceAcc, Visited, TotalDistance).



% Example Queries
/*
1. Find a road from Dhaka to Chittagong:
   ?- get_road(dhaka, chittagong, Visited, Distance).

2. Find a road from Sylhet to Khulna:
   ?- get_road(sylhet, khulna, Visited, Distance).

3. Find a road from Rajshahi to Dhaka:
   ?- get_road(rajshahi, dhaka, Visited, Distance).

4. Find a road from Dhaka to Sylhet:
   ?- get_road(dhaka, sylhet, Visited, Distance).
*/