function [price]= price_stoch_option(S0,r0)

    K      = 10;
    T      = 0.5;          % anni
    M      = 100;        % steps temporali
    Nmc      = 1000;        % simulazioni Monte Carlo
    %seed   = 123;
    %rng(seed);              %opzionale per replicabilità = questo rende la
                             %superifice molto smooth perchel'errore è uniforme . Lo disattivo per
                             %vedere che all'aumentare della simulazione montecarlo è sempre piu
                             %preciso.

    %------%
    %rng(seed);
    delta_t = T/M;
    disc = zeros(Nmc,1);
    gain=zeros(Nmc,1);

    for i=1:Nmc
        [r,S]=simulate_paths(S0,r0);
        gain(i)=max(S(end)-K,0);
        % come A = A + S(i+1)*dt per le asian
        int_r_dt = delta_t * sum(r(2:end)); % integrale di rs in ds
        disc(i) = exp(-int_r_dt); % exp ( integrale di rs in ds )

    end
    price = mean(disc .* gain);





end




%-------------------% local function %--------------------%

% la stessa funzione Simulate_paths, solo che ho cambiato nome per evitare
% conflitti e levare il plot alla fine.
function [r,S,t] = simulate_paths(S0,r0)
    % Parametri del modello
    kappa = 0.7;      % velocità di mean reversion
    theta = 0.05;     % livello di lungo periodo
    sigma_r = 0.02;         % volatilità tasso
    sigma_s=  0.4;          % volatilità stock
    
    
    r(1)=r0; 
    S(1)=S0;
    T     = 0.5;        % orizzonte (anni)
    M     = 100;  % steps di discretizzazione
    delta_t = T/M;
    t  = linspace(0, T, M+1);

    rho = -0.3;                % esempio correlazione
    C = [1 rho; rho 1];       % matrice di covarianza
    L = chol(C,'lower');      % fattore di Cholesky

    for i=1:M
         Z_ind = randn(2,1);   % due Normali indipendenti
        Z = L*Z_ind;          % li trasformo
        Zs = Z(1);            % shock stock
        Zr = Z(2);            % shock tasso



        r(i+1)=r(i)+ kappa*(theta-r(i))*delta_t+sigma_r*sqrt(delta_t)*Zr;
        S(i+1) = S(i)*exp((r(i) - 0.5*sigma_s^2)*delta_t + sigma_s*sqrt(delta_t)*Zs);
    end



end