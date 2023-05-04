function [H,w]=batwosi(wc,o1,wp,o2,T)
N1=(log(((1/o2)^2-1)/((1/o1)^2-1))/log(wp/wc))*0.5;
if N1-fix(N1)<=0.5
    N=fix(N1);
else
    N=fix(N1)+1;
end
O=wc/(((1/o1)^2-1)^(1/(2*N))*T);
s=zeros(1,N);
for i=0:N-1
    s(1,i+1)=O.*exp((i*pi/N+(N+1)*pi/(2*N))*1j);
end
f=zeros(1,fix(2*pi/T)+1,N+1);
f(:,:,1)=1;
w=0:T:2*pi;
for i=1:N
    f(:,:,i+1)=(1j.*w./T-s(1,i)).*f(:,:,i);
end
H=1.*O.^N./f(:,:,N+1);
end