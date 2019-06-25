clear all
close all
clc

n = 100;
m = 3;
x = linspace(0.0,2*pi,n);
f = 2-4*x+6.7*x.^3;

for i = 1:m+1
    for j = 1:n
        A(j,i) = x(j)^(i-1);
    end
end

sigma = .1;

for k = 1:n
    
    for j = 1:n
        w(j) = exp(-((x(k)-x(j))^2)/(sigma^2));
%         w(j) = 1.0;
    end

    alfa = MMQ_2019(A,w,f');

    p(k) = 0.0;
    for i = 1:m+1
        p(k) = p(k) + alfa(i)*x(k)^(i-1);
    end
    
end

hold on
plot(x,f,'b.');
plot(x,p,'r');
hold off
