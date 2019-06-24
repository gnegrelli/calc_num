clear all
close all
clc

% n = 100;
% m = 2;
% x = linspace(0.0,2*pi,n);
% f = sin(x);
n = 6
m = 1
x = [-pi, -2*pi/3, -pi/3, 0, pi/3, 2*pi/3]
f = [10.74, -.23, -6.81, -9, -6.81, -.23]

% Construcao da matriz A
for i = 1:m+1
    for j = 1:n
        A(j,i) = x(j)^(i-1);
    end
end

At = n*eye(m);
At(1) = At(1)/2;

% Coeficentes a
for k = 0:m
    b(k+1) = 0;
    for i = 1:n
        b(k+1) = b(k+1) + (2/n)*f(i)*cos(k*x(i));
    end
end

% Coeficentes b
for k = m+1:2*m
    b(k+1) = 0;
    for i = 1:n
        b(k+1) = b(k+1) + (2/n)*f(i)*sin(k*x(i));
    end
end

% Calculo de Sm
for i = 1:n
   S(i) = b(1)/2;
   for j = 1:m
       S(i) = S(i) + b(j+1)*cos(j*x(i));
   end
   for j = 1:m
       S(i) = S(i) + b(j+m+1)*sin(j*x(i));
   end
end

S

% for k = 1:n
%     
%     % Vetor de pesos
%     for j = 1:n
%         w(j) = 1.0/((x(j) - x(k))^2+0.00001);
%         w(j) = 1.0;
%     end
% 
%     % Calculo dos alfas
%     alfa = MMQ_2019(A,w,f');
% 
%     
%     p(k) = 0.0;
%     for i = 1:m+1
%         p(k) = p(k) + alfa(i)*x(k)^(i-1);
%     end
%     
% end

hold on
plot(x,f,'b.');
plot(x,S,'r--');
hold off
