function f=otsu(p)
[x,y]=size(p);
p_hist=imhist(p)./(x.*y);
P=zeros(1,256);
m=zeros(1,256);
for k=1:256
        P(1,k)=sum(sum(p_hist(1:k,1)));
end
for k=1:256
    for i=0:k-1
       m(1,k)=i*p_hist(i+1,1)+m(1,k);
     end
end
z=0:255;
mg=sum(sum(z.*(p_hist')));
var_o=zeros(1,256);
for k=1:256
     if P(1,k)~=0 && P(1,k)=1
     var_o(1,k)=(mg.*P(1,k)-m(1,k)).^2./(P(1,k).*(1-P(1,k)));
     end
end
omax=max(var_o);
f_s=find(var_o==omax);
if size(f_s,2)~=1
    f=mean(f_s);
else
    f=f_s;
end
end