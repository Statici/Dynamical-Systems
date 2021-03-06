%% Example script for the "webDiagram" function.
% Author: Henry Tregillus
% Date of creation: January 20th, 2018
% Class: Advanced Topics: Dynamical Systems (MATH 483)
% Description: webDiagram takes in a dynamical system with an initial
% condition, then produces a matrix suitable for plotting a web diagram
% using matlab's "quiver" plotting function.


%%--------------------------------------------------------------------------
% Usage: In general use, you only really need to change this stuff here.
% Define the function you're interested in:
g = @(x) 3.5.*x.*(1-x);
% Set the phase space that the function resides in. This is generally R, but usually you only care about some small basin of attraction anyways.
X = linspace(0,1,1000);
% Pick an initial value
x0 = .1;
% Set how many iterates you want to do. You can make this number as big as you want, but at some point it becomes largely useless.
steps = 10;
%%--------------------------------------------------------------------------


% Create the web diagram with the above inputs.
web1 = webDiagram(g,X,x0,steps);

%% Plot the results

hold on
quiver(X,X,web1(:,:,2),web1(:,:,1),0,'MaxHeadSize',.025)
plot(X,g(X))
plot(X,X)
ylim([min(X) max(X)])
xlim([min(X) max(X)])
title(['Web diagram for g_{3.5}(x) with ' num2str(steps) ' iterativess'])
xlabel('x')
ylabel('g(x)')
hold off
