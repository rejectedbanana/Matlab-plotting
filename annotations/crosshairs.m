function crosshairs( xxyy, varargin )

% function crosshairs( xxyy, var )
%
%  Makes a set of cross-hairs whose center is at the x and y coordinates
%  shown.  The default is to make a crosshair centered at the coordinate [0, 0], where the
%  argument xxyy  = [0, 0];  ([x-location, y-location])
%
% KIM 02.11

if nargin < 2
    varargin = {'-', 'color', [1, 1, 1]*0.3, 'linewidth', 1};
    
    if nargin<1
        xxyy = [0, 0];
    end
end

vertline( xxyy(1), varargin{:})
horzline( xxyy(2), varargin{:})