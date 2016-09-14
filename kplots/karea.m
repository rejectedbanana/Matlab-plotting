function [aa] = karea( X, Y, varargin )

% function [aa] = karea( X, Y, varargin )
%
%  Plot a single function with the area underneath shaded.
%
% Calls the function area, but adds in the extra arguments to change the
% facecolor, linecolor, line width, etc here.
%
% KIM 09.11

if nargin < 3
    varargin = {'facecolor', [1, 1, 1]*0.8, 'linewidth', 1, 'edgecolor', [1, 1, 1]*0.2}; 
end

bvi = strmatch( 'basevalue', varargin(1:2:end)); 
if isempty(bvi)
    bv = 0; 
    varargin = [varargin, 'basevalue', bv ]; 
else
    bv = varargin{2*(bvi-1)+2}; 
end

% now sub in basevalue for nans
naner = find( isnan( Y )); 
Y(naner ) = bv; 

aa = area(X, Y);
set( aa(1), varargin{:})