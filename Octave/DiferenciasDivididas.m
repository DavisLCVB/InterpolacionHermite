%Diferencias divididas
function M = DiferenciasDivididas(x, fx, dfx)
    %Inicializamos los datos
    n = length(x);
    z = zeros(2*n,1);
    Q = zeros(2*n, 2*n);
    %Colocamos en tabla los valores que tenemos disponibles
    for i = 0 : n-1
        z(2*i+1)=x(i+1);
        z(2*i+2)=x(i+1);
        Q(2*i+1,1)=fx(i+1);
        Q(2*i+2,1)=fx(i+1);
        Q(2*i+2,2)=dfx(i+1);
        if i != 0
            Q(2*i+1,2)=(Q(2*i+1,1)-Q(2*i,1))/(z(2*i+1)-z(2*i));
        endif
    endfor
    %Calculamos los valores restantes
    for i = 2 : 2*(n-1)+1
        for j = 2 : i
            Q(i+1,j+1)=(Q(i+1,j)-Q(i,j))/(z(i+1)-z(i-j+1));
        endfor
    endfor
    M = [z Q];
endfunction