clear;
housing_data = readtable("housing.txt");
car_data = readtable("car.csv");

%%
[~,~,IC1 ] = unique(car_data{:,1});

%%
car_data.Var1 = IC1;
%disp(car_data{4,:})
