function[price]=Price_Asian_t(t,St,At)
Nmc=10000;
T=0.5;
r=0.4;
for n=1:Nmc
    gain(n)=Payoff_Asian_t(t,St,At);
end

price=exp(-r*(T-t))*mean(gain);
end