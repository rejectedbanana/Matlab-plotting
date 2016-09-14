function scaleYAxisTicks( qs, h )

% function scaleYAxisTicks( qs, h )
%
%  When making a quiver plot and multiplying u and v by some scalar 'qs',
%  adjust the y-axes labels so they accurately reflect the units.  H is the
%  axes handle, default chooses the current axes.
%
%  KIM 09.11

if nargin < 2
    h = gca; 
end

ylbl = get( gca, 'yticklabel'); 

% covert to a number
ylbl = cellfun( @str2num,  ylbl ); 

% scale
ylbl = ylbl./qs; 

% convert back to a string
ylbl = num2str( ylbl ); 

% now change the label
set( gca, 'yticklabel', ylbl )




