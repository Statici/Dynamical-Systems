%% Web diagram creator
% Author: Henry Tregillus
% Date of creation: January 20th, 2018
% Class: Advanced Topics: Dynamical Systems (MATH 483)
% Description: webDiagram takes in an anonymous function (f), its phase
% space (X), an initial value (x0), and the number of iterates (steps) to
% explore along the process of web-creation.
% A small example script of its usage (webDiagramTest.m) should be attached
% to the post as well.

% Inputs:
% f, an anonymous function.
% X, the function's phase space, an n-by-1 vector or matrix.
% x0, an initial value (a scalar)
% steps, the number of iteratives
% Output:
% web, a size(X) by size(X) by 2 matrix. It will be made up entirely of
% zeros besides those points which iterates pass through, and those
% non-zero points have magnitude according to the vector drawn in the web
% diagram.
function web = webDiagram(f,X,x0,steps)
web = zeros(length(X),length(X),2);
y = zeros(steps,1);
y(1) = f(x0);

[~,lx] = min(abs(x0-X));
[~,ly] = min(abs(y(1)-X));
web(ly,lx,2) = y(1) - X(lx);
web(lx,lx,1) = y(1) - X(lx);

for i = 2:steps
    y(i) = f(y(i-1));
    
    [~, lx] = min(abs(y(i-1)-X));
    [~, ly] = min(abs(y(i)-X));
    % Horizontal component from g(x) to the line y = x
    web(ly,lx,2) = y(i) - y(i-1);
    % Vertical component from the line y = x to g(x)
    web(lx,lx,1) = y(i) - y(i-1);
    
end

end