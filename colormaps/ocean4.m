function ocean3=ocean4(num);
if nargin < 1
    num=64;
end
ocean1=ocean2(2*num);
ocean3=ocean1(num+1:2*num,:);
%Now put gray for land
ocean3(num,:)=0.7;