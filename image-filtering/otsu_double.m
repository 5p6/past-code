function otsu=otsu_double(p)
p=im2uint8(p);
[x,y]=size(p);
p_hist=imhist(p)./(x.*y);
P1=zeros(256,256);
m1=zeros(256,256);
P2=zeros(256,256);
m2=zeros(256,256);
m3=zeros(256,256);
P3=zeros(256,256);
var_o=zeros(256,256);
mg=mean2(p);
for k1=2:254%计算各分类的概率
    for k2=k1+1:255
    P1(k1,k2)=sum(sum(p_hist(1:k1,1)));
    P2(k1,k2)=sum(sum(p_hist(k1+1:k2,1)));
    P3(k1,k2)=sum(sum(p_hist(k2+1:256,1)));
    end
end
z=0:255;
average=z.*(p_hist');
for k1=2:254%均值
    for k2=k1+1:255
        if P1(k1,k2)~=0 
       m1(k1,k2)=sum(sum(average(1,1:k1)))./P1(k1,k2);
        end
        if P2(k1,k2)~=0 
       m2(k1,k2)=sum(sum(average(1,k1+1:k2)))./P2(k1,k2);
        end
        if P3(k1,k2)~=0 
       m3(k1,k2)=sum(sum(average(1,k2+1:256)))./P3(k1,k2);
        end
    end
end
for k1=2:254%类间方差
    for k2=k1+1:255
       var_o(k1,k2)=P1(k1,k2)*(m1(k1,k2)-mg)^2+P2(k1,k2)*(m2(k1,k2)-mg)^2+P3(k1,k2)*(m3(k1,k2)-mg)^2;
    end
end
c=find(var_o==max(max(var_o)));
f1=mod(c,256);
f2=(c-f1)./256;
otsu=[mean2(f1)-1 mean2(f2)];
end