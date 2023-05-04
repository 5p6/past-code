function label=labelarea(p)
[x,y]=size(p);
f=zeros(x+2,y+2);
f(2:x+1,2:y+1)=p;
label=zeros(x+2,y+2);
l=1;
for i=2:x+1
    for j=2:y+1
        if f(i,j)~=0
           if f(i-1,j)==0 && f(i,j-1)==0
               label(i,j)=l;
               l=l+1;
           elseif f(i-1,j)~=0 && f(i,j-1)~=0
               label(i,j)=min(label(i-1,j),label(i,j-1));
           elseif f(i-1,j)~=0 || f(i,j-1)~=0;
               label(i,j)=max(label(i,j-1),label(i-1,j));
           end
       end
    end
end
[r , c] = find( label ~= 0 );
    for ii = 1:length( r )
        if r(ii)-1 > 0
            up = r(ii)-1;
        else
            up = r(ii);
        end
        if r(ii)+1 <= x
            down = r(ii)+1;
        else
            down = r(ii);
        end
        if c(ii)-1 > 0
            left = c(ii)-1;
        else
            left = c(ii);
        end
        if c(ii)+1 <= y
            right = c(ii)+1;
        else
            right = c(ii);
        end

        tmpM = label(up:down , left:right);
        [r1 , c1] = find( tmpM ~= 0 );
        if ~isempty(r1)
            tmpM = tmpM(:);
            tmpM( tmpM == 0 ) = [];

            minV = min(tmpM);
            tmpM( tmpM == minV ) = [];
            for kk = 1:1:length(tmpM)
                label( label == tmpM(kk) ) = minV;
            end

        end
    end

    u = unique(label);
    for ii = 2:1:length(u)
        label(label == u(ii)) = ii-1;
    end
end