function [raiz, iter] = biseccion(f, a, b, tol)
max_iter = 100;
iter = 0;

if f(a) * f(b) >= 0
    error('El intervalo no tiene un cambio de signo.');
end

while (b - a) / 2 > tol && iter < max_iter
    c = (a + b) / 2;
    if f(c) == 0
        raiz = c;
        return;
    elseif f(a) * f(c) < 0
        b = c;
    else
        a = c;
    end
    iter = iter + 1;
end
raiz = (a + b) / 2;
end
