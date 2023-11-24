%Función del Polinomio de Hermite
function rpta = PolinomioDeHermite(x, fx, dfx, val)
    %Calculamos la tabla de diferencias divididas
    difdiv = DiferenciasDivididas(x, fx, dfx);
    %Obtenemos el alto de la matriz que es igual al doble de la cantidad de puntos dados
    n = length(x)*2;
    %Inicializamos la respuesta
    rpta = 0;
    %Calculamos el polinomio de Hermite
    %Bucle que itera sobre las operaciones de suma del polinomio
    for i = 1:n
        %Inicializamos el prod en 1
        prod = 1;
        %Creamos un bucle que va desde 1 hasta i-1 y este multiplica el prod anterior
        %por el valor correspondiente de la primera columna de la matriz de diferencias 
        %divididas
        for j = 1:i-1
            prod = prod * (val - difdiv(j, 1));
        endfor
        %Sumamos el valor de la multiplicación anterior por el valor de la diferencia dividida 
        rpta = rpta + difdiv(i, i+1) * prod;
    endfor
endfunction