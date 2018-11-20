function varargout = Temp(varargin)
% TEMP MATLAB code for Temp.fig
%      TEMP, by itself, creates a new TEMP or raises the existing
%      singleton*.
%
%      H = TEMP returns the handle to a new TEMP or the handle to
%      the existing singleton*.
%
%      TEMP('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TEMP.M with the given input arguments.
%
%      TEMP('Property','Value',...) creates a new TEMP or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Temp_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Temp_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Temp

% Last Modified by GUIDE v2.5 13-Nov-2018 17:03:34

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Temp_OpeningFcn, ...
                   'gui_OutputFcn',  @Temp_OutputFcn, ...
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


% --- Executes just before Temp is made visible.
function Temp_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Temp (see VARARGIN)

% Choose default command line output for Temp
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Temp wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Temp_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
clear all;
global a;
a = arduino('COM4','Uno');

function start_Callback(hObject, eventdata, handles)
x = 0;
go = true;
global a;
while go
                  
value = readVoltage(a,'A1');
temp = (value*100);
disp(temp);
x = [x temp];
plot(handles.axes1,x);
grid on;
xlabel('Time(seconds)')
ylabel('Temperature(°C)');
title('Real-Time Temperature Graph');
drawnow
set(handles.edit1,'String',num2str(temp));
pause(1);
end

function edit1_Callback(hObject, eventdata, handles)

function edit1_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
 
