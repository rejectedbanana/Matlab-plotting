function cmp=seasons(startdate,enddate, len)

% function cmp=seasons(startdate,enddate, len)
%
%  make a color map that depends on the seasons
%
% Colors based on palette that can be found at
% https://slideshare-wordpress-blog-pictures.s3.amazonaws.com/seasonal-pallette_2.jpg

if nargin<3
    len=length(colormap);
end
if nargin<2
    enddate = datenum(1, 1, 1); 
end
if nargin<1
    startdate = datenum(0, 1, 1); 
end

% convert the time 
[startyear, startmonth, dum] = datevec( startdate);
startdate = startdate - datenum( startyear, 1, 1)+1; 
enddate = enddate - datenum( startyear, 1, 1);
years = ceil((enddate-startdate)./365); 

% assign each month a color
basehex = {'01A292','019F62','74C123','F6E300','EDB901','F29A02','E66C19','DE012A','880382','632A88','3C1282','017BBE'};
% convert to RGB colors that matlab can use
basecolors = hex2rgb(basehex)/255; 

% repmat the colors for longer than the time series
basemonths = datenum( 0, 1:12*(years+1), 1);
basecolors = repmat( basecolors, [years+1, 1]); 
colors = interp1( basemonths.', basecolors, startdate:1:enddate.');


xcmdata=(1:size(colors,1))./size(colors,1);
dx = 1/(size(colors,1)-1);
xcmdata=0:dx:1;
dx = 1/(len-1);
xnew = 0:dx:1;
cmp=interp1(xcmdata,colors,xnew);

