function f=RD(F,G,b)%膨胀形态学重建
i=0;
while i<1
        X=F;
        F=D(F,G,b,1);
        if X==F
            i=i+1;
            break;
        end
end
f=X;
end
