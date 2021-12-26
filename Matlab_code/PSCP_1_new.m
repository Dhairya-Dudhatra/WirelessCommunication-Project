clear all;
close all;
clc;

a = 2;
R = 0.1:0.1:1;
k = R.^a;
x = -5:1:15;
x_lin = 10.^(x/10);
% Equation - 16
% P_CB_a_2 = 2.*k.*((k+1).*(log(k+1)-log(k)) - 1);

% P_CB_a_2_m =(1/2)-R+(3.*(R.^2)/2)-(R.^3)-((R.^2).*(R.^2-2).*log(R))+((R.^2-1).^2).*(log(R+1));
% P_CB_a_2_m = 1/2-R+(3*(R^2)/2)-R^3-((R^2)*(R^2-2)*log(R))+((R^2-1)^2)*(log(R+1));

% P_CB_a_2_k = 1- (4.*(2-3.*(x.^2)+2.*(exp((-x.^2)/2)).*((x.^2)-1)-sqrt(2*pi).*(x.^3).*erfc(x./sqrt(2)))./(3.*(x.^3)));

P_CB_a_2_k = 4.*(x_lin.^2 + 2.*exp(-(x_lin.^2)/2) - 2)./(x_lin.^4);
% Equation - 18
% P_HC_a_2 = 6.*((8.*k.*k.*k + 35.*k.*k + 27.*k).*(log(k+1)-log(k)) - 8.*k.*k - 31.*k)./73;

% Equation - 39
% P_RD_a_2 = k.*(log(k+1)-log(k));

% plot(R,P_CB_a_2,'-o','Linewidth',1.0);
hold on
% plot(R,P_CB_a_2_m,'-','Linewidth',1.0);
plot(x,P_CB_a_2_k,'-b','Linewidth',1.0);
ylim([0 1])
% plot(R,P_HC_a_2,'-s','Linewidth',1.0);
% plot(R,P_RD_a_2,'->','Linewidth',1.0);
% plot(r_e,prob);

xlabel('SNR[dB]');
ylabel('Average Outage Probability');
legend('RWP New CB Analytical (a=2)');