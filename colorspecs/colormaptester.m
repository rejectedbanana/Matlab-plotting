function colormaptester( colormapname )

% function colormaptester( colormapname )
%
% Quick script used to test colormaps.
%
% colormapname is the text string of the colormap. Ex.: "jet", "zissou",
% "parula"
%
% KIM 7.2015

% define the colormap
eval( ['colormapin =', colormapname, ';'])

% use peaks as the basic function
inputin = peaks; 
% normalize
inputin = (inputin-1.4534/2);
inputin = inputin./nanmax(nanmax(inputin));

% make the figure
sfig(1, 2.1, 2); clf

contourf( inputin, linspace(-1,1, 11) , 'linecolor', 'none'); hold on
colormap(colormapin)
contour( inputin, [0, 0], 'k--')
set( gca, 'xticklabel', [], 'yticklabel', [], 'ticklength', [0, 0])
titleout( ['Colormap: ', colormapname, '.m'], gca, 'fontsize', 24)

% make the colorbar
cb = colorbar;
cb.Ticks = [-1, 0, 1];
cb.FontSize = 24;
scoot_axes( [0.1, 0.05, 0,-0.1], cb)

scoot_axes( [-0.05, -0.05, 0.1-1/20, 0.1])






% titleout( 