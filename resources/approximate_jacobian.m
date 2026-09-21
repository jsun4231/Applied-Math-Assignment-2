%Implementation of finite difference approximation
%for Jacobian of multidimensional function
%INPUTS:
%fun: the mathetmatical function we want to differentiate
%X: the input value of fun that we want to compute the derivative at
%OUTPUTS:
%J: approximation of Jacobian of fun at x
function J = approximate_jacobian(fun,X)
    %set the step size to be tiny
    dx_scalar = 1e-6;
    
    f0 = fun(X); %evaluate function to determine number of outputs
    
    num_in = length(X);     %determine dimension of the input vector
    num_out = length(f0);   %determine dimension of the output vector
    
    %initialize the dx vector
    dX = zeros(size(X));

    %initialize the Jacobian to be a matrix
    %with height num_out and width num_in
    J = zeros([num_out,num_in]);

    %iterate through each scalar input of fun
    for n = 1:num_in
        %set dx vector so it has the form:
        %[0,...,0,dx_scalar,0,...,0]^T
        %where the nonzero element is at dx
        dX(n) = dx_scalar;

        %Use finite differences to compute the vector dfun/dx_n
        %partial derivative of the function 
        %w/respect to the nth element of X
        %the result should be a vector quantity

        %YOUR CODE HERE

        %Set the nth column of J to dfun/dx_n

        %YOUR CODE HERE


        dX(n) = 0; %reset the dx vector to [0,...,0]^T
    end
    
end
