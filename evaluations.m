function bact=evaluations(bacteria,prob)
var=varNumber(prob);
[f,c]=size(bacteria);
    %bact=bacteria;
    eps=0;
 switch (prob)
    %problema 100 del resorte de tension/compresion
     case 100
       for i=1:f
       x=bacteria(i,1:var);
              fx=springProblem(x);
              [c ceq]=springConstraints(x);
             bacteria(i,(var+var+1))=fx;
              [h,y]=size(c);
             svr=0;
             if h>0
                for j=1:h    
                    if c(j)>0
                       svr=svr+c(j); 
                    end
                end
             end
             [h,y]=size(ceq);      
             if h>0
                for j=1:h
                    ceq(j)=abs(ceq(j))-eps;
                    if ceq(j)>0
                       svr=svr+ceq(j); 
                    end
                end
             end
             bacteria(i,(var+var+2))=svr;
       end
        
       
%          case 101   % problema 101 recipiente de presion
%        for i=1:f
%        x=bacteria(i,1:var);
%               fx=recipiente(x);
%               [c ceq]=Crecipiente(x);
%              bacteria(i,(var+var+1))=fx;
%               [h,y]=size(c);
%              svr=0;
%              if h>0
%                 for j=1:h    
%                     if c(j)>0
%                        svr=svr+c(j); 
%                     end
%                 end
%              end
%              [h,y]=size(ceq);      
%              if h>0
%                 for j=1:h
%                     ceq(j)=abs(ceq(j))-eps;
%                     if ceq(j)>0
%                        svr=svr+ceq(j); 
%                     end
%                 end
%              end
%              bacteria(i,(var+var+2))=svr;
%         end
 end
bact=bacteria;
