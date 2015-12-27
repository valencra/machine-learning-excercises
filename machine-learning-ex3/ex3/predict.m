function p = predict(Theta1, Theta2, X)
%PREDICT Predict the label of an input given a trained neural network
%   p = PREDICT(Theta1, Theta2, X) outputs the predicted label of X given the
%   trained weights of a neural network (Theta1, Theta2)

% Useful values
m = size(X, 1);
num_labels = size(Theta2, 1);

% You need to return the following variables correctly 
p = zeros(size(X, 1), 1);

% ====================== YOUR CODE HERE ======================
% Instructions: Complete the following code to make predictions using
%               your learned neural network. You should set p to a 
%               vector containing labels between 1 to num_labels.
%
% Hint: The max function might come in useful. In particular, the max
%       function can also return the index of the max element, for more
%       information see 'help max'. If your examples are in rows, then, you
%       can use max(A, [], 2) to obtain the max for each row.
%

% first layer
a1 = X; % 5000 sets of 400 pixel features
a1 = [ones(size(a1,1), 1) a1]; % add bias feature
% second layer
z2 = Theta1*a1';
a2 = sigmoid(z2); % 25 second layer features for each of the 5000 data sets
a2 = [ones(size(a2,2), 1)'; a2]; % add bias feature
% third layer
z3 = Theta2*a2;
a3 = sigmoid(z3);% 10 class probabilities for each of the 5000 data sets
% predictions
[max_probabilities, p] = max(a3', [], 2);






% =========================================================================


end
