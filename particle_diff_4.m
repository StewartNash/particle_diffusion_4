%PLEASE SUBMIT MODIFICATIONS AND IMPROVEMENTS!

%File: particle_diff_4.m (MATLAB)
%Version: 0.0
%Author: Stewart Nash
%Date: February 27, 2015
%Description: 2-Dimensional simulation of non-interacting particles originating in region with constant velocity. A reflecting boundary is present.

%Note: Particle index means a consecutive list of integers starting with 1.

%>>>>Constants<<<<%
%MAX_PARTICLES - Maximum number of particles
%GRID_SIZE - Grid size for square grid
%TERMINAL_SPEED - Maximum particle speed
%DEGREES - Degree conversion factor
%RADIANS - Radian conversion factor
%TIME_STEPS - Number of time steps to run
%TIME_INCREMENT  - Number of time steps per frame (to advance particle position)
%DIMENSION - Dimension of space

MAX_PARTICLES = 50;
GRID_SIZE = 400;
TERMINAL_SPEED = 2.5;
DEGREES = 360;
RADIANS = 2 * 3.14159265359;
TIME_STEPS = 500;
TIME_INCREMENT  = 1;
DIMENSION = 2;

%Create video file and main figure window.
aviobj = avifile('example_04.avi', 'compression', 'None');
main_figure = figure;

%Create a random number of particles and set size of grid (a 2-by-2 square matrix).
particlenumber = ceil(MAX_PARTICLES * rand);
domainsize = [GRID_SIZE GRID_SIZE];

%>>>>Variables<<<<%
%domain - Grid
%domain_2 - Grid which will be displayed, a copy of 'domain'
%particleposition - position of particles indexed by particle number
%particleangle - angle of particles velocity vector which is indexed by particle number
%particlespeed - speed of particles (magnitude of velocity vector) which is indexed by particle number
%particlevelocity - velocity of particles indexed by particle number

%Allocate variables.
domain = zeros(domainsize);
domain_2 = domain;
particleposition = zeros(particlenumber, DIMENSION);
particleangle = zeros(particlenumber, 1);
particlespeed = zeros(particlenumber, 1);
particlevelocity = zeros(particlenumber, DIMENSION);

%Initialize variables to random values.
particleposition = (ceil(rand(particlenumber, DIMENSION) .* GRID_SIZE));
particlespeed = (rand(particlenumber, 1) .* TERMINAL_SPEED);
particleangle = (rand(particlenumber, 1) .* RADIANS);
%Update velocity vector and note location of particles in domain.
particlevelocity = updatevelocity(particlespeed, particleangle, particlenumber);
domain = updatedomain(particleposition, particlenumber, domainsize);
%'domain_2' will have a visually expanded particle size.
domain_2 = enlarge(domain, domainsize);
domain_2 = enlarge(domain_2, domainsize);
%Display image and save to video file.
imshow(domain_2)
aviobj = addframe(aviobj, main_figure);

%Iterate the previous process through a number of time steps.
for i = 1 : TIME_STEPS
	[particleposition, particleangle] = updatepositionborder(particlespeed, particleangle, particleposition, TIME_INCREMENT, particlenumber, domainsize);
	%Update velocity as the particle angle may have been changed.
	particlevelocity = updatevelocity(particlespeed, particleangle, particlenumber);
    domain = updatedomain(particleposition, particlenumber, domainsize);
    domain_2 = enlarge(domain, domainsize);
    domain_2 = enlarge(domain_2, domainsize);
	imshow(domain_2)
	aviobj = addframe(aviobj, main_figure);
end

%Close video file.
aviobj = close(aviobj);
