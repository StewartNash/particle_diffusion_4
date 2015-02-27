%PLEASE SUBMIT MODIFICATIONS AND IMPROVEMENTS!

%File: updatevelocity.m (MATLAB)
%Version: 0.0
%Author: Stewart Nash
%Date: February 25, 2015
%Description: Update velocity vector given speed and angle of particles

%Note: Particle index means a consecutive list of integers starting with 1.

%>>>>Input Parameters<<<<%
%input_speed - Speed of particles indexed by particle number
%input_angle - Angle of particles indexed by particle number
%input_size - number of particles in index (maximum index number)

function output_velocity = updatevelocity(input_speed, input_angle, input_size)
	velocity = zeros(input_size, 2);
	for i = 1 : input_size
		velocity(i, 1) = input_speed(i) * cos(input_angle(i));
		velocity(i, 2) = input_speed(i) * sin(input_angle(i));
	end
	output_velocity = velocity;
end