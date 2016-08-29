clc
clear all
close all
%intervalo inferior
a=1;
%intervalo superior
b=2;
%funcao
f=@(x) x^2 -3;
%f=@(x) x^3 + 4*x^2 - 10;
%f=@(x) (x+2)*(x+1)*x*((x-1)^3)*(x-2);
%tolerancia relativa
e1=0.00001;
%tolerancia absoluta
e2=0.00005;
%tolerancia
tol=10^-4;
%numero maximo de iteracoes
%nmax=1000;
nmax= log2(b-a) - log2(tol);
nmax = ceil(nmax)

fafb = f(a)*f(b);
fa = abs(f(a));
fb = abs(f(b));
iterador = 1;

if ( fafb > 0 )
    fprintf('Intervalo [%d, %d] inadequado', a, b);
else
   
    %5
    while ( fa > e2 && fb > e2 &&  iterador < nmax)
        dist_ab = abs(a-b);
        err_relativo = e1*a;
        if (dist_ab < err_relativo) %5.1
            fprintf('Saida [%d, %d] minimo', a, b);
            break
        else    
            p= (a+b)/2; %5.2
            if (f(p)*f(a) < 0) %5.3
                b = p;
            else 
                a = p;
            end
            %meu intervalo eh [a,p] ou [p,b]
            fprintf('n:%d, a%d:%f, b%d:%f, p%d:%f, f(p%d): %f\n', iterador, iterador, a, iterador, b, iterador, p, iterador, f(p));
        
            iterador = iterador + 1;
            fa = abs(f(a));
            fb = abs(f(b)); 
        end
    end
end

%intervalo inferior
a=1;
%intervalo superior
b=2;

str_fun = func2str(f);
%plot da função e de outras firulas
if 1
    fig = figure(1);
    set(fig,'name','Método Bissecção','numbertitle','off')
    fplot(f, [a, b], 'b') 
    hold on
    plot(p, f(p), 'r*');
    title(['\fontsize{8} Localização da raíz da função ', str_fun ,' no intervalo [',num2str(a),',',num2str(b),'] especificado'])
    hold off
    str_root = ['Root(p) = ',num2str(p)];
    text(p,f(p),str_root,'HorizontalAlignment','right')
    xlabel('x')
    ylabel('f(x)')
    grid on
end