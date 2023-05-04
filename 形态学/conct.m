function f=conct(g,G) %g是种子点图像 G是源图像
g=im2double(g);
i=0;
b=ones(3,3);
X=g;
while i<1
    X1=X;
    X=dilate(X,b)&G;
    if X1==X
        i=i+1;
    end
end
f=X;
end