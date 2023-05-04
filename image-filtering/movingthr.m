function f=movingthr(g,n,c)
g=im2double(g);
[x,y]=size(g);
mxy=zeros(x,y);
f=zeros(x,y);
for i=1:x
    for j=1:y
        if i==1 
          if j<=20
          mxy(i,j)=sum(sum(g(i,1:j)))./20;
          else
          mxy(i,j)=sum(sum(g(i,j-n+1:j)))/n;
          end
        elseif mod(i,2)==1
            if j<n  && i>1 
            mxy(i,j)=(sum(sum(g(i,1:j)))+sum(sum(g(i-1,1:n-j))))/n;
            elseif j>=n && i>1
            mxy(i,j)=sum(sum(g(i,j-n+1:j)))/20;
            end
        elseif mod(i,2)==0
             if y-j+1<n 
             mxy(i,j)=(sum(sum(g(i,j:y)))+sum(sum(g(i-1,y-(n-y+j):y))))/n;
             else
              mxy(i,j)=sum(sum(g(i,j:j+n-1)))./n;
             end
        end
    end
end
for i=1:x
    for j=1:y
        if g(i,j)>=c*mxy(i,j)
            f(i,j)=1;
        end
    end
end
end