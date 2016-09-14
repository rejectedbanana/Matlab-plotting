function scoot_axes( scoot, h )

% function scoot_axes( scoot, h )
%
%  Adjust the axes position.  Default is current axes or move the axes with
%  the handle h.
%  scoot = [left bottom width height]
%
% KIM 09/08

% if no axes specified, add to current axes
if nargin<2
    h = gca;
end

posi = get( h , 'position'); 
posi = posi +scoot; 
set( h, 'position', posi );