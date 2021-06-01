function bact=sortBacteria(bacteria,prob)
[f,c]=size(bacteria);
var=varNumber(prob);
aux= zeros(1,var+var+2);
        for i=1:f
            for j=1:(f-1)
                if (bacteria(j,(var+var+2))==0 && bacteria(j+1,(var+ var+ 2)) == 0) 
                    if (bacteria(j,(var+var+1)) > bacteria(j + 1,(var+ var+1))) 
                        for k=1:c
                            aux(k) = bacteria(j,k);
                            bacteria(j,k) = bacteria(j + 1,k);
                            bacteria(j + 1,k) = aux(k);
                        end
                    end
                end 
                if (bacteria(j,(var+var+2))>0 && bacteria(j+1,(var+ var+ 2))>0) 
                    if (bacteria(j,(var+var+2)) > bacteria(j + 1,(var+ var+2))) 
                        for k=1:c
                            aux(k) = bacteria(j,k);
                            bacteria(j,k) = bacteria(j + 1,k);
                            bacteria(j + 1,k) = aux(k);
                        end
                    end
                end
                if (bacteria(j,(var+var+2))> 0 && bacteria(j+1,(var+ var+ 2)) == 0) 
                        for k=1:c
                            aux(k) = bacteria(j,k);
                            bacteria(j,k) = bacteria(j + 1,k);
                            bacteria(j + 1,k) = aux(k);
                        end
                end 
            end
       end
    
bact=bacteria;
