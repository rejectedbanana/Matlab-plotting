function kfig( fig, xx, yy )

% function kfig( fig, xx, yy )
%
% Fig is the figure #, xx the width in standard units and yy the height in
% standardized units. Default size is 4 inches by 4 inches.  
% 
% sfig(1, 1, 2) = Figure(1), 4 inches wide by 8 inches tall.
%
%  KIM 09.11

% make and close the figure to reset it
figure(fig); close(fig); 

if nargin < 3
    yy = 1; 
end
if nargin <2
    xx = 1; 
end
if nargin < 1
    fig = 1; 
end

% get the screen size
screensize = get(0,'ScreenSize'); % should automatically be in pixels

% default sizes (setting it to 1/4 of a letter sized sheet of paper)
dimx = 4*72; %600; default apple pixels per inch = 72
dimy = 4*72;% 300;

xoffset = 50; 
yoffset = 50; 

posi = [ screensize(3)-xoffset-dimx*xx, yoffset, dimx*xx, dimy*yy]; 

figure( fig ); 
set( gcf, 'position', posi )