%Limpiamos la pantalla
clc
%Limpiamos la memoria
clear
%Inicializamos las variables
%x es el conjunto de valores para los cuales tenemos la función y la derivada evaluada en la misma
x = [-0.5, -0.25, 0];
%f es el conjunto de valores que corresponden a la función evaluada en los valores de x
f = [-0.0247500, 0.3349375, 1.1010000];
%df es el conjunto de valores que corresponden a la derivada evaluada en los valores de x
df = [0.7510000, 2.1890000 ,4.0020000];
%val es el valor en el cual queremos evaluar el polinomio de Hermite
val = -1/3;
%Llamamos a la función PolinomioDeHermite
m = PolinomioDeHermite(x, f, df, val);
%Imprimimos el resultado
printf("El polinomio de Hermite evaluado en %d es: %d\n", val, m);