function apply_all( input, fig)

% apply a function to all the axes in a window.  function must be a text
% string
%
% KIM 09/10

if nargin<2
    fig = gcf; 
end

hchild = get( gcf, 'children'); 

for n = 1:length( hchild)
    if strcmp( get(hchild(n), 'type'), 'axes') & isempty(get( hchild(n), 'tag'))
        axes( hchild(n))
        eval( input )
    end
end