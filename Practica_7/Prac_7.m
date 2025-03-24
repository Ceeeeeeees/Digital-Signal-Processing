%Practica 5
% Saucedo Moreno Cesar Enrique
% Avila Sanchez Jonathan Aldrich
%Convolución x*y

% 1 ) Definir una señal:
x=[1,2,3,1]
x_i=0;

y=[1,2,1,-1]
y_i=1;

% 2 ) Definir las longitudes en base a los indices de las señales:

indices_x = (0:numel(x)-1) - x_i
indices_y = (0:numel(y)-1) - y_i

ki = min(indices_x)
ks = max(indices_x)

li= min(indices_y)
ls= max(indices_y)


% Debe de imprimir en indice_x = [0 1 2] , indice_y = [-1 0 1]

% 3 ) Calcular la longitud:

Nx = ks - ki + 1
Nn = ls - li + 1

% 4 ) Calcular los indices inferior y superior
Nmin = ki + li
Nmax = ks + ls

% 5 ) Calcular la longitud de respuesta y creamos la nueva función
Ny = ( Nx + Nn ) - 1
y_conv = []; % Inicializa y_conv con ceros
yt = []; % Inicializa yt con ceros

% 6 ) Reflexión de y -> y ( - k)
y_reflexion = fliplr(y)

for k = Nmin:Nmax
    h_1 = zeros(1, Ny);

    if y_i < 0
        indice_a = -1 * y_i;
        h_1 = [zeros(1, indice_a),y_reflexion];
    elseif y_i > 0
        h_1 = y_reflexion;
    end

    if x_i < y_i
        indice_aux = y_i - x_i;
        new_x = [zeros(1, indice_aux), x];
        new_y = [h_1, zeros(1, length(new_x)-length(h_1))];
    elseif x_i > y_i
        indice_aux = x_i - y_i;
        new_y = [zeros(1, indice_aux), h_1];
        new_x = [x, zeros(1, length(new_y) - length(x))]
    else
        new_x = x;
        new_y = h_1;
    end

    if y_i ~= 0
        aux = sum[new_y .* new_x];
    end

    yt =aux;
end


% Imprimir resultados
disp('Señal original x:');
disp(x);

disp('Señal original y:');
disp(y);

disp('Índices originales de x:');
disp(indices_x);

disp('Índices originales de y:');
disp(indices_y);

disp('Señal convolucionada y_conv:');
disp(yt);




