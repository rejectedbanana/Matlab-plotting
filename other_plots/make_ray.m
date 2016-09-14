function [ xr ] = make_ray( z, N2, freq, lat )

%function [ xr, zr ] = make_ray( z, N2, om, lat )
%
% Input a munch of variables to make a ray
% z is the depth vector
% N2 is the stratification profile (N^2 )
% freq is the frequency
% lat is the latitude
%
% KIM 12.09

% define the inertial frequency
f = sw_f( lat ); 
% make the dz vector
dz = diff( z ); dz( end+1 ) = dz( end ); 

% define the distance in meters
xr = nancumsum( sqrt( (N2 - freq.^2) ./ (freq.^2 - f.^2) ).*dz ); 

% make the minimum xr be 0
xr = xr - nanmin( xr ); 