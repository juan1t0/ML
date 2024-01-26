%855899
n = 200;
d = 5;
x = rand(n,1);
Y = sin(2*pi*x);
Y = Y + randn(n,1)*0.3;

L = floor(n*0.8);
x_train = x(1:L,:);
x_test = x(L+1:end,:);
Y_train = Y(1:L,:);
Y_test = Y(L+1:end,:);

xs = linspace(0,1)';
ys = sin(2*pi*xs);

X_t = convert_x(x_train,d);

w = X_t\Y_train;
fprintf('w:[%g', w);
fprintf(']\n');
Xs= convert_x(xs,d);
Ys= Xs*w;

plot(xs,ys,'r-');
hold on;
scatter(x_train,Y_train);
scatter(x_test,Y_test);
plot(xs,Ys,'g-');
xlim([-0.2 1.2]);
ylim([-1.4 1.4]);
grid on;
legend('sin(2*\pi x)','Dataset(train)','Dataset(test)','SimpleModel');
hold off;