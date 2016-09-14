function vv = vertline( x, varargin )

%  function vertline( x, varargin )
%
% Plots a vertical line on the current axes at x.
%
% KIM 09/10

if nargin < 2 
    varargin = {'-', 'color', [1, 1, 1]*0.3, 'linewidth', 1}; 
end
hold on

vv = plot(  [1, 1].*x, ylim, varargin{:});
