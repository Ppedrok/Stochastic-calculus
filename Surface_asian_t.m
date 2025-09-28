function[]=Surface_asian_t()
T=0.5;
t=2*T/3;
Ns=41;
NA=41;delta_s=0.5;delta_A=0.5;
for j=1:Ns
    for m=1:NA
        St(j)=delta_s*(j-1);
        At(m)=delta_A*(m-1);

        price(m,j)=Price_Asian_t(t,St(j),At(m));
    end

end
surf(St,At,price)
colormap 'jet'
xlabel('St'); ylabel('At'); zlabel('price');
end