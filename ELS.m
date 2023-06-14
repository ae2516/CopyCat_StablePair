function zstar=ELS(d, K, h)

T=length(d);

V=zeros(T+1,1);
V(T+1)=0;
for t=T:-1:1
    if d(t)==0
        V(t)=V(t+1);
    else
        BestCost=inf;
        for v=t:T
            CostToGo=K+V(v+1);
            for u=t:v
                CostToGo=CostToGo+(u-t)*h*d(u);
            end
            if CostToGo< BestCost
                BestCost=CostToGo;
            end
        end
        V(t)=BestCost;
    end
end
zstar=V(1);
            