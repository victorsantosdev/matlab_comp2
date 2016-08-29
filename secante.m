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

%definicao dos pontos iniciais p0 e p1
iterador = 1;
i = 1;
p_array = [];
p_array(i) = 1;
i = i + 1;
p_array(i) = 2;
diffmodulos = abs(p_array(i) - p_array(i-1));
fp_abs = abs(f(p_array(i)));

while ( (fp_abs >= tol)  &&  iterador < nmax)
    i = i + 1;
    p_array(i) = p_array(i-1) - (f(p_array(i-1))*( p_array(i-1) - p_array(i-2) ) )/ (f(p_array(i-1)) - f(p_array(i-2))); 
    
    fprintf('n:%d, pn:%f, fpn: %f\n', i, p_array(i), f(p_array(i)));

    iterador = iterador + 1;
    fp_abs = abs(f(p_array(i)));
    %diffmodulos = abs(p_array(i) - p_array(i-1)); 

end

str_fun = func2str(f);
%plot da função e de outras firulas
if 1
    fig = figure(1);
    set(fig,'name','Método Secante','numbertitle','off')
    fplot(f, [p_array(1), p_array(2)], 'b') 
    hold on
    plot(p_array(i), f(p_array(i)), 'r*');
    title(['\fontsize{8} Localização da raíz da função ', str_fun ,' no intervalo [',num2str(p_array(1)),',',num2str(p_array(2)),'] especificado'])
    hold off
    str_root = ['Root(p) = ',num2str(p_array(i))];
    text(p_array(i),f(p_array(i)),str_root,'HorizontalAlignment','right')
    xlabel('x')
    ylabel('f(x)')
    grid on
end