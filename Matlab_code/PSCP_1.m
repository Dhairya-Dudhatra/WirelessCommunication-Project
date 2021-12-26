clear all;
close all;
clc;

a = 2;
R = [0:0.1:1];
k = R.^a;

% Equation - 16
P_CB_a_2 = 2.*k.*((k+1).*(log(k+1)-log(k)) - 1);

% Equation - 18
P_HC_a_2 = 6.*((8.*k.*k.*k + 35.*k.*k + 27.*k).*(log(k+1)-log(k)) - 8.*k.*k - 31.*k)./73;

% Equation - 39
P_RD_a_2 = k.*(log(k+1)-log(k));

plot(R,P_CB_a_2,'-o','Linewidth',1.0);
hold on
plot(R,P_HC_a_2,'-s','Linewidth',1.0);
plot(R,P_RD_a_2,'->','Linewidth',1.0);

xlabel('R_E^m^i^n');
ylabel('P(C_s>0)');
grid on;
title('Analytical result of P(C_s>0) for path loss a = 2');
legend('RWP,CB Analytical (a=2)', 'RWP,HC Analytical (a=2)', 'RD Analytical (a=2)');