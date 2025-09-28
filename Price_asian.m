function [price]=Price_asian(S0)
Nmc=10000; r=0.4;T=0.5;
for n=1:Nmc
    gain(n)=Payoff_Asian(S0);
end
price=exp(-r*T)*mean(gain);
end