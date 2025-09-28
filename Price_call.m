function[price]=Price_call(S0)
r=0.1;sigma=0.5;T=0.5;K=10;Nmc=2^15;
for n=1:Nmc
    S_T=S0.*exp((r-0.5.*sigma.^2)*T+sigma*sqrt(T).*randn);
    gain(n)=payoff_call(S_T,K);
end
price=exp(-r.*T).*mean(gain);
end