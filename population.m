    function aleatoria=population(sb, prob)
    %generación de population aleatoria, enviar el tamaño de population,
    %temaño de paso y num de problema para identificar el rango de
    %variables y el num de variables
    var=varNumber(prob);
    lim=rangoVariables(prob);
    bacteria=zeros(sb,var+var);
    %angul=zeros(1,var);
    partest=floor(sb/2);
    partes=floor(partest/2);
     
     
     for i = 1:partes
         acum = 0.0;
         angulos=zeros(1,var);
     for y = 1:var 
    alea=randn();
    while(alea<-1 || alea > 1)
        alea=randn();
    end
             angulos(y) = alea;
            acum = acum +(angulos(y)^2.0);
    end  
    raiz = sqrt(acum);
    
     for j=1:var
         if(lim(j,1)==0)
            inferior=1; 
         else
             inferior=lim(j,1);
         end
         bacteria(i,j)=inferior*rand(1);
         bacteria(i,var+j)=lim(j,1) + (lim(j,2) - lim(j,1)) * rand(1);
     end
     end 
     
     for i = 1:partes
        acum = 0.0;
        angulos=zeros(1,var);
    for y = 1:var 
    alea=randn();
    while(alea<-1 || alea > 1)
        alea=randn();
    end
             angulos(y) = alea;
            acum = acum +(angulos(y)^2.0);
    end  
    raiz = sqrt(acum);
     for j=1:var
           bacteria(partes+i,j)=lim(j,2)*rand(1);
           bacteria(partes+i,var+j)=lim(j,1) + (lim(j,2) - lim(j,1)) * rand(1);
     end
     end
     
     for i = partest:sb
         acum = 0.0;
        angulos=zeros(1,var);
 for y = 1:var 
    alea=randn();
    while(alea<-1 || alea > 1)
        alea=randn();
    end
             angulos(y) = alea;
            acum = acum +(angulos(y)^2.0);
 end  
    raiz = sqrt(acum);
     for j=1:var 
          bacteria(i,j)=lim(j,1) + (lim(j,2) - lim(j,1)) * rand(1);
          bacteria(i,var+j)=lim(j,1) + (lim(j,2) - lim(j,1)) * rand(1);
     end
     end
    
        aleatoria=bacteria;
    % evaluando población 
