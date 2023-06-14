function x = Copycat(K,h,d,r,k)
x=0;
T=length(d);
V=zeros(T+1,1);
argmax=zeros(T+1,1);
argmax(T+1)=0;
for t=T:-1:1
    if d(t)==0
        V(t)=V(t+1);
    else
        BestCost=inf;
        for v=t:T
            CostToGo=K+V(v+1);
            if v>t+r
                for u=t:t+floor(r)
                    CostToGo=CostToGo+(u-t)*h*d(u);
                end
                for u=t+floor(r)+1:v
                    CostToGo=CostToGo+r*d(u);
                end
                
            else
                for u=t:v
                    CostToGo=CostToGo+(u-t)*h*d(u);
                end
            end
            if CostToGo< BestCost
                BestCost=CostToGo;
                argmax(t)=v+1;
            end
            if r*d(t)+V(t+1)<BestCost
                BestCost=r*d(t)+V(t+1);
                argmax(t)=0;
            end
        end
        V(t)=BestCost;
    end
end

t=1;
setups=zeros(T,1);
while t <T
    
    if argmax(t) ==0
        t=t+1;
    else
        setups(t)=1;
        t=argmax(t);
    end
end

if sum(setups(max(1,ceil(k-r)):k))>0
    x=1;
end

            