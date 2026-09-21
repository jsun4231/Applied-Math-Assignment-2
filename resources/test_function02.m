function [f_out,dfdx] = test_function02(X)
    x1 = X(1);
    x2 = X(2);
    x3 = X(3);

    y1 = 3*x1^2 + .5*x2^2 + 7*x3^2-100;
    y2 = 9*x1-2*x2+6*x3;

    f_out = [y1;y2];
    dfdx = [6*x1,1*x2,14*x3;9,-2,6];
end