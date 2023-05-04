function f=marr_zero(g,percent)
[x,y]=size(g);
f=zeros(x,y);
gmax=max(max(g));
for i=2:x-1
    for j=2:y-1
        if g(i,j)>percent*gmax
        if g(i-1,j)*g(i+1,j)<0 && abs(g(i-1,j)-g(i+1,j))>percent*gmax
            f(i,j)=1;
        elseif g(i,j-1)*g(i,j+1)<0 && abs(g(i,j-1)-g(i,j+1))>percent*gmax
            f(i,j)=1;
        elseif g(i-1,j-1)*g(i+1,j+1)<0 && abs(g(i-1,j-1)-g(i+1,j+1))>percent*gmax
            f(i,j)=1;
        elseif g(i-1,j+1)*g(i+1,j-1)<0 && abs(g(i-1,j+1)-g(i+1,j-1))>percent*gmax
           f(i,j)=1;
        end
        end
    end
end
end