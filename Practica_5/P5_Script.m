t=0:0.001:1;
x=sin(4*pi*t)+sin(8*pi*t);

figure
plot(t,x)
title('Señal x(t)');
xlabel('Tiempo (s)');
ylabel('Amplitud');

fs=input('Introduce la frecuencia de muestreo fs: ');

n=0:1/fs:1;
xm=sin(4*pi*n)+sin(8*pi*n);

figure;
stem(n,xm);
title('Señal muestreada x[n]');
xlabel('n');
ylabel('Amplitud');

frec = [125,215,305,395];
for i=1:length(frec)
n2=0:1/frec(i):1;
xm2=sin(2*pi*n2);

figure;
stem(n2,xm2);
title(['Señal sinusoidal muestreadad con f_s = ', num2str(frec(i)),' Hz']);
xlabel('n');
ylabel('Amplitud');

end
n3=0:1/200:1;
xm3=sin(2*pi*n3);
figure;
plot(t,sin(2*pi*t));
hold on;
stem(n3,xm3);
title('Señal original y muestreada con f_s = 200Hz');
xlabel('Tiempo(s)');
ylabel('Amplitud');
legend('Original','Muestreada');