% Definición de la señal x(n) = 10sin(2*pi*f0*n)
f0 = 50;
Fs = 200;  % Frecuencia de muestreo
n = 0:1/Fs:1;  % Vector de tiempo discreto
x = 10*sin(2*pi*f0*n);

% Niveles de cuantificación
levels = [64, 128, 256];

for l = 1:length(levels)
    % Cuantificación con truncamiento
    xq_trunc = floor(x * levels(l)) / levels(l);
    
    % Cuantificación con redondeo
    xq_round = round(x * levels(l)) / levels(l);
    
    % Gráficas de señales cuantificadas
    figure;
    
    subplot(3,1,1);
    plot(n, x);
    title(['Señal Original con ', num2str(levels(l)), ' niveles']);
    xlabel('Tiempo (s)');
    ylabel('Amplitud');
    
    subplot(3,1,2);
    plot(n, xq_trunc);
    title(['Señal Cuantificada (Truncamiento) con ', num2str(levels(l)), ' niveles']);
    xlabel('Tiempo (s)');
    ylabel('Amplitud');

    subplot(3,1,3);
    plot(n, xq_round);
    title(['Señal Cuantificada (Redondeo) con ', num2str(levels(l)), ' niveles']);
    xlabel('Tiempo (s)');
    ylabel('Amplitud');
    
end