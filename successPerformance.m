%para conocer el rendimiento exitoso
function result=successPerformance(bacteria,problema)

var=varNumber(problema);
conta=0;

if (problema==1)
        if(bacteria(1,var+var+1) - (0.0000000000000000000000000000504870) <=0.0001)
            conta=1;
        end   

end

if (problema==2)
        if(bacteria(1,var+var+1) - (0.00262807883312760) <=0.0001)
            conta=1;
        end   

end

if (problema==3)
        if(bacteria(1,var+var+1) - (0.274968744962497) <=0.0001)
            conta=1;
        end   

end

if (problema==4)
        if(bacteria(1,var+var+1) - (0.238892652165891) <=0.0001)
            conta=1;
        end   

end

if (problema==100)  %este es el problema del resorte
        if(bacteria(1,var+var+1) - (0.012681) <=0.0001)
            conta=1;
        end   

end



result=conta;

