function f=RE(g,b)%膨胀形态学重建
f=g-corrosion(g,b);
end