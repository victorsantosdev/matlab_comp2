clc
clear all
close all
%intervalo inferior
a=1;
%intervalo superior
b=2;
%funcao
f=@(x) x^3 + 4*x^2 - 10;
%tolerancia relativa
e1=0.00001;
%tolerancia absoluta
e2=0.00005;
%numero maximo de iteracoes
nmax=1000;

fafb = f(a)*f(b)
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
            fprintf('n:%d, a:%d, b:%d, p:%d, fp: %d\n', iterador, a, b, p, f(p));
        
            iterador = iterador + 1;
            fa = abs(f(a));
            fb = abs(f(b)); 
        end
    end
end