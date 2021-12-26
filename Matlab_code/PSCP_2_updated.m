clear all;
close all;
clc;

R = [0:0.1:1];
k = R.^4;
ik = (1./sqrt(k));

% Equation - 20
%P_CB_a_4 = 2.*sqrt(k).*atan(ik) - k.*(log(k+1)-log(k));
P_CB_a_4 = 2.*sqrt(k).*atan(ik) - k.*(log(k+1)-log(k));

%Equation - 21
P_HC_a_4 = 3.*(atan(ik).*(54.*sqrt(k) - 16.*(sqrt(k).^3)) - 35.*k.*(log(k+1)-log(k)) + 16.*k)./73;
%P_HC_a_4 = 3.*(atan(ik).*(54.*sqrt(k) - 16.*(ik.^3)) - 35.*k.*(log(k+1)-log(k)) + 16.*k)./73;

% Equation - 40
P_RD_a_4 = sqrt(k).*atan(ik);

plot(R,P_CB_a_4,'-o','Linewidth',1.0);
hold on
plot(R,P_HC_a_4,'-h','Linewidth',1.0);
plot(R,P_RD_a_4,'-^','Linewidth',1.0);

xlabel('R_E^m^i^n');
ylabel('P(C_s>0)');
grid on;
title('Analytical result of P(C_s>0) for path loss a = 4');
legend('RWP,CB Analytical (a=4)', 'RWP,HC Analytical (a=4)', 'RD Analytical (a=4)');