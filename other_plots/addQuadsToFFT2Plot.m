function addQuadsToFFT2Plot( h, varargin )

% function addQuadsToFFT2Plot( h )
%
% KIM 6/10


% if no axes specified, add to current axes
if nargin<2
    h = gca;
end
if nargin<3
    varargin =  {'fontsize', 20, 'fontweight', 'bold', 'verticalalignment', 'middle' };
end

% get the limits
yl = get( h, 'ylim');
xl = get( h, 'xlim');

% get the units
set( h, 'units', 'points')
points = get( gca, 'position');
set( h, 'units', 'normalized' )

% find the font size
fsi = find( strcmp( 'fontsize', varargin )  == 1 ); 
if ~isempty( fsi )
fs = varargin{fsi+1}; 
else
    fs = 20;
end

% find the fraction accordingly
fracH = 0.5*fs./points(3); 
fracV = 1*fs./points(4); 

% set the x position
if strcmp( 'normal', get( gca, 'Xdir') )
    if strcmp( 'linear', get( gca, 'Xscale'))
        x1 = xl(1) + diff( xl )*fracH; 
        x2 = xl(2) - diff( xl )*fracH; 
    else
        % adjust for logarithimic scale
        x1 = 10^(log10( xl(1) ) + diff( log10( xl ))*fracH );
        x2 = 10^(log10( xl(2) ) - diff( log10( xl ))*fracH );
    end
else   
    if strcmp( 'linear', get( gca, 'Xscale'))
         x1 = xl(1) - diff( xl )*fracH; 
         x2 = xl(2) + diff( xl )*fracH;
    else
        x1 = 10^(log10( xl(2) ) - diff( log10( xl ))*fracH );
        x2 = 10^(log10( xl(2) ) - diff( log10( xl ))*fracH );
    end
end

% set the y position
if strcmp( 'normal', get( gca, 'Ydir') )
    if strcmp( 'linear', get( gca, 'Yscale'))
        y1 = yl(2) - diff( yl )*fracV;
        y2 = yl(1) + diff( yl )*fracV;
    else
        y1 = 10^(log10( yl(2) ) - diff( log10( yl ))*fracV );
        y2 = 10^(log10( yl(1) ) + diff( log10( yl ))*fracV );
    end
else   
    if strcmp( 'linear', get( gca, 'Yscale'))
        y1 = yl(1) + diff( yl )*fracV;
        y2 = yl(2) - diff( yl )*fracV;
    else
        y1 = 10^(log10( yl(1) ) + diff( log10( yl ))*fracV );
        y1 = 10^(log10( yl(2) ) - diff( log10( yl ))*fracV );
    end
end
 
% now add the titlein
text( x1, y1, 'CW, F_{z} \downarrow ', varargin{:});
text( x2, y1, 'CCW, F_{z} \downarrow ', varargin{:}, 'horizontalalignment', 'right');
text( x1, y2, 'CW, F_{z} \uparrow ', varargin{:});
text( x2, y2, 'CCW, F_{z} \uparrow ', varargin{:}, 'horizontalalignment', 'right');



    


