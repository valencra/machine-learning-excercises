function [C, sigma] = dataset3Params(X, y, Xval, yval)
%EX6PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = EX6PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C = [0.01, 0.03, 0.1, 0.3, 1, 3, 10, 30];
sigma = [0.01, 0.03, 0.1, 0.3, 1, 3, 10, 30];

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
%

% find the best error and its corresponding C and sigma
best_error = 1e9;
best_C = 0;
best_sigma = 0;
% iterate over every C and sigma combination
for C_i=1:length(C)
    for sigma_i=1:length(sigma)
        % train, predict and get error
        model= svmTrain(X, y, C(C_i), @(x1, x2) gaussianKernel(x1, x2, sigma(sigma_i)));
        predictions = svmPredict(model, Xval);
        prediction_error = mean(double(predictions~=yval));
        if(prediction_error<best_error)
           best_error = prediction_error;
           best_C = C(C_i); 
           best_sigma = sigma(sigma_i); 
        end
    end
    end
% return the optimal C and sigma values
C = best_C;
sigma = best_sigma;
% =========================================================================

end
