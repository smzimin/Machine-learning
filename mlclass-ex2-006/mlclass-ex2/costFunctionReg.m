function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta

% for i = 1:m
%     J = J + (-y(i)*log(1/(1+exp(-dot(theta,X(i,:))))) - (1 - y(i))*log(1 - 1/(1+exp(-dot(theta,X(i,:))))))/m;
% end
% 
% J = J + 0.5*lambda*sum(theta(2:end).^2)/m;

h = sigmoid(X * theta);

J = (-sum(y.*log(h) + (1 - y).*log(1 - h)) + 0.5*lambda*sum(theta(2:end).^2))/m;


% for j = 2:length(theta)
%     grad(j) = lambda*theta(j)/m;
%     for i = 1:m
%         grad(j) = grad(j) + (1/(1+exp(-dot(theta,X(i,:)))) - y(i))*X(i,j)/m;
%     end
% end
% 
% for i = 1:m
% 	grad(1) = grad(1) + (1/(1+exp(-dot(theta,X(i,:)))) - y(i))*X(i,1)/m;
% end


theta(1) = 0;
grad = (X'*(h - y) + lambda*theta)/m;

% =============================================================

end
