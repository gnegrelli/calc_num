clear all
close all
clc

n = 12;
m = 7;
x = linspace(0.0,2*pi,n);
f = sin(x) + 3*cos(7*x);

% Construcao da matriz A
for i = 1:m+1
    for j = 1:n
        A(j,i) = x(j)^(i-1);
    end
end

At = n*eye(m);
At(1) = At(1)/2;

% Coeficentes a
for j = 0:m
    a(j+1) = 0;
    for k = 1:n
        a(j+1) = a(j+1) + (2/n)*f(k)*cos(j*x(k));
    end
end


% Coeficentes b
for j = 1:m
    b(j) = 0;
    for k = 1:n
        b(j) = b(j) + (2/n)*f(k)*sin(j*x(k));
    end
end

% Agrupando os coeficientes
c = [a, b]

% Calculo de Sm
for i = 1:n
   S(i) = c(1)/2;
   for j = 1:m
       S(i) = S(i) + c(j+1)*cos(j*x(i));
   end
   for j = 1:m
       S(i) = S(i) + c(j+m+1)*sin(j*x(i));
   end
end

hold on
plot(x,f,'b.');
plot(x,S,'r--');
hold off
