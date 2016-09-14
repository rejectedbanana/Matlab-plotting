function h = profile_ticks(xin, ax, varargin)

if nargin <2
    ax = gca;    
end

if nargin<3
    varargin = {'marker', 'v', 'markeredgecolor','k', 'markerfacecolor', 'k', 'markersize', 6};
end
% add clipping off
varargin = [varargin, 'clipping', 'off'];

% get the limits
yl = get( ax, 'ylim');
xl = get( ax, 'xlim');

% get the units
set( ax, 'units', 'points')
points = get( gca, 'position');
set( ax, 'units', 'normalized' )

% find the marker size
fsi = find( strcmp( 'markersize', varargin )  == 1 ); 
if ~isempty( fsi )
fs = varargin{fsi+1}; 
else
    fs = 6;
end

% find the fractional size of the marker in relation to the axes height
fracV = 0.5*(fs+6)./points(4); 

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

% now plot the marker
if nargout == 0
    plot( xin, y1, varargin{:});
else
    h = plot( xin, y1, varargin{:});
end