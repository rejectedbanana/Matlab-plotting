function [newclim1, newclim2]=dualcolormap(colormap1, colormap2, ax1, ax2, notaxes)

%  [newclim1, newclim2]=dualcolormap(colormap1, colormap2, ax1, ax2,
%  notaxes)
%
%For a two window plot, this sets a new colormap for each plot.  You need
%to specify the two colormaps and the two axes handles
%
%KIM 02/06

if nargin<5
    notaxes=0;
end

colormap([colormap1; colormap2]);
CmLength   = size(get(gcf,'Colormap'),1);% Colormap length
BeginSlot1 = 1;          % Beginning slot
EndSlot1   = size(colormap1,1); % Ending slot
BeginSlot2 = EndSlot1+1; 
EndSlot2   = CmLength;
clim1      = get(ax1,'CLim');% CLim values for each axis
clim2      = get(ax2,'CLim');

newclim1=newclim(BeginSlot1,EndSlot1,clim1(1),clim1(2), CmLength);
newclim2=newclim(BeginSlot2,EndSlot2,clim2(1),clim2(2), CmLength);

if notaxes==0
set(ax1,'CLim',newclim1)
set(ax2,'CLim',newclim2)
end