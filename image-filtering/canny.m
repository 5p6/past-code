function f=canny(M,a)%非极大值抑制
[x,y]=size(M);
m=zeros(x+2,y+2);
m(2:x+1,2:y+1)=im2double(M);
f=zeros(x,y);
for i=3:x+1
    for j=3:y+1
        if a(i-1,j-1)>=-pi/8 || a(i-1,j-1)<=pi/8
            if m(i,j)>=m(i,j-1) && m(i,j)>=m(i,j+1)
                f(i-1,j-1)=m(i,j);
            else
                f(i-1,j-1)=0;
            end
        elseif a(i-1,j-1)>=3*pi/8 || a(i-1,j-1)<=4*pi/8 || a(i-1,j-1)<=-3*pi/8 || a(i-1,j-1)>=-4*pi/8
            if m(i,j)>=m(i-1,j) && m(i,j)>=m(i+1,j)
               f(i-1,j-1)=m(i,j);
            else
                f(i-1,j-1)=0;
            end
        elseif a(i-1,j-1)<3*pi/8 || a(i-1,j-1)>pi/8
            if m(i,j)>=m(i-1,j+1) && m(i,j)>=m(i+1,j-1)
               f(i-1,j-1)=m(i,j);
            else
                f(i-1,j-1)=0;
            end
        else
            if m(i,j)>=m(i-1,j-1) && m(i+1,j+1)>=m(i+1,j+1)
               f(i-1,j-1)=m(i,j);
            else
                f(i-1,j-1)=0;
            end
        end
    end
end
end