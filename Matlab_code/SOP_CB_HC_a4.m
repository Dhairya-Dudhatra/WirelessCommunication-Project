clear all;
close all;
clc;

Rs = 0.1;            %Desired Secrecy rate
ep = 0.5;
Re_min = [0:0.1:1];
r = Re_min;
a = 4;
k = Re_min.^a;
b = (2^Rs)./k;
lambda = 1 - 2^Rs;      %Pt/Ra = 1 i.e delta
Ff = ei((lambda.*(1+b))./b) - ei(lambda./b);
f  = Ff./exp((lambda./b));

P_out_CB_a4 = 1 + f - (2.*(exp((lambda^2)*ep*ep)).*atan(sqrt(b)))./sqrt(b);
P_out_HC_a4 = 1 + (105/73).*f - ((163/73)./sqrt(b)).*(atan(sqrt(b)).*exp(lambda.*ep.*ep))  - ((48/73)*exp(lambda.*ep)).*((1./b) - (atan(sqrt(b)))./(b.*sqrt(b)));
P_out_RD_a4 = 1 - (exp(lambda*ep*ep).*atan(sqrt(b)))./sqrt(b);  

plot(Re_min,P_out_CB_a4,'-o','Linewidth',1.0);
hold on
plot(Re_min,P_out_HC_a4,'-h','Linewidth',1.0);
plot(Re_min,P_out_RD_a4,'-^','Linewidth',1.0);

axis([0 1 0 1])
xlabel('R_E^m^i^n');
ylabel('P^{out}(R_s)');
grid on;
title('Analytical result of P^{out}(R_s) for path loss a = 4');
legend('RWP,CB Analytical (a=4)', 'RWP,HC Analytical (a=4)', 'RD Analytical (a=4)');