function f_s=canny_e(gN,th,tl)%连通性
c1=find(gN>=th);
c2=find(gN>=tl);
[x,y]=size(gN);
f=zeros(x+2,y+2);
gh=zeros(x,y);
gl=zeros(x,y);
gh(c1)=1;
gl(c2)=1; %%双阈值处理
picure_l=zeros(x+2,y+2);
picure_l(2:x+1,2:y+1)=gl;
picure_h=zeros(x+2,y+2);
picure_h(2:x+1,2:y+1)=gh;
c3=find(picure_h==1);
for i=1:size(c3,1)
    s=mod(c3(i),x+2);
    t=(c3(i)-s)/(x+2)+1;
    f(s-1:s+1,t-1:t+1)=picure_l(s-1:s+1,t-1:t+1);
end
f_s=f(2:x+1,2:y+1);
end