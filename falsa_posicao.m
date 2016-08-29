clc
clear all
close all

%funcao
f=@(x) x^3 + 4*x^2 - 10;
%f=@(x) (x+2)*(x+1)*x*((x-1)^3)*(x-2);
%tolerancia relativa
e1=0.00001;
%tolerancia absoluta
e2=0.00005;
%tolerancia
tol=10^-4;
%numero maximo de iteracoes
nmax=100;

iterador = 1;
i = 1;
a = [];
b = [];
p = [];
%definição do intervalo
a(i) = 1;
b(i) = 2;
p(i) = 0; 

fp_abs = abs(f(p(i)));

while ( (fp_abs >= tol)  &&  iterador < nmax)
    
    p(i + 1) = a(i) - ( (f(a(i)) * ( b(i) - a(i) ) ) / ( f(b(i)) - f(a(i)) ) ); 
    if (f(p(i + 1)) * f(a(i)) < 0)
        a(i + 1) = a(i);
        b(i + 1) = p(i + 1);
    else
        a(i + 1) = p(i + 1);
        b(i + 1) = b(i);
    end
          
    fprintf('n:%d, a%d:%f, b%d:%f, p%d:%f  f(p%d): %f\n', i + 1, i, a(i), i, b(i), i + 1, p(i + 1), i + 1, f(p(i + 1)));

    iterador = iterador + 1;
    fp_abs = abs(f(p(i + 1)));
    i = i + 1;

end

str_fun = func2str(f);
%plot da função e de outras firulas
if 1
    fig = figure(1);
    set(fig,'name','Método Falsa Posição','numbertitle','off')
    fplot(f, [a(1), b(1)], 'b') 
    hold on
    plot(p(i), f(p(i)), 'r*');
    title(['\fontsize{8} Localização da raíz da função ', str_fun ,' no intervalo [',num2str(a(1)),',',num2str(b(1)),'] especificado'])
    hold off
    str_root = ['Root(p) = ',num2str(p(i))];
    text(p(i),f(p(i)),str_root,'HorizontalAlignment','right')
    xlabel('x')
    ylabel('f(x)')
    grid on
end