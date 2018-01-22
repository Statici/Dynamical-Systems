%% Example script for the "webDiagram" function.
% Author: Henry Tregillus
% Date of creation: January 20th, 2018
% Class: Advanced Topics: Dynamical Systems (MATH 483)
% Description: webDiagram takes in a dynamical system with an initial
% condition, then produces a matrix suitable for plotting a web diagram
% using matlab's "quiver" plotting function.

%% Usage
% Define the function you're interested in:

g = @(x) 3.5.*x.*(1-x);
X = linspace(0,1,1000);
x0 = .1;
steps = 10;
web1 = webDiagram(g,X,x0,steps);

%% Plotting the results

hold on
quiver(X,X,web1(:,:,2),web1(:,:,1),0,'MaxHeadSize',.025)
plot(X,g(X))
plot(X,X)
ylim([min(X) max(X)])
xlim([min(X) max(X)])
title(['Web diagram for g(x) with ' num2str(steps) ' iterativess'])
xlabel('x')
ylabel('g(x)')
hold off
