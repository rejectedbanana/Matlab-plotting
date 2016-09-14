function [cdmat] = cdatavec(inputvec,cmapstr);

% takes a vector and maps it to a sepcified colormap if you need
% it for Cdata.

[d1,d2]=size(inputvec);
lvec=d1*d2;

%reshape into vector
inputvec=reshape(inputvec, [d1*d2, 1]);

%define the colormap indices
eval(['cmap=', cmapstr, '(', num2str(lvec), ');'])
shiftinput=inputvec-min(inputvec);
cdveci=round(shiftinput.*lvec./max(shiftinput));

%make sure that the lowest indice is one by shifting it up
i1=find(cdveci<1);
cdveci(i1)=1;

%map onto the colormap
cdvec=ones(lvec,1,3)*nan;
for i=1:lvec
    if isnan(cdveci(i))==0
    cdvec(i,:)=cmap(cdveci(i),:);
    else
        cdvec(i,:)=nan;
    end
end

cdmat=squeeze(reshape(cdvec, [d1,d2,3]));