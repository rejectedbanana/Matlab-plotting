function all_xlims( input, fig)

% function all_ylims( input, fig)
% Change the ylims in a window
% input must be a two element vector
% EX:  all_ylims( [0, 100])
%
% KIM 09/10

if nargin<2
    fig = gcf; 
end

hchild = get( gcf, 'children'); 

for n = 1:length( hchild)
    if strcmp( get(hchild(n), 'type'), 'axes') & isempty(get( hchild(n), 'tag'))
        axes( hchild(n))
        ylim( input )
    end
end