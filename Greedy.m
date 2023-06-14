function x = Greedy(K,h,d,r,t)
x=0;
T=length(d);
for s=t:-1:max(1,ceil(t-r/h))
    profit=r*sum(d(s:min(floor(s+r),T)));
    cost=K;
    for u=s:min(floor(s+r/h),T)
        cost=cost+d(u)*h*(u-s);
    end
    if profit >=cost
        x=1;
    end
end