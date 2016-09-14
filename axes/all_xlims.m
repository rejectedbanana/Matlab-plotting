function all_xlims( input, fig)

% function all_xlims( input, fig)
% Change the xlims in a window
% input must be a two element vector
% EX:  all_xlims( [-1, 1]*0.1)
%
% KIM 09/10

if nargin<2
    fig = gcf; 
end

hchild = get( gcf, 'children'); 

for n = 1:length( hchild)
    if strcmp( get(hchild(n), 'type'), 'axes') & isempty(get( hchild(n), 'tag'))
        axes( hchild(n))
        xlim( input )
    end
end