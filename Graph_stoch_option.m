% function [] = Graph_stoch_option()
%graph in 2d with fixd r0
%     % Parametri grafico
%     Ns    = 41; 
%     Smax  = 20; 
%     K     = 10;
%     r0=0.1;
%     % Asse S0
%     S0 = linspace(0, Smax, Ns);
%     % Preallocazioni
%     price_stoch = zeros(1, Ns);
% 
%     % Loop su S0 e fisso r0.
%     for j = 1:Ns
%         price_stoch(j) = price_stoch_option(S0(j),r0);
% 
%     end
% 
%     % Payoff a scadenza
%     payoff = max(S0 - K, 0); %european vanilla
% 
%     % Plot
%     figure; 
%     plot(S0, price_stoch, 'LineWidth', 1.6); hold on;
%     plot(S0, payoff, '--', 'LineWidth', 1.2);
%     grid on; xlabel('S_0'); ylabel('Price');
%     title('Stochastic interest rate - European Call option');
%     legend('Price', 'Payoff \{S_0-K,0\}', 'Location', 'NorthWest');
% end


% graph in 3d of the price function V(S0,r0) per t=0.

% function [] = Graph_stoch_option()
%     % griglie
%     Ns   = 41;          % punti su S0
%     Nr   = 41;          % punti su r0
%     Smax = 20;          % S0 in [0, Smax]
%     rmin = 0.00;        % r0 in [rmin, rmax]
%     rmax = 0.20;
% 
%     S0_vals = linspace(0, Smax, Ns);
%     r0_vals = linspace(rmin, rmax, Nr);
% 
%     % matrice dei prezzi: righe = r0, colonne = S0
%     Z = zeros(Nr, Ns);
%     for i = 1:Nr
%         for j = 1:Ns
%             Z(i,j) = price_stoch_option(S0_vals(j), r0_vals(i));
%         end
%     end
% 
%     % superfici
%     [Sgrid, Rgrid] = meshgrid(S0_vals, r0_vals);
% 
%     figure;
%     surf(Sgrid, Rgrid, Z);
%     colormap 'jet';
%     grid on; xlabel('S_0'); ylabel('r_0'); zlabel('Price');
%     title('European Call price at t=0 with stochastic interest rate');
% 
% 
%     figure;
%     contourf(Sgrid, Rgrid, Z, 50);
%     colormap 'jet';
%     grid on; xlabel('S_0'); ylabel('r_0'); title('Price contours at t=0');
%     colorbar;
% end
% 
% 
% 

