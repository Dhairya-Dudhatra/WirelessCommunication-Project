clear all;
close all;
clc;

Rs = 0.1;            %Desired Secrecy rate
ep = 0.5;
Re_min = [0:0.1:1];
r = Re_min;
a = 2;
k = Re_min.^a;
b = (2^Rs)./k;
lambda = 1 - 2^Rs;      %Pt/Ra = 1 i.e delta
Ef = (b.*(b-lambda).*exp(lambda./b) - b.*(b - (lambda.*(b+1))).*exp((lambda.*(b+1))./b))./(lambda^2);
Gf = 2.*(b./lambda).*(exp(((1+b).*lambda)./b) - exp(lambda./b));
Ff = ei((lambda.*(1+b))./b) - ei(lambda./b);
f  = Ff./exp((lambda./b));
P_out_CB_a2 = 1 - 2.*(1 + 1./b).*f + (2.*(exp(lambda) - 1))./(lambda.*b);
P_out_HC_a2 = 1- ((162 - 210./b).*f)./73 + (210./73).*((exp(lambda) - 1)./(b.*lambda)) - (48./(73.*(b.^3))).*(exp(-lambda./b)).*(Ef + Ff -Gf);
P_out_RD_a2 = 1 - f;

plot(Re_min,P_out_CB_a2,'-o','Linewidth',1.0);
hold on
plot(Re_min,P_out_HC_a2,'-h','Linewidth',1.0);
plot(Re_min,P_out_RD_a2,'-^','Linewidth',1.0);

xlabel('R_E^m^i^n');
ylabel('P^{out}(R_s)');
grid on;
title('Analytical result of P^{out}(R_s) for path loss a = 2');
legend('RWP,CB Analytical (a=2)', 'RWP,HC Analytical (a=2)', 'RD Analytical (a=2)');