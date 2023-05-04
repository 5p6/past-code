function f=reopen(F,b,n)%膨胀形态学重建
g=corrosionc(F,b,n);
B=ones(3,3);
f=RD(g,F,B);
end