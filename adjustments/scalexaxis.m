function dx = scalexaxis( xnorm, xrange, ax)

% function dx = scalexaxis( xnorm, xrange, ax)
%
% Scale an axes by a normalized height z_norm
%
% KIM 01.2016

if nargin<3
    ax = gca; 
end

% if no yrange is input, use the axes limits
if nargin<2
    xl = get(ax, 'XLim'); 
    xrange = range( xl ); 
end

% get the size of the axes
posi = ax.Position; 

% determine the scaling
dx = -1*posi(3).*(1-xrange./xnorm); 

% change the axes size
scoot_axes( [0, 0, dx, 0], ax); 



