function plot_coherence( fr, S1, S2, CS, coh, ph,  xlimer, fig)

% function plot_coherence( fr, S1, S2, CS, xlimer, fig)
%
%  plots spectra, cospectra, coherence and phase from the function speccoherence
%
% KIM 08.11

% set figure window to use if none defined
if nargin < 8
    fig = 1; 
end
% if no xlims, define them
if nargin < 7
    xlimer = [ fr(2), fr(end)]; 
end

figure(fig); clf
set( gcf, 'position', [ 1024         131         608        1105])

% plot the spectra and cospectra
subplot( 411 )
loglog(  fr, S1, 'r-', fr, S2, 'b-',  fr, abs(CS), 'k-', 'linewidth', 2); axis tight
legend( 'x spectra', 'y spectra', 'cospectra', 'location', 'southwest'); xlim( xlimer ); titleout('cospectra')

% coherence plot
subplot( 412 )
semilogx( fr, coh, 'r-', 'linewidth', 2); ylabel( 'x-y coherence'); xlim( xlimer ); ylim( [0 1])

% phase plot
subplot( 413 )
semilogx( fr, ph*180./pi, 'r-', 'linewidth', 2);   axis tight; axis( [xlimer,  -180, 180]); hold on
ylabel( 'phase [^\circ]'); ylim( [-1 1]*180)
horzline( 0 ); set( gca, 'ytick', [-180, -90, 0, 90, 180]); grid on

% plot power ratio
subplot( 414 )
loglog( fr,  S1./ S2, 'r-', 'linewidth', 2); xlim( xlimer )
xlabel( 'frequency [Hz]'); ylabel( 'x/y energy ratio'); horzline( 1 )