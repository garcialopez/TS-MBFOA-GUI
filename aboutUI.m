function varargout = aboutUI(varargin)
% ACERCA_DE MATLAB code for Acerca_de.fig
%      ACERCA_DE, by itself, creates a new ACERCA_DE or raises the existing
%      singleton*.
%
%      H = ACERCA_DE returns the handle to a new ACERCA_DE or the handle to
%      the existing singleton*.
%
%      ACERCA_DE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ACERCA_DE.M with the given input arguments.
%
%      ACERCA_DE('Property','Value',...) creates a new ACERCA_DE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Acerca_de_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Acerca_de_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Acerca_de

% Last Modified by GUIDE v2.5 07-Oct-2018 18:23:22

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Acerca_de_OpeningFcn, ...
                   'gui_OutputFcn',  @Acerca_de_OutputFcn, ...
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


% --- Executes just before Acerca_de is made visible.
function Acerca_de_OpeningFcn(hObject, eventdata, handles, varargin)

scrsz = get(0, 'ScreenSize');
pos_act = get(gcf, 'Position');
xr = scrsz(3) - pos_act(3);
xp = round(xr/2);
yr = scrsz(4) - pos_act(4);
yp = round(yr/2);
set(gcf, 'Position',[xp yp pos_act(3) pos_act(4)]);

axes(handles.axes1);
handles.imagen=imread('img/acerca.png'); 
imagesc(handles.imagen);
axis off

% Choose default command line output for Acerca_de
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Acerca_de wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Acerca_de_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in checkbox1.
function checkbox1_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox1
