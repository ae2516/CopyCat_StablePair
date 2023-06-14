K=100;
h=1;
T=30;
N=300;
r=5;
ratios1=zeros(N,1);
ratios2=zeros(N,1);
ratios3=zeros(N,1);
ratiosA=zeros(N,1);
ratiosR=zeros(N,1);

profit=zeros(N,1);
profit1=zeros(N,1);
profit2=zeros(N,1);
profit3=zeros(N,1);
SimCount=100;
 for count=1:SimCount
d=zeros(T,1);
dA1=zeros(T,1);
dA2=zeros(T,1);
dA3=zeros(T,1);
%d(1:14:T)=round(K/r)+1;
%dA1(1:14:T)=round(K/r)+1;
%dA2(1:14:T)=round(K/r)+1;
%dA3(1:14:T)=round(K/r)+1;

rA1=0;
rA2=0;
rA3=0;

ratio=2;
demand=zeros(N,T);
    for n=1:N
        t=ceil(rand()*T);
        D=ceil(1*rand());
        d(t)=d(t)+D;
        %demand(n,:)=d';
        [Zstar, Zstar2]= ELSwR2(d,K,h,r);
        if Greedy(K,h,d,r*1,t)==1
            dA1(t)=dA1(t)+D;
        else
            rA1=rA1+r*D;
        end
        if Greedy(K,h,d,r*ratio,t)==1
            dA2(t)=dA2(t)+D;
        else
            rA2=rA2+r*D;
        end

        if Copycat(K,h,d,r*1,t)==1
            dA3(t)=dA3(t)+D;
        else
            rA3=rA3+r*D;
        end

        SystemCost1=ELS(dA1,K,h);
        SystemCost2=ELS(dA2,K,h);
        SystemCost3=ELS(dA3,K,h);

        ratios1(n)=ratios1(n)+(rA1+SystemCost1)/(SimCount*Zstar);
        ratios2(n)=ratios2(n)+(rA2+SystemCost2)/(SimCount*Zstar);
        ratios3(n)=ratios3(n)+(rA3+SystemCost3)/(SimCount*Zstar);
        
        ratiosA(n)=ratiosA(n)+ELS(d,K,h)/(SimCount*Zstar);
        ratiosR(n)=ratiosR(n)+r*sum(d)/(SimCount*Zstar);
        
        profit(n)=profit(n)+Zstar2/SimCount;
        profit1(n)=profit1(n)+(r*sum(d)-rA1-SystemCost1)/SimCount;
        profit2(n)=profit2(n)+(r*sum(d)-rA2-SystemCost2)/SimCount;
        profit3(n)=profit3(n)+(r*sum(d)-rA3-SystemCost3)/SimCount;

    end
 end
figure
subplot(3,1,1);
plot(ratios3,'k','LineWidth',2);
hold on
 plot(ratios1,'k--','LineWidth',2);
 plot(ratios2,'k','LineWidth',4);
 

% plot(ratiosR,'r')
 legend('Copycat', 'StablePair', 'StablePair with Scaling')
xlabel('Number of Customers')
ylabel('Performance Ratio')
title('Conservative Scenario')

K=100;
h=1;
T=30;
N=300;
r=5;
ratios1=zeros(N,1);
ratios2=zeros(N,1);
ratios3=zeros(N,1);
ratiosA=zeros(N,1);
ratiosR=zeros(N,1);

profit=zeros(N,1);
profit1=zeros(N,1);
profit2=zeros(N,1);
profit3=zeros(N,1);
SimCount=50;
 for count=1:SimCount
d=zeros(T,1);
dA1=zeros(T,1);
dA2=zeros(T,1);
dA3=zeros(T,1);
%d(1:14:T)=round(K/r)+1;
%dA1(1:14:T)=round(K/r)+1;
%dA2(1:14:T)=round(K/r)+1;
%dA3(1:14:T)=round(K/r)+1;

rA1=0;
rA2=0;
rA3=0;

ratio=2;
demand=zeros(N,T);
    for n=1:N
        t=ceil(rand()*T);
        D=ceil(10*rand());
        d(t)=d(t)+D;
        %demand(n,:)=d';
        [Zstar, Zstar2]= ELSwR2(d,K,h,r);
        if Greedy(K,h,d,r*1,t)==1
            dA1(t)=dA1(t)+D;
        else
            rA1=rA1+r*D;
        end
        if Greedy(K,h,d,r*ratio,t)==1
            dA2(t)=dA2(t)+D;
        else
            rA2=rA2+r*D;
        end

        if Copycat(K,h,d,r*1,t)==1
            dA3(t)=dA3(t)+D;
        else
            rA3=rA3+r*D;
        end

        SystemCost1=ELS(dA1,K,h);
        SystemCost2=ELS(dA2,K,h);
        SystemCost3=ELS(dA3,K,h);

        ratios1(n)=ratios1(n)+(rA1+SystemCost1)/(SimCount*Zstar);
        ratios2(n)=ratios2(n)+(rA2+SystemCost2)/(SimCount*Zstar);
        ratios3(n)=ratios3(n)+(rA3+SystemCost3)/(SimCount*Zstar);
        
        ratiosA(n)=ratiosA(n)+ELS(d,K,h)/(SimCount*Zstar);
        ratiosR(n)=ratiosR(n)+r*sum(d)/(SimCount*Zstar);
        
        profit(n)=profit(n)+Zstar2/SimCount;
        profit1(n)=profit1(n)+(r*sum(d)-rA1-SystemCost1)/SimCount;
        profit2(n)=profit2(n)+(r*sum(d)-rA2-SystemCost2)/SimCount;
        profit3(n)=profit3(n)+(r*sum(d)-rA3-SystemCost3)/SimCount;

    end
end
subplot(3,1,2);
plot(ratios3,'k','LineWidth',2);
hold on
 plot(ratios1,'k--','LineWidth',2);
 plot(ratios2,'k','LineWidth',4);
 

% plot(ratiosR,'r')
 legend('Copycat', 'StablePair', 'StablePair with Scaling')
xlabel('Number of Customers')
ylabel('Performance Ratio')
title('More Demands Scenario')

K=100;
h=1;
T=30;
N=300;
r=5;
ratios1=zeros(N,1);
ratios2=zeros(N,1);
ratios3=zeros(N,1);
ratiosA=zeros(N,1);
ratiosR=zeros(N,1);

profit=zeros(N,1);
profit1=zeros(N,1);
profit2=zeros(N,1);
profit3=zeros(N,1);
SimCount=50;
 for count=1:SimCount
d=zeros(T,1);
dA1=zeros(T,1);
dA2=zeros(T,1);
dA3=zeros(T,1);
d(1:14:T)=round(K/r)+1;
dA1(1:14:T)=round(K/r)+1;
dA2(1:14:T)=round(K/r)+1;
dA3(1:14:T)=round(K/r)+1;

rA1=0;
rA2=0;
rA3=0;

ratio=2;
demand=zeros(N,T);
    for n=1:N
        t=ceil(rand()*T);
        D=ceil(10*rand());
        d(t)=d(t)+D;
        %demand(n,:)=d';
        [Zstar, Zstar2]= ELSwR2(d,K,h,r);
        if Greedy(K,h,d,r*1,t)==1
            dA1(t)=dA1(t)+D;
        else
            rA1=rA1+r*D;
        end
        if Greedy(K,h,d,r*ratio,t)==1
            dA2(t)=dA2(t)+D;
        else
            rA2=rA2+r*D;
        end

        if Copycat(K,h,d,r*1,t)==1
            dA3(t)=dA3(t)+D;
        else
            rA3=rA3+r*D;
        end

        SystemCost1=ELS(dA1,K,h);
        SystemCost2=ELS(dA2,K,h);
        SystemCost3=ELS(dA3,K,h);

        ratios1(n)=ratios1(n)+(rA1+SystemCost1)/(SimCount*Zstar);
        ratios2(n)=ratios2(n)+(rA2+SystemCost2)/(SimCount*Zstar);
        ratios3(n)=ratios3(n)+(rA3+SystemCost3)/(SimCount*Zstar);
        
        ratiosA(n)=ratiosA(n)+ELS(d,K,h)/(SimCount*Zstar);
        ratiosR(n)=ratiosR(n)+r*sum(d)/(SimCount*Zstar);
        
        profit(n)=profit(n)+Zstar2/SimCount;
        profit1(n)=profit1(n)+(r*sum(d)-rA1-SystemCost1)/SimCount;
        profit2(n)=profit2(n)+(r*sum(d)-rA2-SystemCost2)/SimCount;
        profit3(n)=profit3(n)+(r*sum(d)-rA3-SystemCost3)/SimCount;

    end
end
subplot(3,1,3);
plot(ratios3,'k','LineWidth',2);
hold on
 plot(ratios1,'k--','LineWidth',2);
 plot(ratios2,'k','LineWidth',4);
 
% plot(ratiosR,'r')
 legend('Copycat', 'StablePair', 'StablePair with Scaling')
xlabel('Number of Customers')
ylabel('Performance Ratio')
title('Large Orders First Scenario')

