% 2D Random Walker MATLAB code
% Lianne Meah (lianne.meah@gmail.com)

%% CLEANUP
clc
clear all
clf

%% PARAMETER SETUP
% define number of steps
num_iterations = 100;
% set 2 or 3 directions (2 = (x,y), 3 = (x,y,z))
directions = 3;
% create x and y positions, set all to 0
x = zeros(1,num_iterations+1);
y = zeros(1,num_iterations+1);
% arrays for memory of where we've been (for plotting)
xposition = zeros(1, num_iterations+1);
yposition = zeros(1, num_iterations+1);

% Random numbers: 1xnum_iterations between 1 and 4 or 8
if directions==2
	randNum = randi(4,1,num_iterations+1);
else
	randNum = randi(8,1,num_iterations+1);
end

%% RUN SIMULATION
for i=2:(num_iterations+1)
	% check number and move
	if randNum(i)==1
		% move east
		x(i) = x(i-1)+1;
		y(i) = y(i-1);
	elseif randNum(i)==2
		% move west
		x(i) = x(i-1)-1;
		y(i) = y(i-1);
	elseif randNum(i)==3
		% move north
		x(i) = x(i-1);
		y(i) = y(i-1)+1;
	elseif randNum(i)==4
		% move south
		x(i) = x(i-1);
		y(i) = y(i-1)-1;
	elseif randNum(i)==5
		% move north-east
		x(i) = x(i-1)+1;
		y(i) = y(i-1)+1;
	elseif randNum(i)==6
		% move north-west
		x(i) = x(i-1)-1;
		y(i) = y(i-1)+1;
	elseif randNum(i)==7
		% move south-east
		x(i) = x(i-1)+1;
		y(i) = y(i-1)-1;
	else
		% move south-west
		x(i) = x(i-1)-1;
		y(i) = y(i-1)-1;								
	end
	% record positions
	xposition(i) = x(i);
	yposition(i) = y(i);
	% plotting - update plot on each iteration. Comment next three lines to plot at the end only.
	plot(xposition, yposition, 'black')
	colormap(jet)
	title(sprintf('The random walk with %.0f iterations', num_iterations))
	drawnow
end
%% PLOTTING - uncomment this to only plot at the end of the simulation
%plot(xposition, yposition, 'black')
%title(sprintf('The random walk with %.0f iterations', num_iterations))