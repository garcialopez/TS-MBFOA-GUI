function varargout = start(varargin)
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Inicio_OpeningFcn, ...
                   'gui_OutputFcn',  @Inicio_OutputFcn, ...
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


% --- Executes just before Inicio is made visible.
function Inicio_OpeningFcn(hObject, eventdata, handles, varargin)
scrsz = get(0, 'ScreenSize');
pos_act = get(gcf, 'Position');
xr = scrsz(3) - pos_act(3);
xp = round(xr/2);
yr = scrsz(4) - pos_act(4);
yp = round(yr/2);
set(gcf, 'Position',[xp yp pos_act(3) pos_act(4)]);



val = 1;

save val;

axes(handles.axes2) 
handles.imagen=imread('img/Logo TS-MBFOA.png'); 
imagesc(handles.imagen) 
axis off 

a=imread('img/btnMas.png');
set(handles.btnMas,'CData',a);
a=imread('img/btnConfg.png');
set(handles.btnConfg,'CData',a);

% Choose default command line output for Inicio
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% --- Outputs from this function are returned to the command line.
function varargout = Inicio_OutputFcn(hObject, eventdata, handles) 
% Get default command line output from handles structure
varargout{1} = handles.output;


% --------------------------------------------------------------------
function Untitled_1_Callback(hObject, eventdata, handles)
% --------------------------------------------------------------------
function Untitled_3_Callback(hObject, eventdata, handles)
Acerca_de;
% --------------------------------------------------------------------
function Untitled_7_Callback(hObject, eventdata, handles)
% --------------------------------------------------------------------
function Untitled_9_Callback(hObject, eventdata, handles)
% --------------------------------------------------------------------
function Untitled_2_Callback(hObject, eventdata, handles)
% se dirige a una nueva ejecucion
mainUI;
% --------------------------------------------------------------------
function Untitled_4_Callback(hObject, eventdata, handles)
% --------------------------------------------------------------------
function Untitled_6_Callback(hObject, eventdata, handles)
close(handles.output);
% --------------------------------------------------------------------
function figure1_CloseRequestFcn(hObject, eventdata, handles)
opc = questdlg('¿Desea salir del programa?','Salir','Si','No','No');

if strcmp(opc,'No')
	return;
end
delete(hObject);
% --- Executes on button press in btnMas.
function btnMas_Callback(hObject, eventdata, handles)
    % se dirige a una nueva ejecucion
    mainUI;
% --- Executes on button press in btnConfg.
function btnConfg_Callback(hObject, eventdata, handles)
% --------------------------------------------------------------------
