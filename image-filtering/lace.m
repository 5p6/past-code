function picure_s=lace(g)
z=[1 1 1;1 -8 1;1 1 1];
g=im2double(g);
[x,y]=size(g);
picure=zeros(x+2,y+2);
picure_s=zeros(x,y);
picure(2:x+1,2:y+1)=g;
for i=2:x+1
    for j=2:y+1
    picure_s(i-1,j-1)=sum(sum(z.*picure(i-1:i+1,j-1:j+1)));
    end
end
end
