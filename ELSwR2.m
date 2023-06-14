function [zstar, zstar2]=ELSwR2(d, K, h, r)

T=length(d);

V=zeros(T+1,1);
V2=zeros(T+1,1);

for t=T:-1:1
    if d(t)==0
        V(t)=V(t+1);
        V2(t)=V2(t+1);
    else
        BestCost=r*d(t)+V(t+1);
        BestProf=V2(t+1);
        for v=t:T
     
            CostToGo=K+V(v+1);
          
            ProfToGo=-K+V2(v+1);
            if v>t+floor(r/h)
                for u=t:t+floor(r/h)
                    CostToGo=CostToGo+(u-t)*h*d(u);
                    ProfToGo=ProfToGo-(u-t)*h*d(u)+r*d(u);
                end
                for u=t+floor(r/h)+1:v
                    CostToGo=CostToGo+r*d(u);
                    ProfToGo=ProfToGo;
                end
                
            else
                for u=t:v
                    CostToGo=CostToGo+(u-t)*h*d(u);
                    ProfToGo=ProfToGo+(u-t)*h*d(u)+r*d(u);
                end
            end
            
            if CostToGo < BestCost
                BestCost=CostToGo;
                BestProf=ProfToGo;
            end
        end
        V(t)=BestCost;
        V2(t)=BestProf;
    end
end
zstar=V(1);
zstar2=V2(1);

            