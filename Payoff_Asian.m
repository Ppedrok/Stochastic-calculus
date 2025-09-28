function[gain]=Payoff_Asian(S0)
A=0;S(1)=S0;r=0.4;K=10;sigma=0.5;T=0.5;N=100;delta_t=T/N;
for i=1:N
    S(i+1)=S(i)*exp((r-0.5*sigma^2)*delta_t+sigma*sqrt(delta_t)*randn);
    A=A+S(i+1)*delta_t;
end
gain=max(A/T - K,0);
end



% % floating case
% function[gain]=Payoff_Asian(S0)
% A=0;S(1)=S0;r=0.4;sigma=0.5;T=0.5;N=100;delta_t=T/N;
% for i=1:N
%     S(i+1)=S(i)*exp((r-sigma^2)*delta_t+sigma*sqrt(delta_t)*randn);
%     A=A+S(i+1)*delta_t;
% end
% gain=max(A/T - S(i+1),0);
% end