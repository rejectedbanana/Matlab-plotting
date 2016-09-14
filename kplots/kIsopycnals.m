function kIsopycnals(h)

% function kIsopycnals(h)
%
%  Add isopycnals to a TS plot using the current T and S limits
%
% KIM 02.10

if nargin<1
    h = gca;
end

% find the axes limits
slim= xlim(h); 
tlim = ylim(h);
clim = caxis; 
% make the grids
S = linspace( slim(1), slim(2), 100); 
T = linspace( tlim(1), tlim(2), 100); 
[ S, T ] = meshgrid( S, T ); 
%calculate density
sgth = sw_pden( S, T, 0, 0 ); 
sgth = sgth - 1000; 
% find the density range
sgthlim = [ nanmin( nanmin( sgth ) ) , nanmax( nanmax( sgth ) ) ]; 

% set there to be 10 contours
if diff( sgthlim ) >= 1&& diff( sgthlim ) < 10 
    spcr = round( diff( sgthlim./10 )*10 ) ; 
    lvls = floor( sgthlim(1)*10):spcr:floor( sgthlim(2)*10 ); 
    lvls = lvls./10; 
elseif diff( sgthlim ) < 1 && diff( sgthlim ) >=0.1; 
    spcr = round( diff( sgthlim./10 )*100 ) ; 
    lvls = floor( sgthlim(1)*100):spcr:floor( sgthlim(2)*100 ); 
    lvls = lvls./100; 
end
% make the contours
hold on
[ c, d ] = contour( S, T, sgth , lvls,  '--', 'color', [1, 1, 1]*0.5); 
clabel( c, d , 'color', [1, 1, 1]*0.5);
% reset axes
xlim( slim ); ylim( tlim ); caxis( clim ); 




