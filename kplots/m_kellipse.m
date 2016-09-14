function [h] = m_kellipse( u, uphs, v , vphs, clr, lwidth, offset, plot_arrow, varargin)

% function [h] = m_kellipse( u, uphs, v , vphs, clr, lwidth,
% offset, plot_arrow )
%
% Plots an ellipse from u and v amplitude and phase.
% uphs and vphs are in degrees on a map! Offset is in lat and long.
%
% KIM 11.2007

% set default line color and width
if nargin<8
    plot_arrow =0; % default don't plot arrow
    if nargin <7
        offset = [0, 0];
        if nargin < 6
            lwidth = 1;
            if nargin < 5
                clr = 'k';
            end
        end
    end
end

hold on

% Change phase to radians
uphs = uphs*pi./180;
vphs = vphs*pi./180;

% make one cycle
radi = [0:0.02:(2*pi*0.95)]; 

% If y axis is reversed, multiply the v velocity by -1 to flip the ellipse
% correctly
if strcmp(get(gca, 'Ydir'), 'reverse')
    v = -1*v;
end

% make u and v vectors
uvec = u.* cos( radi - uphs );
vvec = v.*cos( radi - vphs );

% scale lat and long according to the projection
global MAP_PROJECTION MAP_VAR_LIST
if isempty(MAP_PROJECTION),
    disp('No Map Projection initialized - call M_PROJ first!');
    return;
end;
[x1,y1] = m_ll2xy(offset(1),offset(2));

% now scale the velocity
% Coordinate transformation
[XN ,YN ]=m_ll2xy([offset(1) offset(1)]',                           [offset(2) offset(2)+.001]','clip','off');
[XE ,YE ]=m_ll2xy([offset(1) offset(1)+(.001)./cos(offset(2)*pi/180)]',[offset(2) offset(2)]',     'clip','off');
mx=uvec.*diff(XE)*1000 + vvec.*diff(XN)*1000;
my=uvec.*diff(YE)*1000 + vvec.*diff(YN)*1000;

% plot ellipse
% h(1) = plot( uvec+offset( 1), vvec+offset( 2), 'color', clr, 'linewidth', lwidth, 'linestyle', '-');
h(1) = plot( mx+x1, my+y1, 'color', clr, 'linewidth', lwidth, 'linestyle', '-', varargin{:});
hold on

% plot a line indicating the start time
h(2) = plot( [mx(1), 0]+x1, [my(1), 0]+y1, 'color', clr, 'linewidth', lwidth,'linestyle', '-',varargin{:});

if plot_arrow ==1
    if sum( isnan( [u, uphs, v, vphs]) ) == 0
%         % convert to map coordinated. Cribbed from m_plot
%         global MAP_PROJECTION MAP_VAR_LIST
%         if isempty(MAP_PROJECTION),
%             disp('No Map Projection initialized - call M_PROJ first!');
%             return;
%         end;
%         [x1,y1] = m_ll2xy(uvec(1)+offset(1),vvec(1)+offset( 2));
%         [x2,y2] = m_ll2xy(uvec(2)+offset( 1 ), vvec(2)+offset( 2));
%         % Show rotation direction with arrow
%         h(3) = arrow( [x1, y1], [x2, y2] ,...
%             'facecolor', clr, 'edgecolor', clr, 'length', 14, 'baseangle', 15, 'tipangle', 15);
    end
end


