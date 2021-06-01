%para conocer el succes rate tasa de exito
function result=successRate(resultado,run,var,problema)
conta=0;
if (problema==1 )
    for i=1:run
        if(resultado(i,var+1) - (0.0000000000000000000000000000504870) <=0.0001)
            conta=conta+1;
        end
    end
end

if (problema==2 )
    for i=1:run
        if(resultado(i,var+1) - (0.00262807883312760) <=0.0001)
            conta=conta+1;
        end
    end
end

if (problema==3 )
    for i=1:run
        if(resultado(i,var+1) - (0.274968744962497) <=0.0001)
            conta=conta+1;
        end
    end
end

if (problema==4 )
    for i=1:run
        if(resultado(i,var+1) - (0.238892652165891) <=0.0001)
            conta=conta+1;
        end
    end
end

if (problema==100 ) %este es el problema del resorte
    for i=1:run
        if(resultado(i,var+1) - (0.012681) <=0.0001)
            conta=conta+1;
        end
    end
end
result=conta;

