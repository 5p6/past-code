function f=thining(g,B)
g=im2double(g);
[x,y]=size(g);
f=g;
X=zeros(x,y);
j=0;
while(j==0)
    for i=1:8
    X=f;
    f=f-(HMT(f,B(:,:,i)));
      if X==f
        j=j+1;
      end
    end
end
end