clear all
close all
clc

n = 100;
m = 2;
x = linspace(0.0,2*pi,n);
f = sin(x);

% Construcao da matriz A
for i = 1:m+1
    for j = 1:n
        A(j,i) = x(j)^(i-1);
    end
end

At = n*eye(m)
At(1) = At(1)/2
for k = 1:n
    
    % Vetor de pesos
    for j = 1:n
        w(j) = 1.0/((x(j) - x(k))^2+0.00001);
        w(j) = 1.0;
    end

    % Calculo dos alfas
    alfa = MMQ_2019(A,w,f');

    
    p(k) = 0.0;
    for i = 1:m+1
        p(k) = p(k) + alfa(i)*x(k)^(i-1);
    end
    
end

hold on
plot(x,f,'b');
plot(x,p,'r.');
hold off
