    function [raiz, iter, iteraciones] = secante(app, f, x0, x1, tol)
        max_iter = 100; % Número máximo de iteraciones
        iter = 0;
        iteraciones = []; % Matriz para almacenar valores de cada iteración
        

        % Inicialización del método
        error = Inf;

        while error > tol && iter < max_iter
            % Evitar división por cero
            if abs(f(x1) - f(x0)) < eps
                uialert(app.UIFigure, 'División por cero detectada. Intente con otros valores iniciales.', 'Error');
                return;
            end

            % Aplicar la fórmula de la secante
            x_new = x1 - (f(x1) * (x1 - x0)) / (f(x1) - f(x0));

            % Calcular el error
            error = abs(x_new - x1);

            % Guardar valores de iteración en la tabla
            iteraciones = [iteraciones; iter, x0, x1, x_new, f(x_new), error];

            % Graficar el punto en cada iteración
            plot(app.UIAxes, x_new, f(x_new), 'ro', 'MarkerFaceColor', 'r', 'MarkerSize', 6);
            pause(0.3); % Pausa para visualizar la evolución

            % Verificar si alcanzamos la convergencia
            if error < tol
                break;
            end

            % Actualizar valores para la siguiente iteración
            x0 = x1;
            x1 = x_new;
            iter = iter + 1;
        end

        raiz = x_new; % Aproximación final de la raíz
    end

