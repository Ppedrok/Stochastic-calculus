function [] = Graph_asian()
Ns=41; deltas=20/Ns; K=10;
for j=1:Ns
    S0(j)=deltas*(j-1);
    price(j)=Price_asian(S0(j));
    price_call(j)=Price_call(S0(j));
end
plot(S0,price); hold on;
payoff=max(S0-K,0);
plot(S0,payoff); hold on;
plot(S0,price_call);

end