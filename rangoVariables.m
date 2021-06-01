function var=rangoVariables(prob)
f=varNumber(prob);
var=zeros(f,2);
switch (prob)  
    %resorte
 case 100
       var=[0.05 2;
           0.25 1.3;
           2 15];
       %recipiente de presion
    case 101
     var=[1 99; 
         1 99;
         10 200;
         10 200];
    
end
