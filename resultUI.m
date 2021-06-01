function varargout = resultUI(varargin)
% Edit the above text to modify the response to help Resultados

% Last Modified by GUIDE v2.5 13-Mar-2020 16:02:26

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Resultados_OpeningFcn, ...
                   'gui_OutputFcn',  @Resultados_OutputFcn, ...
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


% --- Executes just before Resultados is made visible.
function Resultados_OpeningFcn(hObject, eventdata, handles, varargin)
scrsz = get(0, 'ScreenSize');
pos_act = get(gcf, 'Position');
xr = scrsz(3) - pos_act(3);
xp = round(xr/2);
yr = scrsz(4) - pos_act(4);
yp = round(yr/2);
set(gcf, 'Position',[xp yp pos_act(3) pos_act(4)]);

%a=imread('img/expor.png');
%set(handles.btnExportar,'CData',a);

axes(handles.axes3); 
imagenAxes(handles,'img/Logo TS-MBFOA3.png');

load('configuracionParametros.mat', 'configuracion');

set(handles.txtCorridas,'string',configuracion(1,1));
set(handles.txtSb,'string',configuracion(1,3));
set(handles.txtNc,'string',configuracion(1,4));
set(handles.txtBeta,'string',configuracion(1,5));
set(handles.txtSr,'string',configuracion(1,6));
set(handles.txtR,'string',configuracion(1,7));
set(handles.txtGmax,'string',configuracion(1,8));
set(handles.txtRepCycle,'string',configuracion(1,9));

load('configuracionNombreFechaArchivo.mat', 'configuracionNombreFecha')
set(handles.txtFecha,'string',configuracionNombreFecha(2));
set(handles.lblD,'string',configuracionNombreFecha(3));

%titulo = strcat('Resultados de ejecución: "',configuracionNombreFecha(1),'"');

%set(handles.lblTitulo,'string',titulo);

load('graficaConvergencia.mat', 'grafica');
plot(handles.convergencia,grafica(:,1),grafica(:,2),'bo-', 'MarkerSize', 5,'LineWidth',1.5,'LineStyle','-');

xlabel(handles.convergencia,{'Generations'},'FontSize',11);
ylabel(handles.convergencia,{'Obj Function'},'FontSize',11);
legend(handles.convergencia,'TS-MBFOA');

title(handles.convergencia,'Convergence of the median run by TS-MBFOA');



 load('mutmbfoa01.mat', 'resultado');
 set(handles.tablaResultados, 'data', resultado);
 
 load('mutmbfoa01.mat', 'finales');
 
 set(handles.ms,'string',sprintf('%0.4e',finales(100,1)));
 set(handles.me,'string',finales(100,2));
 set(handles.m,'string',finales(100,3));
 set(handles.de,'string',sprintf('%0.7f',finales(100,4)));
 set(handles.pv,'string',sprintf('%0.4e',finales(100,5)));
 set(handles.tf,'string',finales(100,6));
 set(handles.te,'string',finales(100,7));
 set(handles.re,'string',finales(100,8));
 
%x = 0;
 for i=1:length(resultado)
     if finales(100,1) == resultado(i,4)
         x = i;
     end
 end
  
 texto = strcat('The best solution is found in row',{' '},num2str(x),{' '},'in the final results table.');
 set(handles.lblText,'string',texto);

% Choose default command line output for Resultados
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Resultados wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Resultados_OutputFcn(hObject, eventdata, handles) 
% Get default command line output from handles structure
varargout{1} = handles.output;


% --------------------------------------------------------------------
function Untitled_1_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function imagenAxes(handles,rutaImg)
    %coloca imagen en un axes
    handles.imagen=imread(rutaImg); 
    imagesc(handles.imagen);
    axis off
% --------------------------------------------------------------------   
function Untitled_3_Callback(hObject, eventdata, handles)
Acerca_de;
% hObject    handle to Untitled_3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_7_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_9_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_2_Callback(hObject, eventdata, handles)
% se dirige a una nueva ejecucion
mainUI;


% --------------------------------------------------------------------
function Untitled_4_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_6_Callback(hObject, eventdata, handles)
mainUI;
close(handles.output);


function figure1_CloseRequestFcn(hObject, eventdata, handles)
delete(hObject);



function txtSb_Callback(hObject, eventdata, handles)
% hObject    handle to txtSb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtSb as text
%        str2double(get(hObject,'String')) returns contents of txtSb as a double


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
% hObject    handle to txtNc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtNc as text
%        str2double(get(hObject,'String')) returns contents of txtNc as a double


% --- Executes during object creation, after setting all properties.
function txtNc_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtNc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txtBeta_Callback(hObject, eventdata, handles)
% hObject    handle to txtBeta (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtBeta as text
%        str2double(get(hObject,'String')) returns contents of txtBeta as a double


% --- Executes during object creation, after setting all properties.
function txtBeta_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtBeta (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txtSr_Callback(hObject, eventdata, handles)
% hObject    handle to txtSr (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtSr as text
%        str2double(get(hObject,'String')) returns contents of txtSr as a double


% --- Executes during object creation, after setting all properties.
function txtSr_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtSr (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txtR_Callback(hObject, eventdata, handles)
% hObject    handle to txtR (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtR as text
%        str2double(get(hObject,'String')) returns contents of txtR as a double


% --- Executes during object creation, after setting all properties.
function txtR_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtR (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txtGmax_Callback(hObject, eventdata, handles)
% hObject    handle to txtGmax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtGmax as text
%        str2double(get(hObject,'String')) returns contents of txtGmax as a double


% --- Executes during object creation, after setting all properties.
function txtGmax_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtGmax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txtRepCycle_Callback(hObject, eventdata, handles)
% hObject    handle to txtRepCycle (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtRepCycle as text
%        str2double(get(hObject,'String')) returns contents of txtRepCycle as a double


% --- Executes during object creation, after setting all properties.
function txtRepCycle_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtRepCycle (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txtCorridas_Callback(hObject, eventdata, handles)
% hObject    handle to txtCorridas (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtCorridas as text
%        str2double(get(hObject,'String')) returns contents of txtCorridas as a double


% --- Executes during object creation, after setting all properties.
function txtCorridas_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtCorridas (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txtFecha_Callback(hObject, eventdata, handles)
% hObject    handle to txtFecha (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtFecha as text
%        str2double(get(hObject,'String')) returns contents of txtFecha as a double


% --- Executes during object creation, after setting all properties.
function txtFecha_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtFecha (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function lblM_Callback(hObject, eventdata, handles)
% hObject    handle to lblM (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of lblM as text
%        str2double(get(hObject,'String')) returns contents of lblM as a double


% --- Executes during object creation, after setting all properties.
function lblM_CreateFcn(hObject, eventdata, handles)
% hObject    handle to lblM (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function lblD_Callback(hObject, eventdata, handles)
% hObject    handle to lblD (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of lblD as text
%        str2double(get(hObject,'String')) returns contents of lblD as a double


% --- Executes during object creation, after setting all properties.
function lblD_CreateFcn(hObject, eventdata, handles)
% hObject    handle to lblD (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in btnExportar.
function btnExportar_Callback(hObject, eventdata, handles)

[PathFile]=uigetdir; %  Con este comando abres el directorio

if PathFile == 0
    warndlg('Debe seleccionar una ruta.','Error');
else


  load('configuracionNombreFechaArchivo.mat', 'configuracionNombreFecha')

configuracion = {'CONFIGURACIÓN PROBLEMA RESORTE TENSIÓN/COMPRESIÓN',''
    '','',
    'Corridas:',get(handles.txtCorridas,'string'),
    'Bacterias (Sb):',get(handles.txtSb,'string'),
    'Ciclos quimiotacticos (Nc):',get(handles.txtNc,'string'),
    'Factor de escalamiento (?):',get(handles.txtBeta,'string'),
    'Bacterias a reproducir (Sr):',get(handles.txtSr,'string'),
    'Tamaño de paso (R):',get(handles.txtR,'string'),
    'Número de generaciones (GMAX):',get(handles.txtGmax,'string'),
    'Factor de reproducción (RepCycle):',get(handles.txtRepCycle,'string')
};


estadisticas = {'ESTADÍSTICAS DE LA MEJOR SOLUCIÓN',''
    '','',
    'Mejor solución: ',get(handles.ms,'string'),
    'Mejor de la ejecución: ',get(handles.me,'string'),
    'Mediana: ',get(handles.m,'string'),
    'Desviación estandar: ',get(handles.de,'string'),
    'Peor valor: ',get(handles.pv,'string'),
    'Tasa de factibilidad: ',get(handles.tf,'string'),
    'Tasa de éxito: ',get(handles.te,'string'),
    'rendimiento: ',get(handles.re,'string')

};
nombreArchivo = char(strcat(PathFile,'\',configuracionNombreFecha(1),'.xlsx'));

 load('mutmbfoa01.mat', 'resultado');
 load('graficaConvergencia.mat', 'grafica');
 
 titulos = {'GRÁFICA DE CONVERGENCIA', 'RESULTADOS FINALES'};

xlswrite(nombreArchivo,[configuracion],'Hoja1','A1');
xlswrite(nombreArchivo,[estadisticas],'Hoja1','A13');
xlswrite(nombreArchivo,[titulos(1)],'Hoja1','G1');
xlswrite(nombreArchivo,[grafica],'Hoja1','G3');
xlswrite(nombreArchivo,[titulos(2)],'Hoja1','A38');
xlswrite(nombreArchivo,[resultado],'Hoja1','A40');

%obtener imagen
imagen1 = getframe(handles.convergencia);

    %guardar imagen
    Imagen = frame2im(imagen1);
    nombreImagen = char(strcat(PathFile,'\',configuracionNombreFecha(1),'.jpg'));
    imwrite(Imagen,nombreImagen);





msgbox('Archivo guardado con éxito.','Correcto')
end


function ms_Callback(hObject, eventdata, handles)
% hObject    handle to ms (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ms as text
%        str2double(get(hObject,'String')) returns contents of ms as a double


% --- Executes during object creation, after setting all properties.
function ms_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ms (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function me_Callback(hObject, eventdata, handles)
% hObject    handle to me (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of me as text
%        str2double(get(hObject,'String')) returns contents of me as a double


% --- Executes during object creation, after setting all properties.
function me_CreateFcn(hObject, eventdata, handles)
% hObject    handle to me (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function m_Callback(hObject, eventdata, handles)
% hObject    handle to m (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of m as text
%        str2double(get(hObject,'String')) returns contents of m as a double


% --- Executes during object creation, after setting all properties.
function m_CreateFcn(hObject, eventdata, handles)
% hObject    handle to m (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function de_Callback(hObject, eventdata, handles)
% hObject    handle to de (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of de as text
%        str2double(get(hObject,'String')) returns contents of de as a double


% --- Executes during object creation, after setting all properties.
function de_CreateFcn(hObject, eventdata, handles)
% hObject    handle to de (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function pv_Callback(hObject, eventdata, handles)
% hObject    handle to pv (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of pv as text
%        str2double(get(hObject,'String')) returns contents of pv as a double


% --- Executes during object creation, after setting all properties.
function pv_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pv (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function tf_Callback(hObject, eventdata, handles)
% hObject    handle to tf (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of tf as text
%        str2double(get(hObject,'String')) returns contents of tf as a double


% --- Executes during object creation, after setting all properties.
function tf_CreateFcn(hObject, eventdata, handles)
% hObject    handle to tf (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function te_Callback(hObject, eventdata, handles)
% hObject    handle to te (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of te as text
%        str2double(get(hObject,'String')) returns contents of te as a double


% --- Executes during object creation, after setting all properties.
function te_CreateFcn(hObject, eventdata, handles)
% hObject    handle to te (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function re_Callback(hObject, eventdata, handles)
% hObject    handle to re (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of re as text
%        str2double(get(hObject,'String')) returns contents of re as a double


% --- Executes during object creation, after setting all properties.
function re_CreateFcn(hObject, eventdata, handles)
% hObject    handle to re (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function lblH_Callback(hObject, eventdata, handles)
% hObject    handle to lblH (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of lblH as text
%        str2double(get(hObject,'String')) returns contents of lblH as a double


% --- Executes during object creation, after setting all properties.
function lblH_CreateFcn(hObject, eventdata, handles)
% hObject    handle to lblH (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
