function [h] = kellipse( u, uphs, v , vphs, clr, lwidth, offset, plot_arrow )

% function [h] = kellipse( u, uphs, v , vphs, clr, lwidth,
% offset, plot_arrow )
%
% Plots an ellipse from u and v amplitude and phase.
% uphs and vphs are in degrees
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

% plot ellipse
h(1) = plot( uvec+offset(1), vvec+offset(2), 'color', clr, 'linewidth', lwidth, 'linestyle', '-');
hold on

% plot a line indicating the start time
h(2) = plot( [uvec(1), 0]+offset( 1), [vvec(1), 0]+offset( 2), 'color', clr, 'linewidth', lwidth,'linestyle', '-');

if plot_arrow ==1
    if sum( isnan( [u, uphs, v, vphs]) ) == 0
%         Show rotation direction with arrow
        h(3) = arrow( [uvec(1)+offset(1), vvec(1)+offset( 2)] , [uvec(2)+offset( 1 ), vvec(2)+offset( 2)] ,...
            'facecolor', clr, 'edgecolor', clr, 'length', 14, 'baseangle', 15, 'tipangle', 15);
    end
end
% h(3) = quiver( uvec( 1), vvec( 1), uvec( 2)- uvec( 1) , vvec( 2)-vvec( 1) , 18 ,...
%     '-','color', clr, 'MaxHeadSize', 4, 'linewidth', lwidth);


