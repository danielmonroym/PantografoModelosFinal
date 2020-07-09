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
%% State space model 
sys = ss(A,B,C,D);
%% Modelo graficas
step(sys);
