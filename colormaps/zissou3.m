function cmp=zissou3(vargin)

% function cmp=zissou3(vargin)
%
% Colormap based on the color palette of Wes Anderson's Life Aquatic.
% Directly from 
% http://wesandersonpalettes.tumblr.com/post/79956949771/steve-zissou-dont-point-that-gun-at-him-hes-an
%
% KIM 10.14


if nargin<1
    len=length(colormap);
else
    len=vargin(1);
end;

cmdata = [
    0.1055    0.2031    0.4219
    0.0039    0.6680    0.9102
    0.7617    0.8047    0.8125
    0.8945    0.7617    0.6172
    0.9570    0.2930    0.1016];


xcmdata=(1:size(cmdata,1))./size(cmdata,1);
dx = 1/(size(cmdata,1)-1);
xcmdata=0:dx:1;
dx = 1/(len-1);
xnew = 0:dx:1;
cmp=interp1(xcmdata,cmdata,xnew);