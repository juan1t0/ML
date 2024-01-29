%855899
clear;
load("exercise5")
% After the plot it was determined that C0 needs 2 Gaussians and C1 3.

max_change = 0.001; % convergence parameter, the maximum parameter update must be less than max_change

%C0
k_C0 = 2;
[mean_C0,covs_C0,pis_C0,n_C0] = EM_algo(k_C0,C0,max_change);

%C1
k_C1 = 3;
[mean_C1,covs_C1,pis_C1,n_C1] = EM_algo(k_C1,C1,max_change);

fprintf("EM algorithm takes %d steps for C0\n",n_C0);
fprintf("EM algorithm takes %d steps for C1\n",n_C1);

total_points = length(C0) + length(C1);
P_C0 = length(C0) / total_points; % ratio of each class, used as P(C0)
P_C1 = length(C1) / total_points; % P(C1)

new_point = input('Write the point to classify: '); % The input must be 1 x 2, so enter st like '[x y]'

% We need P(C0|new_point) and P(C1|new_point), so
P_C0_np = MixtureGaussians(k_C0,new_point,mean_C0,covs_C0,pis_C0) * P_C0; % Calculation of P(new_point|C0)*P(C0)
P_C1_np = MixtureGaussians(k_C1,new_point,mean_C1,covs_C1,pis_C1) * P_C1; % P(new_point|C1)*P(C1)
% Division by P(new_point) is not necessary since we are interested in which is greater, not the exact probability

fprintf("P(C0|new_point) = %1.8f \n",P_C0_np);
fprintf("P(C1|new_point) = %1.8f \n",P_C1_np);
classes = ['C0';'C1'];
[maxim idx_max] = max([P_C0_np P_C1_np](:)); % Selecting the max value between P(C0|np) and P(C1|np)

fprintf("The new point is class %s \n", classes(idx_max,:));

% plotting the results
scatter(C0(:,1),C0(:,2),'*');
hold on;
scatter(C1(:,1),C1(:,2),'*');
scatter(new_point(:,1),new_point(:,2),'fill');
legend('Class 0','Class 1','New Point');
grid on;
hold off;
