%% Inicialización
clc
clear
close all
%% Interprete LaTeX
 set(groot, 'defaultAxesTickLabelInterpreter','latex'); 
   set(groot, 'defaultLegendInterpreter','latex');
%% Parametros modelo
m1=17.2; % masa 1 (cabeza)en kg
m2=66.5;  % masa 2 (bastidor) en kg
k1=20480;  % constante elasticidad 1 en N/m
k2=5200;   % constante elasticidad 2 en N/m
b1=95;      % fricción N-s/m
b2=95;      % fricción N-s/m

%% SSR 
A=[0        1    0       0;
    (-k2-k1)/m1 -b1/m1 k2/m1 b1/m1;  
     0     0     0       1;
   -k2/m2 b1/m2 k2/m2 (-b1+b2)/m2;
   ];
B=[0 0 0 1/m2]';
C=[1 0 0 0;
   0 0 1 0];
D=[0 0]';
%% Correr simulación
a = sim('Modelo2','StartTime','0','StopTime','25','FixedStep','0.02');
z1 = a.get('z1');
z2 = a.get('z2');

%% Gráficas
figure(1)
plot(z1.Time, z1.Data, 'g')
grid
xlabel("Tiempo, segundos",...
    'FontSize',16,...
    'FontWeight','bold',...
    'Interpreter','latex');
ylabel("Salida Z1, metros",...
    'FontSize',16,...
    'FontWeight','bold',...
    'Interpreter','latex');

figure(2)
plot(z2.Time, z2.Data, 'linewidth',2)
grid
xlabel("Tiempo, segundos",...
    'FontSize',16,...
    'FontWeight','bold',...
    'Interpreter','latex');
ylabel("Salida Z2, metros",...
    'FontSize',16,...
    'FontWeight','bold',...
    'Interpreter','latex');