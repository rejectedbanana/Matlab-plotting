function [posi]= ksubplot( ax_num, spacing );

% [ax]= ksubplot( ax_num, spacing );
%
% Creates a position matrix with the number of axes defined by ax and a pre-defined
% spacing.
% position_rectangle = [left, bottom, width, height]
%
% KIM 2006

if nargin<2
    spacing =0.05;
end


% define simple case first
posi = nan( ax_num, 4 );
posi(:,1)=0.05;
posi(:,3) = 0.9;

% find the axes height
height = ( 1- spacing*( ax_num +1) )./ax_num;
posi(:, 4) = height;

bottom=0

for i=1:ax_num;
    bottom = ( i -1 )*height + i*spacing;
    posi( ax_num+1-i, 2) =bottom;
end
    