%% Example script for the "webDiagram" function.
% Author: Henry Tregillus
% Date of creation: January 20th, 2018
% Class: Advanced Topics: Dynamical Systems (MATH 483)
% Description: webDiagram takes in a dynamical system with an initial
% condition, then produces a matrix suitable for plotting a web diagram
% using matlab's "quiver" plotting function.

%% Usage
% Define the function you're interested in:
g = @(x) 2.*x.*(1-x);
% Define its phase space X. Note that the bigger it gets, the higher
% reolution you get (more accuracy in case of functions that are more wild)
% but simultaneously, the longer it takes to run and the more memory it
% consumes while running. If you set this "1000" to "10000" you're in for a
% bad time.
X = linspace(0,1,1000);
% Set an initial condition:
x0 = .99;
% Set how many iteratives you want to explore.
steps = 10;
% Call the function and get your web
web = webDiagram(g,X,x0,steps);

%% Plotting the results
hold on
quiver(X,X,web(:,:,2),web(:,:,1),0,'MaxHeadSize',.025)
plot(X,g(X))
plot(X,X)
ylim([min(X) max(X)])
xlim([min(X) max(X)])
xlabel('x')
ylabel('g(x)')
hold off