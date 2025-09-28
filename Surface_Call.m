function []= Surface_Call()
%parameters 
K=10;
Smax = 25;       % massimo S da plottare
Ns   = 80;       % numero di passi
delta_s = Smax/Ns;

T = 0.5;         % scadenza
Nt  = 60;        % numero di passi sul tempo
delta_t = T/Nt;

for j=1:Ns+1
    for m=1:Nt+1
        St(j)=delta_s*(j-1);
        t(m)=delta_t*(m-1);
        if t(m) >= T
                price(j,m) = max(St(j) - K, 0);  % bordo a scadenza, potrebbe dare numeri complessi
             else
                 
                 price(j,m) = Price_call_generic(St(j), t(m));
             end
     
    end
end
surf(t,St,price); colormap 'jet';
xlabel('time'); ylabel('price St');zlabel('option price'); 
end
