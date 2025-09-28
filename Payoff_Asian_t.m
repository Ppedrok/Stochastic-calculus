function [gain]= Payoff_Asian_t(t,St,At)
N=100;
K=10;
r=0.4;
sigma=0.5;
T=0.5;
S(1)=St;
delta_t=(T-t)/N;
A=At*t;
for i=1:N
    S(i+1)=S(i)*exp((r-0.5*sigma^2)*(delta_t)+sigma*sqrt(delta_t)*randn);
    A=A+S(i+1)*delta_t;
end
gain=max((A/T)-K,0);
end



% floating case
% function [gain]= Payoff_Asian_t(t,St,At)
% N=100;
% K=10;
% r=0.4;
% sigma=0.5;
% T=0.5;
% S(1)=St;
% delta_t=(T-t)/N;
% A=At*t;
% for i=1:N
%     S(i+1)=S(i)*exp((r-sigma^2)*(delta_t)+sigma*sqrt(delta_t)*randn);
%     A=A+S(i+1)*delta_t;
% end
% gain=max((A/T)-S(N+1),0);
% end
