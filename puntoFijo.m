function [raiz, iter, iteraciones] = puntoFijo( g, x0, tol)
max_iter = 100; % Número máximo de iteraciones
iter = 0;
iteraciones = []; % Matriz para almacenar los valores de cada iteración

% Limpiar la gráfica antes de comenzar
cla(app.UIAxes);
hold(app.UIAxes, 'on');
fplot(app.UIAxes, g, [x0-2, x0+2], 'b', 'LineWidth', 1.5); % Dibujar la función g(x)
plot(app.UIAxes, x0, g(x0), 'go', 'MarkerFaceColor', 'g', 'MarkerSize', 8); % Punto inicial
xlabel(app.UIAxes, 'x'); ylabel(app.UIAxes, 'g(x)');
title(app.UIAxes, 'Método de Punto Fijo');
grid(app.UIAxes, 'on');

% Inicialización del método
error = Inf;
x_old = x0;

while error > tol && iter < max_iter
    % Evaluar la función iterativa g(x)
    x_new = g(x_old);

    % Calcular el error
    error = abs(x_new - x_old);

    % Verificar si alcanzamos la convergencia
    if error < tol
        break;
    end

    % Actualizar valores para la siguiente iteración
    x_old = x_new;
    iter = iter + 1;
end

raiz = x_new; % Aproximación final de la raíz
end

