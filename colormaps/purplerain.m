function cmp=purplerain(vargin)
%
% A muted purple/green/yellow palette. Needs some refining
%
% KIM 6.2016


if nargin<1
    len=length(colormap);
else
    len=vargin(1);
end;

cmdata = [
    0.8789    0.6836         0
    0.6314    0.8549    0.7059
    0.1725    0.4980    0.7216
    0.5059    0.0588    0.4863];


xcmdata=(1:size(cmdata,1))./size(cmdata,1);
dx = 1/(size(cmdata,1)-1);
xcmdata=0:dx:1;
dx = 1/(len-1);
xnew = 0:dx:1;
cmp=interp1(xcmdata,cmdata,xnew);