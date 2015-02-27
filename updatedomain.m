%PLEASE SUBMIT MODIFICATIONS AND IMPROVEMENTS!

%File: updatedomain.m (MATLAB)
%Version: 0.1
%Author: Stewart Nash
%Date: February 27, 2015
%Description: Function indicates position in square grid where particles are present with a value of 1

%Note: Particle index means a consecutive list of integers starting with 1.

%>>>>Input Parameters<<<<%
%input_position - position of particles indexed by particle number
%input_size - number of particles in index (maximum index number)
%domain_size - size of grid (array)

%>>>>Variables<<<<%
%domain_width - number of columns of input grid
%domain_length - number of rows of input grid

function output_domain = updatedomain(input_position, input_size, domain_size)
	domain = zeros(domain_size);
	domain_width = domain_size(1);
	domain_length = domain_size(2);
	
	for i = 1 : input_size
		if (input_position(i, 1) < domain_width & input_position(i, 1) > 0 & input_position(i, 2) < domain_length & input_position(i, 2) > 0)
			domain(ceil(input_position(i, 1)), ceil(input_position(i, 2))) = 1;
		end
	end
	output_domain = domain;
end