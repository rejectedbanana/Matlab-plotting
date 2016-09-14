function plot_CTP( P, C, T, fig )

% function plot_CTP( P, C, T, fig )
%
%  Make a plot of conductivity and temperature vs. pressure
%
% KIM 08.11

if nargin < 4
    fig = 1; 
end

sfig(fig, 2, 2); clf

% start making subplots
subplot( 231 )
plot( T, P, '-' ); axis ij; xlabel( 'temp'); 
ylim( [nanmin( nanmin( P )), nanmax( nanmax( P ))]) 
% titleout( MP.info.sn )

subplot(234 )
plot( diff( T), P(1:end-1,:), '-' ); axis ij; xlabel( '\Delta T')
% titleout( ['station = ' ,MP.info.station] )
ylim( [nanmin( nanmin( P )), nanmax( nanmax( P ))]) 

subplot( 232 )
plot( C, P , '-'); axis ij; xlabel( 'cond')
ylim( [nanmin( nanmin( P )), nanmax( nanmax( P ))]) 

subplot(235 )
plot( diff( C), P(1:end-1,:), '-' ); axis ij; xlabel( '\Delta C')
ylim( [nanmin( nanmin( P )), nanmax( nanmax( P ))]) 

subplot( 144 )
plot(C, T, '-')
ylabel( 'temp'); xlabel( 'cond')
grid on
scoot_axes( [-0.08, 0, 0.1, 0])
