function ang=angleDirection(var)
acum = 0.0;
%limites=rangocec2010(2);
angulos=zeros(1,var);
for i = 1:var 
    %angulos(i)=limites(i,1)+(limites(i,2)-limites(i,1))*rand(1);
    alea=randn(1);
    
    while(alea < -1 || alea > 1) %0.4 y0.2
        alea=randn(1);
    end
    angulos(i) = alea;
           acum =(angulos(i)^2.0);
end  
 raiz = sqrt(acum);
 for j = 1:var 
    angulos(j) = angulos(j) / raiz;
 end
 ang=angulos;
      

    