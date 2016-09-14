function horzline( y, varargin )

% function = horzline( y, varin )
%
% plots a horizontal line on the current axes at height y.
%
% KIM 09/10

if nargin < 2 
    varargin = {'-', 'color', [1, 1, 1]*0.3, 'linewidth', 1}; 
end
hold on

plot( xlim, [1, 1]*y, varargin{:})
