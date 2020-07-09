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



%% Ecuación caracteristica m1
p=[m1 b1 k1]; %  vector para representar el polinomio
r = roots(p);
%%damping ratio m1
zeta1=b1/(2*sqrt(k1*m1));
% con zeta=0.0800 el sistema de segundo orden de m1 está "underdamped"
%% Ecuación caracteristica m2
p2=[m2 b2 k2]; %  vector para representar el polinomio
r2 = roots(p2); %  raices ecuación caracteristica
% damping ratio m2
zeta2=b2/(2*sqrt(k2*m2)); 
% con zeta2=0.0808 el sistema de segundo orden de m2 está "underdamped"
%% 2nd-Order Underdamped System m1
wn1=sqrt(k1); % Undamped natural frequency(rad/s)
%tiempo tope (peak time) en segundos
tp1=pi/(wn1*sqrt(1-(zeta1)^2));
% máximo sobreimpulso
Mos1=exp(-zeta1*pi/sqrt(1-(-zeta1)^2));
%Tiempo de estabilización en segundos
ts1=4/(zeta1*wn1);
%Periodo en segundos
tperiod1=2*pi/(wn1*sqrt(1-(zeta1)^2));
%% 2nd-Order Underdamped System m2
wn2=sqrt(k2); % Undamped natural frequency(rad/s)
%tiempo tope (peak time) en segundos
tp2=pi/(wn2*sqrt(1-(zeta2)^2));
% máximo sobreimpulso
Mos2=exp(-zeta2*pi/sqrt(1-(-zeta2)^2));
%Tiempo de estabilización en segundos
ts2=4/(zeta2*wn2);
%Periodo en segundos
tperiod2=2*pi/(wn2*sqrt(1-(zeta2)^2));