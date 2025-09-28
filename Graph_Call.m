function[]=Graph_Call()
N=41; deltas=20/N; K=10;
%S0=linspace(0,20,N);
price=zeros(1,N);
for j=1:N
    S0(j)=deltas*(j-1);
    price(j)=Price_call(S0(j));

end
payoff=max(S0-K,0);
    plot(S0,price); hold on;
    plot(S0,payoff);
  

end
