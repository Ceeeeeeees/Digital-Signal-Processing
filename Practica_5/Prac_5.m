%Practica 5
% Saucedo Moreno Cesar Enrique
% Avila Sanchez Jonathan Aldrich
continuar = true;



while continuar
    clc;
    disp('          -----   Práctica 5  -----');
    disp('              Menú de Opciones:');
    disp('1 - Graficar la señal x(t)');
    disp('2 - Muestreo de la señal x(t) a una frecuencia de 10 Hz ');
    disp('3 - Recuperar la señal muestreada a 10 Hz');
    disp('4 - Muestreo de una onda senoidal pura de 300 Hz. Utilizando frecuencia de muestro de 800 Hz');
    disp('5 - Muestro de ondas senoidales con frecuencias de muestreo 125 , 215 , 305 , 395 y 500 Hz');
    disp('6 - Original, muestreada y recuperada con frecuencia de muestro de 200 Hz');
    disp('7 - Recuperación de señales por interpolación con Fs de 200 Hz');


    opcion = input('Seleccione una opción: ');


    %-------------- Parte 1 ----------------------
    %Señal Original
    t=0:0.001:1;
    x=sin(4*pi*t)+sin(8*pi*t);

    %-------------- Parte 2 ----------------------
    n=0:1/10:1;
    xm = sin (4*pi*n) + sin (8*pi*n);

    %-------------- Parte 3 ----------------------
    %Interpolación para la recuperación de la señal
    xq=0:0.01:1;%Vector de consulta
    y = interp1(n,xm,xq);

    %       La funcion y = interp1(X,V,xq)
    %   X ->Vector o valores de referencua
    %   V -> Señal muestreado (XM) señal que se muestreo y se perdió
    %   XQ -> Vector de consulta para interpolar valores


    %-------------- Parte 4 --------------------
    F0=300;
    
    t_2=0:1/800:0.1; %Frecuencia de muestreo de 800

    x4 =sin(2*pi*F0*t_2);

    %-------------- Parte 5 --------------------
    Fs1=125;
    Fs2=215;
    Fs3=305;
    Fs4=395;
    Fs5=500;

    n3=0:1/10000:.1;
    n4=0:1/10000:.1;
    n5=0:1/10000:.1;
    n6=0:1/10000:.1;
    n7=0:1/10000:.1;

    x5_1= sin(2*pi*Fs1*n3);
    x5_2= sin(2*pi*Fs2*n4);
    x5_3= sin(2*pi*Fs3*n5);
    x5_4= sin(2*pi*Fs4*n6);
    x5_5= sin(2*pi*Fs5*n7);

    %-------------- Parte 6 --------------------
    % Señal recuperada utilizando frecuencia de 200Hz
    xq_2=0:1/200:1;%Vector de consulta
    y2 = interp1(n,xm,xq_2);

    %-------------- Parte 7 --------------------

    t1=0:1/200:0.1;
    t2=0:0.001:0.1;

    x6_1= sin(2*pi*Fs1*t1);
    x6_2= sin(2*pi*Fs2*t1);
    x6_3= sin(2*pi*Fs3*t1);
    x6_4= sin(2*pi*Fs4*t1);
    x6_5= sin(2*pi*Fs5*t1);

    y_1= interp1(t1,x6_1,t2, "spline");
    y_2= interp1(t1,x6_2,t2, "spline");
    y_3= interp1(t1,x6_3,t2, "spline");
    y_4= interp1(t1,x6_4,t2, "spline");
    y_5= interp1(t1,x6_5,t2, "spline");

    switch opcion
        case 1
            clc;
            disp('           Opción 1        ');

            figure;
            plot(t,x)
            title('Señal x(t)');
            xlabel('Tiempo (s)');
            ylabel('Amplitud');
            disp('');

        case 2
            clc;
            disp('           Opción 2        ');
            disp('Muestreo de la señal x(t) a una frecuencia de 10 Hz');

            figure;
            stem(n,xm);
            title('Señal muestreada x[n]');
            xlabel('n');
            ylabel('Amplitud');

        case 3
            clc;
            disp('           Opción 3        ');
            disp('Muestreo de la señal x(t) a una frecuencia de 10 Hz');

            figure;

            %Original
            subplot(1, 2, 1)
            plot(t, x);
            title('Señal x(t)');
            xlabel('Tiempo (s)');
            ylabel('Amplitud');

            subplot(1, 2, 2)
            stem(xq,y);
            title('Señal interpolada');
            xlabel('n');
            ylabel('Amplitud');

        case 4
            clc;
            disp('           Opción 4        ');
            disp('Muestreo de una onda senoidal pura de 300 Hz. Utilizando frecuencia de muestro de 800 Hz');

            figure;
            plot(t_2,x4)
            title('Señal de 300 Hz con Fs de 800 Hz');
            xlabel('Tiempo (s)');
            ylabel('Amplitud');

        case 5
            clc;
            disp('           Opción 5        ');
            disp('Muestro de ondas senoidales con frecuencias de muestreo 125 , 215 , 305 , 395 y 500 Hz');

            figure;
            subplot(3, 2, 1);
            plot(n3,x5_1);
            title('Señal senoidal muestreada con 125 Hz');
            xlabel('n');
            ylabel('Amplitud');

            subplot(3, 2, 2);
            plot(n4,x5_2);
            title('Señal senoidal muestreada con 215 Hz');
            xlabel('n');
            ylabel('Amplitud');

            subplot(3, 2, 3);
            plot(n5,x5_3);
            title('Señal senoidal muestreada con 305 Hz');
            xlabel('n');
            ylabel('Amplitud');

            subplot(3, 2, 4);
            plot(n6,x5_4);
            title('Señal senoidal muestreada con 395 Hz');
            xlabel('n');
            ylabel('Amplitud');

            subplot(3, 2, 5);
            plot(n7,x5_5);
            title('Señal senoidal muestreada con 500 Hz');
            xlabel('n');
            ylabel('Amplitud');

        case 6
            clc;
            disp('           Opción 6        ');
            disp(' Original, muestreada y recuperada con frecuencia de muestro de 200 Hz');


            figure;
            subplot(1, 3, 1);
            plot(t,x)
            title('Señal Original');
            xlabel('Tiempo (s)');
            ylabel('Amplitud');

            subplot(1, 3, 2);
            stem(n,xm);
            title('Señal muestreada x[n]');
            xlabel('n');
            ylabel('Amplitud');

            subplot(1, 3, 3);
            stem(xq_2,y2);
            title('Señal Recuperada con Fs 200Hz');
            xlabel('n');
            ylabel('Amplitud');

        case 7
            clc;
            disp('           Opción 7        ');
            disp(' Original, muestreada y recuperada de las señales 125,215,305,395 y 500 Hz');

            figure;

            subplot(3, 5, 1);
            plot(n3,x5_1);
            title('Señal senoidal Origin con 125 Hz');
            xlabel('n');
            ylabel('Amplitud');

            subplot(3, 5, 2);
            plot(n4,x5_2);
            title('Señal senoidal Origin con 215 Hz');
            xlabel('n');
            ylabel('Amplitud');

            subplot(3, 5, 3);
            plot(n5,x5_3);
            title('Señal senoidal Origin con 305 Hz');
            xlabel('n');
            ylabel('Amplitud');

            subplot(3, 5, 4);
            plot(n6,x5_4);
            title('Señal senoidal Origin con 395 Hz');
            xlabel('n');
            ylabel('Amplitud');

            subplot(3, 5, 5);
            plot(n7,x5_5);
            title('Señal senoidal Origin con 500 Hz');
            xlabel('n');
            ylabel('Amplitud');

            subplot(3, 5, 6);
            stem(t1,x6_1);
            title('Señal senoidal muestreada con 125 Hz');
            xlabel('n');
            ylabel('Amplitud');

            subplot(3, 5, 7);
            stem(t1,x6_2);
            title('Señal senoidal muestreada con 215 Hz');
            xlabel('n');
            ylabel('Amplitud');

            subplot(3, 5, 8);
            stem(t1,x6_3);
            title('Señal senoidal muestreada con 305 Hz');
            xlabel('n');
            ylabel('Amplitud');

            subplot(3, 5, 9);
            stem(t1,x6_4);
            title('Señal senoidal muestreada con 395 Hz');
            xlabel('n');
            ylabel('Amplitud');

            subplot(3, 5, 10);
            stem(t1,x6_5);
            title('Señal senoidal muestreada con 500 Hz');
            xlabel('n');
            ylabel('Amplitud');

            subplot(3, 5, 11);
            plot(t2,y_1);
            title('Señal senoidal recupado con 125 Hz');
            xlabel('n');
            ylabel('Amplitud');

            subplot(3, 5, 12);
            plot(t2,y_2);
            title('Señal senoidal recupado con 215 Hz');
            xlabel('n');
            ylabel('Amplitud');

            subplot(3, 5, 13);
            plot(t2,y_3);
            title('Señal senoidal recupado con 305 Hz');
            xlabel('n');
            ylabel('Amplitud');

            subplot(3, 5, 14);
            plot(t2,y_4);
            title('Señal senoidal recupado con 395 Hz');
            xlabel('n');
            ylabel('Amplitud');

            subplot(3, 5, 15);
            plot(t2,y_5);
            title('Señal senoidal recupado con 500 Hz');
            xlabel('n');
            ylabel('Amplitud');

    end

    %   Realizar otra consulta
    respuesta = input('¿Desea realizar otra consulta? [s/n]: ', 's'); %Especificamos en el 2° argumento que sera del tipo string
    if respuesta ~= 's'
        continuar = false;
        clc;
    end
end

disp('Finalizacion -  ayooos');