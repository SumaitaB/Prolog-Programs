
product_cost(chocolate, 150).
product_cost(rice, 80).
product_cost(milk, 120).
product_cost(bread, 100).
product_cost(eggs, 50).
product_cost(apples, 60).
product_cost(orange_juice, 140).
product_cost(coffee, 200).
product_cost(tea, 90).
product_cost(pasta, 120).
product_cost(cereal, 175).
product_cost(butter, 115).
product_cost(cheese, 250).
product_cost(chicken_breast, 300).
product_cost(salmon, 350).
product_cost(tomatoes, 80).
product_cost(onions, 40).
product_cost(potatoes, 50).
product_cost(lettuce, 60).
product_cost(bananas, 75).

% Rule to calculate the total cost of selected products
total_cost([], 0).  % Base case: Total cost of an empty list is 0

total_cost([Product|Rest], TotalCost) :-
    % Recursively calculate the cost of the rest of the products
    total_cost(Rest, RestCost),
    % Look up the cost of the current product
    product_cost(Product, ProductCost),
    % Calculate the total cost by adding the cost of the current product
    TotalCost is RestCost + ProductCost.

% Example usage:
?- total_cost([chocolate, rice, milk, bread, eggs, apples, orange_juice, coffee, tea, pasta, butter, cheese, chicken_breast, salmon, tomatoes, onions, potatoes, lettuce, bananas], TotalCost).

?- product_cost(apples, Cost).
?- total_cost([milk, bread, eggs], TotalCost).
?- total_cost([], TotalCost).
