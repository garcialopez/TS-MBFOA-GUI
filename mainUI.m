%{
      ALGORITMO BASADO EN EL FORRAJEO DE BACTERIAS PARA RESOLVER
        PROBLEMAS NUMÉRICOS DE OPTIMIZACIÓN CON RESTRICCIONES 
              DESARROLLADO POR DRA. BETANIA HDEZ OCAÑA.

%}


function varargout = mainUI(varargin)
clc
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Config_OpeningFcn, ...
                   'gui_OutputFcn',  @Config_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before mainUI is made visible.
function Config_OpeningFcn(hObject, eventdata, handles, varargin)
scrsz = get(0, 'ScreenSize');
pos_act = get(gcf, 'Position');
xr = scrsz(3) - pos_act(3);
xp = round(xr/2);
yr = scrsz(4) - pos_act(4);
yp = round(yr/2);
set(gcf, 'Position',[xp yp pos_act(3) pos_act(4)]);



%a=imread('img/Guardar.png');
%set(handles.btnGuardar,'CData',a);

%a=imread('img/iniciar.png');
%set(handles.btnIniciar,'CData',a);

%a=imread('img/parar.png');
%set(handles.btnCancelar,'CData',a);

%a=imread('img/res.png');
%set(handles.btnResultado,'CData',a);

axes(handles.axes4); 
imagenAxes(handles,'img/Logo TS-MBFOA2.png');

axes(handles.axes5); 
imagenAxes(handles,'img/conf.png');

axes(handles.axes7); 
imagenAxes(handles,'img/cali.png');

axes(handles.axes9); 
imagenAxes(handles,'img/adver.png');

axes(handles.axes10); 
imagenAxes(handles,'img/adver.png');

% Choose default command line output for mainUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% --- Outputs from this function are returned to the command line.
  

function varargout = Config_OutputFcn(hObject, eventdata, handles) 
% Get default command line output from handles structure
varargout{1} = handles.output;
% --------------------------------------------------------------------
function imagenAxes(handles,rutaImg)
    %coloca imagen en un axes
    handles.imagen=imread(rutaImg); 
    imagesc(handles.imagen);
    axis off
    
    
function Untitled_1_Callback(hObject, eventdata, handles)
% --------------------------------------------------------------------
function Untitled_3_Callback(hObject, eventdata, handles)
% --------------------------------------------------------------------
function Untitled_7_Callback(hObject, eventdata, handles)
% --------------------------------------------------------------------
function Untitled_9_Callback(hObject, eventdata, handles)
% --------------------------------------------------------------------
function Untitled_4_Callback(hObject, eventdata, handles)
% --------------------------------------------------------------------
function Untitled_6_Callback(hObject, eventdata, handles)
close(handles.output);

function figure1_CloseRequestFcn(hObject, eventdata, handles)
opc = questdlg('¿Desea regresar a inicio?','Atrás','Si','No','No');

if strcmp(opc,'No')
	return;
end
delete(hObject);
start;

function txtNombre_CreateFcn(hObject, eventdata, handles)
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end
% --- Executes on button press in btnGuardar.
function btnGuardar_Callback(hObject, eventdata, handles)
         
        %onfiguracionNombre = zeros(1,2);
        configuracion = zeros(1,9);
        if get(handles.boxProblema,'Value') == 2
             configuracion(1,2) = 100;
        end

     configuracionNombreFecha = {get(handles.txtNombre,'string'),date}; %se guarda el nombre de problema
     configuracion(1,1) = get(handles.boxNumeroE,'Value'); %se guarda el valor de corridas



%*********************** CALIBRACION ********************************************
        configuracion(1,3) = str2num(get(handles.txtSb,'string')); %número de población de bacterias [10,500]
        configuracion(1,4) = str2num(get(handles.txtNc,'string')); %número de ciclos quimiotacticos [1,sb]
        configuracion(1,5) = str2double(get(handles.txtBeta,'string')); %factor de escalamiento [0,2]
        configuracion(1,6) = str2double(get(handles.txtSr,'string')); %numero de bacterias a reproducir [1, sb/2]
        configuracion(1,9) = str2double(get(handles.txtRepcycle,'string')); %frecuencia de reproducción [1,gmax/2]
        configuracion(1,7) = str2double(get(handles.txtR,'string')); %[0,1]
        configuracion(1,8) = str2double(get(handles.txtGmax,'string')); %numero de evaluaciones  [15,000 ->  30,000]   
   %*******************************************************************************
   
     savefile = 'configuracionParametros';
     save(savefile, 'configuracion');
     savefile = 'configuracionNombreFechaArchivo';
     save(savefile, 'configuracionNombreFecha');           
     
     msgbox('Datos guardados con éxito.','Correcto');
     
        set(handles.btnIniciar,'Enable','on');
        set(handles.btnGuardar,'Enable','off');
        set(handles.lblResultado,'visible','off');
        
function edit3_Callback(hObject, eventdata, handles)
% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end
% --- Executes on selection change in boxProblema.
function boxProblema_Callback(hObject, eventdata, handles)
    nombreEje = get(handles.txtNombre,'string');
  
   %%se determina si la variable esta vacia (nombre de la ejecucion)
    if isempty(nombreEje) 
       warndlg('Debe escribir un nombre para la ejecución.','Advertencia');
       set(handles.boxProblema,'Enable','off');
       axes(handles.axes9); 
       imagenAxes(handles,'img/adver.png');
    else
        set(handles.boxNumeroE,'Enable','on');
        
        %ahora se evalua si se selecciono algun problema
         switch get(handles.boxProblema,'Value')
            case 1
                   axes(handles.axes9); 
                   imagenAxes(handles,'img/adver.png');
                  warndlg('Debe de selecionar un problema.','Advertencia');
                  set(handles.txtSb,'Enable','off');                   
            case 2 
                  %problema de resorte
                 axes(handles.axes9); 
                 imagenAxes(handles,'img/bien.png');
                 set(handles.txtSb,'Enable','on');
                 set(handles.btnGuardar,'Enable','on');
                 axes(handles.axes10); 
                 imagenAxes(handles,'img/bien.png');
         end       
    end
% --- Executes during object creation, after setting all properties.
function boxProblema_CreateFcn(hObject, eventdata, handles)
% hObject    handle to boxProblema (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in boxNumeroE.
function boxNumeroE_Callback(hObject, eventdata, handles)
% --- Executes during object creation, after setting all properties.
function boxNumeroE_CreateFcn(hObject, eventdata, handles)
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end

function txtSb_Callback(hObject, eventdata, handles)
    a = str2double(get(handles.txtSb, 'string'));
    if a < 10 || a > 500 || isnan(a) %verifica si es  jumero
        errordlg('El rango establecido es [10 - 500].','Fuera de rango');
    return;
    end 
    set(handles.txtNc,'Enable','on');
% --- Executes during object creation, after setting all properties.
function txtSb_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtSb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txtNc_Callback(hObject, eventdata, handles)
    %-------------------------------------------------------------------------------------
    
    a = str2double(get(handles.txtNc, 'string'));
    b = str2double(get(handles.txtSb, 'string'));   
    mensaje = strcat('El número debe ser menor o igual a ',' "',num2str(b),'" (Sb).');
    
    if a < 0 || a > b || isnan(a) %verifica si es  numero
        errordlg(mensaje,'Fuera de rango');
       return;
    end 
    
    set(handles.txtBeta,'Enable','on');
    
    
   %-------------------------------------------------------------------------------------
function txtNc_CreateFcn(hObject, eventdata, handles)
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end
% --------------------------------------------------------------------
function txtBeta_Callback(hObject, eventdata, handles)
    %-------------------------------------------------------------------------------------
    
    a = str2double(get(handles.txtBeta, 'string'));
    mensaje = strcat('El rango establecido es [0 - 2].');
           if a < 0 || a > 2 || isnan(a) %verifica si es  Numero
            errordlg(mensaje,'Fuera de rango');
           return;
        end 
    
    set(handles.txtSr,'Enable','on');
   %-------------------------------------------------------------------------------------
function txtBeta_CreateFcn(hObject, eventdata, handles)
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end
% --------------------------------------------------------------------
function txtSr_Callback(hObject, eventdata, handles)
    %-------------------------------------------------------------------------------------
    
    a = str2double(get(handles.txtSr, 'string'));
    b = str2double(get(handles.txtSb, 'string'));
    mensaje = strcat('El rango establecido es [1-',num2str(b/2),'].');
        if a < 1 || a > (b/2) || isnan(a) %verifica si es  Numero
            errordlg(mensaje,'Fuera de rango');
           return;
        end 
    
    set(handles.txtR,'Enable','on');
    
   %-------------------------------------------------------------------------------------
function txtSr_CreateFcn(hObject, eventdata, handles)
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end
% --------------------------------------------------------------------
function txtR_Callback(hObject, eventdata, handles)
    %-------------------------------------------------------------------------------------
    
    a = str2double(get(handles.txtR, 'string'));
    mensaje = strcat('El rango establecido es [0 - 1].');
           if a < 0 || a > 1 || isnan(a) %verifica si es  jumero
            errordlg(mensaje,'Fuera de rango');
           return;
        end 
    
    set(handles.txtGmax,'Enable','on');
    
   %-------------------------------------------------------------------------------------
function txtR_CreateFcn(hObject, eventdata, handles)
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end
% --------------------------------------------------------------------
function txtGmax_Callback(hObject, eventdata, handles)
    %-------------------------------------------------------------------------------------
    
    a = str2double(get(handles.txtGmax, 'string'));
    mensaje = strcat('El rango establecido es [15,000 - 30,000].');
           if a < 15000 || a > 30000 || isnan(a) %verifica si es  numero
            errordlg(mensaje,'Fuera de rango');
           return;
        end 
    
    set(handles.txtRepcycle,'Enable','on');
    
   %-------------------------------------------------------------------------------------
function txtGmax_CreateFcn(hObject, eventdata, handles)
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end
% --------------------------------------------------------------------
function txtRepcycle_Callback(hObject, eventdata, handles)
    %-------------------------------------------------------------------------------------
    
    a = str2double(get(handles.txtRepcycle, 'string'));
    b = str2double(get(handles.txtGmax, 'string'));
    mensaje = strcat('El rango establecido es [1-',num2str(b/2),'].');
        if a < 1 || a > (b/2) || isnan(a) %verifica si es  Numero
            axes(handles.axes10); 
            imagenAxes(handles,'img/adver.png');
            set(handles.btnGuardar,'Enable','off');
            errordlg(mensaje,'Fuera de rango');
           return;
        end 
    axes(handles.axes10); 
    imagenAxes(handles,'img/bien.png');
    set(handles.btnGuardar,'Enable','on');
    
   %-------------------------------------------------------------------------------------
function txtRepcycle_CreateFcn(hObject, eventdata, handles)
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end
% --------------------------------------------------------------------
function txtTemporizador_Callback(hObject, eventdata, handles)
% --- Executes during object creation, after setting all properties.
function txtTemporizador_CreateFcn(hObject, eventdata, handles)
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end
% --- Executes on button press in btnIniciar.
function btnIniciar_Callback(hObject, eventdata, handles)
    set(handles.btnCancelar,'Enable','on');   
    set(handles.btnIniciar,'Enable','off');  
    pause(1);
    ts_mbfoa(handles);
    
    
  

function ts_mbfoa(handles)
     %barra de progreso    
    wb = waitbar(0, 'Please wait...');
    set(wb,'Name','Running');
    %-----------------------------------
    
    reloj=clock;
    set(handles.lblHoraI,'string',reloj(4));
    set(handles.lblMinutoI,'string',reloj(5));
    set(handles.lblSI,'string',round(reloj(6)));

    if get(handles.boxProblema,'Value') == 2
         numPro = 100;
    end
       
    %{
        Matriz para guardar el resultados de las ejecuciones 
        independientes con las siguientes columnas:
        Mejor, media, mediana, desv. Estandar, peor, tasa de factibilidad, 
        tasa de exito, rendimiento exitoso.
     %}
    finales = zeros(30,8);   
    corridas = get(handles.boxNumeroE,'Value');  %Ejecuciones independientes [1,30]
    problems = numPro; %Numero del problema a resolver
    semillas = zeros(problems,corridas);
    
        for problema = 100:problems

             var = varNumber(problema);
             resultado = zeros(30,var+2);
             sccp = zeros(corridas,1); 
             factibles = zeros(corridas,1);  
             convergencia15 = zeros(1000,2);  %guardar la convergencia de la ejecucion 15

            for run = 1:corridas

                semilla = sum(100*clock);
                semillas(problema,run) = semilla;
                rand('state',semilla);
                amt0 = clock;
                
                
              %*********************** CALIBRACION ********************************************
                    sb = str2num(get(handles.txtSb,'string')); %número de población de bacterias [10,500]
                    nc = str2num(get(handles.txtNc,'string')); %número de ciclos quimiotacticos [1,sb]
                    factorE = str2double(get(handles.txtBeta,'string')); %factor de escalamiento [0,2]
                    repro = str2double(get(handles.txtSr,'string')); %numero de bacterias a reproducir [1, sb/2]
                    repcycle = str2double(get(handles.txtRepcycle,'string')); %frecuencia de reproducción [1,gmax/2]
                    tpasos = str2double(get(handles.txtR,'string')); %[0,1]
                    eval = str2double(get(handles.txtGmax,'string')); %numero de evaluaciones  [15,000 ->  30,000]   
               %*******************************************************************************
                                            
               
                prob=problema; %numero del problema a resolver (agregarlo a funcion_obj())
                contador=0; %contador de evaluaciones realizadas por el algoritm
                gene=0;     
                var=varNumber(prob);
                rango=rangoVariables(prob);             
                valores=eval/(sb*nc);
                band=1;
                bp=0;
                sperformance=0;
                gr=0;
              if((valores-0.5)>= floor(valores))
                    gmax=floor(valores);
              else
                  gmax=floor(valores)-1;
              end
                vEvals=zeros(gmax,1);
                nadosExitososG=zeros(gmax,sb);  
                primero=0;
                 convergencia=zeros(gmax,corridas);
                 convergenciaC=zeros(gmax,corridas);
                  constraintsvr=zeros(gmax,corridas);
                 bacterias=population(sb,prob); %population aleatoria   
                        contadorB=0;

           while((contador +(sb*nc)+1)<=eval)
                    gene=gene+1;      
                    bacterias=evaluations(bacterias,prob);
                    contador=contador+sb;
                    bacteriasSuplente=chemotaxis(bacterias,prob,nc);%ciclo quimiotáctico
                    bacterias(:,1:var)=bacteriasSuplente(:,(1:var)); 
                    bacterias(:,(var+var+1):(var+var+2))=bacteriasSuplente(:,(var+var+1:var+var+2));

                    for h=1:sb
                    nadosExitososG(gene,h)=bacteriasSuplente(h,(var+var+3));
                    end

                    contador=contador+(nc*sb);
                    if(rem(gene,repcycle)==0)
                        bacterias=reproduction(bacterias,repro); %reproduction de bacterias
                    end

                    bacterias=sortBacteria(bacterias,prob);

                    bacterias(sb,:)=eliminationDispersal(prob); %eliminación-d de bacterias
                    contador=contador+1;
                    gene
                    %******tamaño de paso estático ******
                  for u=1:sb
                        for k=1:var
                            vector(u,var+k)=(rango(k,1) + (rango(k,2) - rango(k,1)))*tpasos;
                        end
                  end 
                 
                    contadorf=0;
                   for d=1:sb
                      if(bacterias(d,var+var+2)==0)
                          contadorf=contadorf+1;
                      end
                   end
                     factibles(run)=contadorf;         

                   if(bacterias(1,(var+var+2))==0)
                   sperformance=sperformance+successPerformance(bacterias(1,:),prob); %variable que permite conocer la evaluación donde se cumple la condición de éxito     
                    if((bp==0) && (sperformance==1))
                      sccp(run,1)=contador;  
                      bp=1;
                      contadorMaxB=contador;
                    end
                   end

                     disp(bacterias(1,var+var+1));
                     disp(bacterias(1,var+var+2));
                     bacterias=sortBacteria(bacterias,prob); 

                     convergenciaC(gene,1)=bacterias(1,var+var+1);
                     convergenciaC(gene,2)=bacterias(1,var+var+2);
                     vEvals(gene,1)=contador;

                  if(gene>1)
                     if(convergencia(gene,run)== convergencia(gene-1,run))
                         contadorB=contadorB+1;
                     end
                  end
                   if(run==15)
                     convergencia15(gene,1)= bacterias(1,var+var+1);
                     convergencia15(gene,2)=bacterias(1,var+var+2);
                   end

              end
              promediofactibles=mean(factibles);
            disp(promediofactibles);
            disp('termino corrida');
            disp(run);
            disp(bacterias(1,(var+var+1):(var+var+2)));
            bacterias(1,var+1);
                    for j=1:var
                    resultado(run,j)=bacterias(1,j);
                    end
                    resultado(run,var+1)=bacterias(1,var+var+1);
                    resultado(run,var+2)=bacterias(1,var+var+2);

                    
             %barrra de progreso       
              if(mod(run,1) == 0)
                waitbar(run/corridas);
              end
              %------------------------
         
        end %final de las corridas de ejecuciones independientes

            fi='funcionm3';
                number=problema;
                archivo=strcat(fi,num2str(number));
                savefile = archivo;
                save(savefile, 'resultado'); %para guardar las variables y resultado de la
        %función objetivo y obteniendo las estadisticas básicas de los resultados
         tasaExito=successRate(resultado,run,var,problema);

           % if ((problema == 1) || (problema ==2) || (problema == 3) || (problema == 4) || (problema ==5) || (problema == 6) || (problema == 7) || (problema ==8) || (problema == 9) || (problema == 10) || (problema ==11) || (problema == 12) || (problema == 13) || (problema ==15) || (problema == 16) || (problema == 17) || (problema ==18) || (problema == 19) || (problema == 20) || (problema ==23) || (problema == 24))    
                estadisticas=zeros(1,2);
                cons=0;
                for d=1:run
                    if(resultado(d,var+2)==0)
                        cons=cons+1;
                        estadisticas(cons,:)=resultado(d,var+1);
                    end
                end
             if (cons>0)
                mejor=min(estadisticas);
                peor=max(estadisticas);
                media=mean(estadisticas);
                mediana=median(estadisticas);
                desvEst=std(estadisticas);
            else
                mejor=0;
                peor=0;
                media=0;
                mediana=0;
                desvEst=0;
             end 

             %conociendo a successPerformance
             pd=0;
             pscp=0;
             for v=1:run
                   if(sccp(v,1)>0)
                       pd=pd+1;
                       pscp=pscp+sccp(v,1);
                   end
             end
             if (pscp>0 && pd>0)
                 pscp=pscp/pd;
             else
                 pscp=0;
             end
             %conociendo a successPerformance
                    finales(problema,1)=mejor(1,1);
                    finales(problema,2)=media(1,1);
                    finales(problema,3)=mediana(1,1);
                    finales(problema,4)=desvEst(1,1);
                    finales(problema,5)=peor(1,1);
                    if (cons>0)
                        finales(problema,6)=(cons*100)/corridas; %tasa de factibilidad
                    else
                        finales(problema,6)=0;
                    end
                    if(tasaExito>0)
                        finales(problema,7)=(tasaExito*100)/corridas; %tasa de exito
                    else
                        finales(problema,7)=0;
                    end
                    if(pscp>0)
                        finales(problema,8)=floor(pscp*corridas)/pd; %rendimiento exitoso
                    else 
                        finales(problema,8)=0;
                    end
                    disp(finales(problema,:));
               disp('problema');
               problema

               [nd,fc]=size(nadosExitososG);

               for v=1:nd
                   totale=0;
                   for k=1:fc
                     totale=totale+ nadosExitososG(v,k);
                   end
                   Nadostotales(v,1)=totale;
               end
               %successfullswim rate
               swrt=sb*nc*gmax;
               totalnados=0;
               for v=1:nd
                  totalnados=totalnados+Nadostotales(v,1); 
               end
               successfullswimrate=(totalnados/swrt)*100;
               
        end

                savefile = 'globalm3';
                save(savefile, 'finales'); %para guardar las variables y resultado de la
        %función objetivo y 
         %disp(bacterias(1,:)); %al final del ejecución se presenta la mejor bacteria
        %plot(convergencia(1:gene,1));
        %for(jh=1:gmax)
         %vv(jh,1)=jh; 
        %end
        %plot(vv(:,1),Nadostotales(:,1),'ro', 'MarkerSize', 3.5);   

        %plot(vv(:,1),convergencia(:,1),'ro', 'MarkerSize', 3.5);

        %plot(vEvals(:,1),convergenciaC(:,1),'ro', 'MarkerSize', 3.5);
                 
        
       
            grafica = zeros(length(vEvals),2);
       
            grafica(:,1) = vEvals(:,1);
            grafica(:,2) = convergenciaC(:,1);
        
             savefile = 'graficaConvergencia';
             save(savefile, 'grafica');

        filename = 'mutmbfoa01.mat';
        save(filename);
        
        delete(wb);
        mostrarRes(handles);
        
%%***********************************************************************************************************************************************************************************   
function mostrarRes(handles)
    set(handles.btnCancelar,'Enable','off');
    set(handles.btnGuardar,'Enable','on');
    set(handles.btnResultado,'Enable','on');
    set(handles.lblResultado,'string','Process Completed Successfully!');
    set(handles.lblResultado,'visible','on');
        
    reloj=clock;
    set(handles.lblHoraT,'string',reloj(4));
    set(handles.lblMinutoT,'string',reloj(5));
    set(handles.lblST,'string',round(reloj(6)));
    
    horaInicio = str2double(get(handles.lblHoraI,'string'));
    minutoInicio = str2double(get(handles.lblMinutoI,'string'));
    segundoInicio = (str2double(get(handles.lblSI,'string')));
        
    horaTermino = str2double(get(handles.lblHoraT,'string'));
    minutoTermino = str2double(get(handles.lblMinutoT,'string'));
    segundoTermino = str2double(get(handles.lblST,'string'));
        
    totalSegundosInicio= (horaInicio * 60 * 60) + (minutoInicio * 60) + segundoInicio
    totalSegundoTermmino= (horaTermino * 60 * 60) + (minutoTermino * 60) + segundoTermino
        
     num = totalSegundoTermmino - totalSegundosInicio
        
     durH = fix(num/3600)
     durM = fix((num-(3600*durH))/60)
     seg = fix(num-((durH*3600)+(durM*60)))
      
    set(handles.lblHD,'string',durH);
    set(handles.lblMD,'string',durM);
    set(handles.lblSD,'string',seg);
    
    duracion = strcat(get(handles.lblHD,'string'),':',get(handles.lblMD,'string'),':',get(handles.lblSD,'string')); 
    
    configuracionNombreFecha = {get(handles.txtNombre,'string'),date,duracion}; %se guarda el nombre de problema

     savefile = 'configuracionNombreFechaArchivo';
     save(savefile, 'configuracionNombreFecha'); 
    
    

% --- Executes on button press in btnCancelar.
function btnCancelar_Callback(hObject, eventdata, handles)

% --------------------------------------------------------------------
function edit22_Callback(hObject, eventdata, handles)
% --- Executes during object creation, after setting all properties.
function edit22_CreateFcn(hObject, eventdata, handles)
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end
% --------------------------------------------------------------------
function lblMinutoT_Callback(hObject, eventdata, handles)
% --- Executes during object creation, after setting all properties.
function lblMinutoT_CreateFcn(hObject, eventdata, handles)
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end
% --------------------------------------------------------------------
function lblHoraT_Callback(hObject, eventdata, handles)
% --- Executes during object creation, after setting all properties.
function lblHoraT_CreateFcn(hObject, eventdata, handles)
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end
% --------------------------------------------------------------------
function lblHoraI_Callback(hObject, eventdata, handles)
% --- Executes during object creation, after setting all properties.
function lblHoraI_CreateFcn(hObject, eventdata, handles)
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end
% --------------------------------------------------------------------
function lblMinutoI_Callback(hObject, eventdata, handles)
% --- Executes during object creation, after setting all properties.
function lblMinutoI_CreateFcn(hObject, eventdata, handles)
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end
% --------------------------------------------------------------------
function edit19_Callback(hObject, eventdata, handles)
% --- Executes during object creation, after setting all properties.
function edit19_CreateFcn(hObject, eventdata, handles)
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end
% --------------------------------------------------------------------
function lblDuracion_Callback(hObject, eventdata, handles)
% --- Executes during object creation, after setting all properties.
function lblDuracion_CreateFcn(hObject, eventdata, handles)
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end
% --- Executes on button press in btnResultado.
function btnResultado_Callback(hObject, eventdata, handles)

resultUI;
% --------------------------------------------------------------------
function Untitled_10_Callback(hObject, eventdata, handles)
Acerca_de;
% --------------------------------------------------------------------
function txtNombre_Callback(hObject, eventdata, handles)
% --- Executes on key press with focus on txtNombre and none of its controls.
function txtNombre_KeyPressFcn(hObject, eventdata, handles)
   %activa el box de problemas
    set(handles.boxProblema,'Enable','on');


% --- Executes on button press in carg.
function carg_Callback(hObject, eventdata, handles)
% hObject    handle to carg (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function lblHD_Callback(hObject, eventdata, handles)
% hObject    handle to lblHD (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of lblHD as text
%        str2double(get(hObject,'String')) returns contents of lblHD as a double


% --- Executes during object creation, after setting all properties.
function lblHD_CreateFcn(hObject, eventdata, handles)
% hObject    handle to lblHD (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function lblMD_Callback(hObject, eventdata, handles)
% hObject    handle to lblMD (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of lblMD as text
%        str2double(get(hObject,'String')) returns contents of lblMD as a double


% --- Executes during object creation, after setting all properties.
function lblMD_CreateFcn(hObject, eventdata, handles)
% hObject    handle to lblMD (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function lblSI_Callback(hObject, eventdata, handles)
% hObject    handle to lblSI (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of lblSI as text
%        str2double(get(hObject,'String')) returns contents of lblSI as a double


% --- Executes during object creation, after setting all properties.
function lblSI_CreateFcn(hObject, eventdata, handles)
% hObject    handle to lblSI (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function lblST_Callback(hObject, eventdata, handles)
% hObject    handle to lblST (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of lblST as text
%        str2double(get(hObject,'String')) returns contents of lblST as a double


% --- Executes during object creation, after setting all properties.
function lblST_CreateFcn(hObject, eventdata, handles)
% hObject    handle to lblST (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function lblSD_Callback(hObject, eventdata, handles)
% hObject    handle to lblSD (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of lblSD as text
%        str2double(get(hObject,'String')) returns contents of lblSD as a double


% --- Executes during object creation, after setting all properties.
function lblSD_CreateFcn(hObject, eventdata, handles)
% hObject    handle to lblSD (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit32_Callback(hObject, eventdata, handles)
% hObject    handle to edit32 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit32 as text
%        str2double(get(hObject,'String')) returns contents of edit32 as a double


% --- Executes during object creation, after setting all properties.
function edit32_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit32 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit33_Callback(hObject, eventdata, handles)
% hObject    handle to edit33 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit33 as text
%        str2double(get(hObject,'String')) returns contents of edit33 as a double


% --- Executes during object creation, after setting all properties.
function edit33_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit33 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit34_Callback(hObject, eventdata, handles)
% hObject    handle to edit34 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit34 as text
%        str2double(get(hObject,'String')) returns contents of edit34 as a double


% --- Executes during object creation, after setting all properties.
function edit34_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit34 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit35_Callback(hObject, eventdata, handles)
% hObject    handle to edit35 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit35 as text
%        str2double(get(hObject,'String')) returns contents of edit35 as a double


% --- Executes during object creation, after setting all properties.
function edit35_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit35 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit36_Callback(hObject, eventdata, handles)
% hObject    handle to edit36 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit36 as text
%        str2double(get(hObject,'String')) returns contents of edit36 as a double


% --- Executes during object creation, after setting all properties.
function edit36_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit36 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit37_Callback(hObject, eventdata, handles)
% hObject    handle to edit37 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit37 as text
%        str2double(get(hObject,'String')) returns contents of edit37 as a double


% --- Executes during object creation, after setting all properties.
function edit37_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit37 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit38_Callback(hObject, eventdata, handles)
% hObject    handle to edit38 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit38 as text
%        str2double(get(hObject,'String')) returns contents of edit38 as a double


% --- Executes during object creation, after setting all properties.
function edit38_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit38 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit39_Callback(hObject, eventdata, handles)
% hObject    handle to edit39 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit39 as text
%        str2double(get(hObject,'String')) returns contents of edit39 as a double


% --- Executes during object creation, after setting all properties.
function edit39_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit39 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit40_Callback(hObject, eventdata, handles)
% hObject    handle to edit40 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit40 as text
%        str2double(get(hObject,'String')) returns contents of edit40 as a double


% --- Executes during object creation, after setting all properties.
function edit40_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit40 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit41_Callback(hObject, eventdata, handles)
% hObject    handle to edit41 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit41 as text
%        str2double(get(hObject,'String')) returns contents of edit41 as a double


% --- Executes during object creation, after setting all properties.
function edit41_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit41 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
