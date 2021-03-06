function cmp=bwr(vargin);
  
  if nargin<1
    len=length(colormap);
  else
    len=vargin(1);
  end;
  
cmdata=[
         0         0    0.5625
         0         0    0.6111
         0         0    0.6597
         0         0    0.7083
         0         0    0.7569
         0         0    0.8056
         0         0    0.8542
         0         0    0.9028
         0         0    0.9514
         0         0    1.0000
    0.0544    0.0856    1.0000
    0.1087    0.1713    1.0000
    0.1631    0.2569    1.0000
    0.2174    0.3425    1.0000
    0.2718    0.4281    1.0000
    0.3262    0.5138    1.0000
    0.3805    0.5994    1.0000
    0.4349    0.6850    1.0000
    0.4892    0.7707    1.0000
    0.5436    0.8563    1.0000
    0.5851    0.8694    1.0000
    0.6266    0.8824    1.0000
    0.6681    0.8955    1.0000
    0.7096    0.9086    1.0000
    0.7511    0.9216    1.0000
    0.7925    0.9347    1.0000
    0.8340    0.9477    1.0000
    0.8755    0.9608    1.0000
    0.9170    0.9739    1.0000
    0.9585    0.9869    1.0000
    1.0000    1.0000    1.0000
    1.0000    1.0000    1.0000
    1.0000    1.0000    1.0000
    1.0000    1.0000    0.9091
    1.0000    1.0000    0.8182
    1.0000    1.0000    0.7273
    1.0000    1.0000    0.6364
    1.0000    1.0000    0.5455
    1.0000    1.0000    0.4545
    1.0000    1.0000    0.3636
    1.0000    1.0000    0.2727
    1.0000    1.0000    0.1818
    1.0000    1.0000    0.0909
    1.0000    1.0000         0
    1.0000    0.9000         0
    1.0000    0.8000         0
    1.0000    0.7000         0
    1.0000    0.6000         0
    1.0000    0.5000         0
    1.0000    0.4000         0
    1.0000    0.3000         0
    1.0000    0.2000         0
    1.0000    0.1000         0
    1.0000         0         0
    0.9500         0         0
    0.9000         0         0
    0.8500         0         0
    0.8000         0         0
    0.7500         0         0
    0.7000         0         0
    0.6500         0         0
    0.6000         0         0
    0.5500         0         0
    0.5000         0         0];
  
  
xcmdata=(1:size(cmdata,1))./size(cmdata,1);
dx = 1/(size(cmdata,1)-1);
xcmdata=0:dx:1;
dx = 1/(len-1);
xnew = 0:dx:1;
cmp=interp1(xcmdata,cmdata,xnew);