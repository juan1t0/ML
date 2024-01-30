%855899
clear;
n = 10; % number of points
d = 3; % degree of polynomial
x = rand(n,1); 
Y = sin(2*pi*x); % original function
Y = Y + randn(n,1)*0.3; % data with noise

xs = linspace(0,1)'; % linear space to plot the original function
ys = sin(2*pi*xs);

X = convert_x(x,d); % adapting X to calculate the coefficients

w = X\Y; % Finding the inverse of X to estimate w

disp('w values:');
disp(w)
Xs= convert_x(xs,d); % adapting xs
Ys= Xs*w;

plot(xs,ys,'r-'); % original function 
hold on;
scatter(x,Y); % points
plot(xs,Ys,'g-'); % found polynomial
xlim([-0.2 1.2]);
ylim([-1.4 1.4]);
grid on;
legend('sin(2*\pi x)','Dataset(train)','Dataset(test)','SimpleModel');
xlabel("x");
ylabel("y");
title("Polinomyal Fitting");
hold off;

%%%%%%%%%%%%%%%%%%%%%%%%%
% plot of errors

n = 10; % points 
x = rand(n,1); 
L = floor(n*0.8); % limit for split into train (80%) and test (20%)
x_train = x(1:L,:);
x_test = x(L+1:end,:);
D = [1,2,3,4,5,6,7,8,9,10]; % tested polynomial degrees
figure();
plt = model_eval(x_train,x_test,D);
legend('train','test');
xticks(D);
xlabel('Degrees');
ylabel('error (log)');

