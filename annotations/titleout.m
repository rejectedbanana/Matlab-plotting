function tt =titleout( str , h, varargin )

% function tt =titleout( str , h )
%
% Add a title to the outer upper right hand corner of the axes h.  Str is the text string. The
% default axes is the current axes.  
%
% Varargin are any arguments used to change the text properties.
%
% KIM 09/08

% if no axes specified, add to current axes
if nargin<2
    h = gca;
end
if nargin<3
    varargin =  {'fontsize', 16, 'fontweight', 'bold'};
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
fracV = 0.65*fs./points(4); 

% set the x position
% x1 = xl(1) + diff( xl )*fracH; 

% set the x position
if strcmp( 'normal', get( gca, 'Xdir') )
    if strcmp( 'linear', get( gca, 'Xscale'))
        x1 = xl(1) + diff( xl )*fracH; 
    else
        % adjust for logarithimic scale
        x1 = 10^(log10( xl(1) ) + diff( log10( xl ))*fracH );
    end
else   
    if strcmp( 'linear', get( gca, 'Xscale'))
         x1 = xl(2) - diff( xl )*fracH; 
    else
        x1 = 10^(log10( xl(2) ) - diff( log10( xl ))*fracH );
    end
end

% set the y position
if strcmp( 'normal', get( gca, 'Ydir') )
    if strcmp( 'linear', get( gca, 'Yscale'))
        y1 = yl(2) + diff( yl )*fracV; 
    else
        y1 = 10^(log10( yl(2) ) + diff( log10( yl ))*fracV );
    end
else   
    if strcmp( 'linear', get( gca, 'Yscale'))
         y1 = yl(1) - diff( yl )*fracV; 
    else
        y1 = 10^(log10( yl(1) ) - diff( log10( yl ))*fracV );
    end
end

% now add the titlein
if nargout == 0
    text( x1, y1, str, varargin{:});
else
    tt = text( x1, y1, str, varargin{:});
end