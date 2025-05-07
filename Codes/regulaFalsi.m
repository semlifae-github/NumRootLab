function [raiz, iter] = regulaFalsi(f, a, b, tol)
max_iter = 100;
iter = 0;

if f(a) * f(b) >= 0
    error('El intervalo no tiene un cambio de signo.');
end

while iter < max_iter
    c = (a * f(b) - b * f(a)) / (f(b) - f(a));
    if abs(f(c)) < tol
        raiz = c;
        return;
    elseif f(a) * f(c) < 0
        b = c;
    else
        a = c;
    end
    iter = iter + 1;
end
raiz = c; % Devolver la mejor aproximación
end

[raiz, iter] = biseccion(f, a, b, tol);
