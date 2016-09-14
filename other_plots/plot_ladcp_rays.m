function plot_ladcp_rays( s, z_r, shifter, col);

%plots characteristic M2 rays from Jonathan's LADCP structure
% shifter moves the ray to the right or to the left
% col is the color of the plotted ray
%
%03/08 KIM

if nargin<4
    col = [0, 0, 0];
end

% define the frequencies
om = 2*pi ./12.42./60./60; 
f = sw_f( nanmean( s.lat ));


% Find dz
s.dz = diff( s.z); 
s.dz = [ s.dz; s.dz(end)]; 

% integrate up
x_distance_mean = nancumsum( flipud( sqrt( (s.n2m(z_r,:) - om.^2)./(om^2 - f^2) ).*s.dz(z_r,:) ));
x_distance_mean_d = nancumsum(  sqrt( (s.n2m(z_r,:) - om.^2)./(om^2 - f^2) ).*s.dz(z_r,:) );
% concat
x_ray_mean =  [ x_distance_mean;  x_distance_mean_d+nanmax( x_distance_mean )] ; 

% integrate down
x_distance = nancumsum( flipud(sqrt( (s.n2m(z_r,:) - om.^2)./(om^2 - f^2) ).*s.dz(z_r,:) ) );
x_distance_d =  nancumsum( sqrt( (s.n2m(z_r,:) - om.^2)./(om^2 - f^2) ).*s.dz(z_r,:) );
% concat
% x_ray = [ x_distance;  x_distance_d+repmat( nanmax(x_distance), [ length( z_r ) , 1] ) ];

% define z
z =  [ flipud(s.z(z_r,:));   s.z(z_r,:) ] ;

% plot( shifter+(x_ray./1000), z , '-', 'color', col)
axis ij; hold on;
% plot( shifter - (x_ray./1000)  , z, '-', 'color', col)
plot(  shifter + x_ray_mean./1000 , z, '-', 'linewidth', 2, 'color', col)
plot(  shifter - x_ray_mean./1000, z, '-', 'linewidth', 2, 'color', col)