% function price = Price_call_generic(St, t)
% r=0.1;sigma=0.5;T=0.5;K=10;Nmc=2^17;
%     % Simulazioni Monte Carlo condizionate a (t, St)
%     Z  = randn(Nmc,1);
%     ST = St * exp((r - 0.5*sigma^2)*(T - t) + sigma*sqrt(T - t).*Z);
% 
%     % Payoff
%     payoff = max(ST - K, 0);
% 
%     % Prezzo attualizzato
%     price = exp(-r*(T - t)) * mean(payoff);
% end

% in forma non vettorizzata 
function price = Price_call_generic(St,t)
        r=0.1;sigma=0.5;T=0.5;K=10;Nmc=1000;
        for i=1:Nmc
             ST = St * exp((r - 0.5*sigma^2)*(T - t) + sigma*sqrt(T - t).*randn);
             gain(i)=payoff_call(ST,K);

        end
        price = exp(-r*(T - t)) * mean(gain);

end