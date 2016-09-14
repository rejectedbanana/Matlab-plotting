function dy = scaleyaxis( ynorm, yrange, ax)

% function dy = scaleyaxis( ynorm, yrange, ax)
%
% Scale an axes by a normalized height z_norm
%
% KIM 01.2016

if nargin<3
    ax = gca; 
end

% if no yrange is input, use the axes limits
if nargin<2
    yl = get(ax, 'YLim'); 
    yrange = range( yl ); 
end

% get the size of the axes
posi = ax.Position; 

% determine the scaling
dy = -1*posi(4).*(1-yrange./ynorm); 

% change the axes size
scoot_axes( [0, 0, 0, dy], ax); 



