function f=hmitunxy(g)
g=im2double(g); 
[x,y]=size(g);
picure=zeros(x+2,y+2);
for i=2:x+1
    for j=2:y+1
        picure(i,j)=g(i-1,j-1);
    end
end
f=zeros(x,y);
for i=2:x+1
    for j=2:y+1
        f(i-1,j-1)=picure(i+1,j+1)+picure(i,j)-picure(i+1,j)-picure(i,j+1);
    end
end
end