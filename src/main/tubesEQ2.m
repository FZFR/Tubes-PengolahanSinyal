function varargout = tubesEQ2(varargin)
% TUBESEQ2 Mhandles.yTLAB code for tubesEQ2.fig
%      TUBESEQ2, by itself, crehandles.yTes a new TUBESEQ2 or raises the existing
%      singleton*.
%
%      H = TUBESEQ2 returns the handle to a new TUBESEQ2 or the handle to
%      the existing singleton*.
%
%      TUBESEQ2('CALLBACK',hObject,eventDhandles.yTa,handles,...) calls the local
%      function named CALLBACK in TUBESEQ2.M with the given input arguments.
%
%      TUBESEQ2('Property','Value',...) crehandles.yTes a new TUBESEQ2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before tubesEQ2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property applichandles.yTion
%      stop.  All inputs are passed to tubesEQ2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDhandles.yTA, GUIHANDLES

% Edit the above text to modify the response to help tubesEQ2

% Last Modified by GUIDE v2.5 11-Apr-2018 12:51:51

% Begin initializhandles.yTion code - DO NOT EDIT
gui_Singleton = 1;
gui_Sthandles.yTe = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @tubesEQ2_OpeningFcn, ...
                   'gui_OutputFcn',  @tubesEQ2_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_Sthandles.yTe.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_Sthandles.yTe, varargin{:});
else
    gui_mainfcn(gui_Sthandles.yTe, varargin{:});
end
% End initializhandles.yTion code - DO NOT EDIT


% --- Executes just before tubesEQ2 is made visible.
function tubesEQ2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdhandles.yTa  reserved - to be defined in a future version of Mhandles.yTLAB
% handles    structure with handles and user dhandles.yTa (see GUIDhandles.yTA)
% varargin   command line arguments to tubesEQ2 (see VARARGIN)

% Choose default command line output for tubesEQ2
handles.output = hObject;

% Updhandles.yTe handles structure
guidata(hObject, handles);

% UIWAIT makes tubesEQ2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = tubesEQ2_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdhandles.yTa  reserved - to be defined in a future version of Mhandles.yTLAB
% handles    structure with handles and user dhandles.yTa (see GUIDhandles.yTA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in browse.
function browse_Callback(hObject, eventdata, handles)
% hObject    handle to browse (see GCBO)
% eventdhandles.yTa  reserved - to be defined in a future version of Mhandles.yTLAB
% handles    structure with handles and user dhandles.yTa (see GUIDhandles.yTA)
[filename pathname] =uigetfile({'*.mp3;*.wav;*.wma;*.avi;*.mpg','media files (*.mp3,*.wav,*.wma,*.avi,*.mpg)';'*.*',  'All Files (*.*)'},'File Selector');
handles.fullpathname = strcat(pathname, filename);
set(handles.address, 'String', handles.fullpathname)
guidata(hObject, handles)

function play_tubesEQ1(hObject, handles)
global player;
global yT;
global Fs;
global y;
y=yT;
handles.y=y;
handles.yT=yT;
handles.Fs=Fs;
[handles.y,handles.Fs] = audioread(handles.fullpathname);
handles.Volume=get(handles.volume,'value');
%handles.y=handles.y(NewStart:end,:); 
handles.g1=get(handles.slider27,'value');
handles.g2=get(handles.slider28,'value');
handles.g3=get(handles.slider29,'value');
handles.g4=get(handles.slider30,'value');
handles.g5=get(handles.slider31,'value');
handles.g6=get(handles.slider47,'value');
handles.g7=get(handles.slider33,'value');
handles.g8=get(handles.slider34,'value');

set(handles.text19, 'String',handles.g1);
set(handles.text20, 'String',handles.g2);
set(handles.text21, 'String',handles.g3);
set(handles.text22, 'String',handles.g4);
set(handles.text23, 'String',handles.g5);
set(handles.text24, 'String',handles.g6);
set(handles.text25, 'String',handles.g7);
set(handles.text26, 'String',handles.g8);


cut_off=200; %cut off low pass dalama Hz
orde=16;
a=fir1(orde,cut_off/(handles.Fs/2),'low');
y1=handles.g1*filter(a,1,handles.y);

% %bandpass1
f1=201;
f2=400;
b1=fir1(orde,[f1/(handles.Fs/2) f2/(handles.Fs/2)],'bandpass');
y2=handles.g2*filter(b1,1,handles.y);
% 
% %bandpass2
f3=401;
f4=800;
b2=fir1(orde,[f3/(handles.Fs/2) f4/(handles.Fs/2)],'bandpass');
y3=handles.g3*filter(b2,1,handles.y);
% 
% %bandpass3
 f4=801;
f5=1500;
 b3=fir1(orde,[f4/(handles.Fs/2) f5/(handles.Fs/2)],'bandpass');
 y4=handles.g4*filter(b3,1,handles.y);
% 
% %bandpass4
 f5=1501;
f6=3000;
 b4=fir1(orde,[f5/(handles.Fs/2) f6/(handles.Fs/2)],'bandpass');
 y5=handles.g5*filter(b4,1,handles.y);
% 
% %bandpass5
  f7=3001;
f8=5000;
  b5=fir1(orde,[f7/(handles.Fs/2) f8/(handles.Fs/2)],'bandpass');
  y6=handles.g6*filter(b5,1,handles.y);
% 
% %bandpass6
  f9=5001;
f10=7000;
  b6=fir1(orde,[f9/(handles.Fs/2) f10/(handles.Fs/2)],'bandpass');
  y7=handles.g7*filter(b6,1,handles.y);
% 
% %bandpass7
  f11=7001;
f12=10000;
  b7=fir1(orde,[f11/(handles.Fs/2) f12/(handles.Fs/2)],'bandpass');
  y8=handles.g8*filter(b7,1,handles.y);

%handles.yT=y1+y2+y3+y4+y5+y6+y7;
 handles.yT=y1+y2+y3+y4+y5+y6+y7+y8;
player = audioplayer(handles.Volume*handles.yT, handles.Fs);
 subplot(2,2,1);
 plot(handles.y);
 title('Sinyal Asli');

 subplot(2,2,2);
 plot(handles.yT);
 title('Sinyal Filter');


guidata(hObject,handles)


% --- Executes on button press in play.
function play_Callback(hObject, eventdata, handles)
% hObject    handle to play (see GCBO)
% eventdhandles.yTa  reserved - to be defined in a future version of Mhandles.yTLAB
% handles    structure with handles and user dhandles.yTa (see GUIDhandles.yTA)
global player;
play_tubesEQ1(hObject, handles);
play(player);
guidata(hObject, handles)


% --- Executes on button press in pause.
function pause_Callback(hObject, eventdata, handles)
% hObject    handle to pause (see GCBO)
% eventdhandles.yTa  reserved - to be defined in a future version of Mhandles.yTLAB
% handles    structure with handles and user dhandles.yTa (see GUIDhandles.yTA)
global player;
play_tubesEQ1(hObject, handles);
pause(player);
guidata(hObject, handles)


% --- Executes on button press in resume.
function resume_Callback(hObject, eventdata, handles)
% hObject    handle to resume (see GCBO)
% eventdhandles.yTa  reserved - to be defined in a future version of Mhandles.yTLAB
% handles    structure with handles and user dhandles.yTa (see GUIDhandles.yTA)
global player;
resume(player);
guidata(hObject, handles)


% --- Executes on button press in stop.
function stop_Callback(hObject, eventdata, handles)
% hObject    handle to stop (see GCBO)
% eventdhandles.yTa  reserved - to be defined in a future version of Mhandles.yTLAB
% handles    structure with handles and user dhandles.yTa (see GUIDhandles.yTA)
global player;
play_tubesEQ1(hObject, handles);
stop(player);
guidata(hObject, handles)


% --- Executes on slider movement.
function volume_Callback(hObject, eventdata, handles)
% hObject    handle to volume (see GCBO)
% eventdhandles.yTa  reserved - to be defined in a future version of Mhandles.yTLAB
% handles    structure with handles and user dhandles.yTa (see GUIDhandles.yTA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object crehandles.yTion, after setting all properties.
function volume_CreateFcn(hObject, eventdata, handles)
% hObject    handle to volume (see GCBO)
% eventdhandles.yTa  reserved - to be defined in a future version of Mhandles.yTLAB
% handles    empty - handles not crehandles.yTed until after all Crehandles.yTeFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider27_Callback(hObject, eventdata, handles)
% hObject    handle to slider27 (see GCBO)
% eventdhandles.yTa  reserved - to be defined in a future version of Mhandles.yTLAB
% handles    structure with handles and user dhandles.yTa (see GUIDhandles.yTA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object crehandles.yTion, after setting all properties.
function slider27_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider27 (see GCBO)
% eventdhandles.yTa  reserved - to be defined in a future version of Mhandles.yTLAB
% handles    empty - handles not crehandles.yTed until after all Crehandles.yTeFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider28_Callback(hObject, eventdata, handles)
% hObject    handle to slider28 (see GCBO)
% eventdhandles.yTa  reserved - to be defined in a future version of Mhandles.yTLAB
% handles    structure with handles and user dhandles.yTa (see GUIDhandles.yTA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object crehandles.yTion, after setting all properties.
function slider28_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider28 (see GCBO)
% eventdhandles.yTa  reserved - to be defined in a future version of Mhandles.yTLAB
% handles    empty - handles not crehandles.yTed until after all Crehandles.yTeFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider29_Callback(hObject, eventdata, handles)
% hObject    handle to slider29 (see GCBO)
% eventdhandles.yTa  reserved - to be defined in a future version of Mhandles.yTLAB
% handles    structure with handles and user dhandles.yTa (see GUIDhandles.yTA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object crehandles.yTion, after setting all properties.
function slider29_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider29 (see GCBO)
% eventdhandles.yTa  reserved - to be defined in a future version of Mhandles.yTLAB
% handles    empty - handles not crehandles.yTed until after all Crehandles.yTeFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider30_Callback(hObject, eventdata, handles)
% hObject    handle to slider30 (see GCBO)
% eventdhandles.yTa  reserved - to be defined in a future version of Mhandles.yTLAB
% handles    structure with handles and user dhandles.yTa (see GUIDhandles.yTA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object crehandles.yTion, after setting all properties.
function slider30_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider30 (see GCBO)
% eventdhandles.yTa  reserved - to be defined in a future version of Mhandles.yTLAB
% handles    empty - handles not crehandles.yTed until after all Crehandles.yTeFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider31_Callback(hObject, eventdata, handles)
% hObject    handle to slider31 (see GCBO)
% eventdhandles.yTa  reserved - to be defined in a future version of Mhandles.yTLAB
% handles    structure with handles and user dhandles.yTa (see GUIDhandles.yTA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object crehandles.yTion, after setting all properties.
function slider31_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider31 (see GCBO)
% eventdhandles.yTa  reserved - to be defined in a future version of Mhandles.yTLAB
% handles    empty - handles not crehandles.yTed until after all Crehandles.yTeFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider47_Callback(hObject, eventdata, handles)
% hObject    handle to slider34 (see GCBO)
% eventdhandles.yTa  reserved - to be defined in a future version of Mhandles.yTLAB
% handles    structure with handles and user dhandles.yTa (see GUIDhandles.yTA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object crehandles.yTion, after setting all properties.
function slider47_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider34 (see GCBO)
% eventdhandles.yTa  reserved - to be defined in a future version of Mhandles.yTLAB
% handles    empty - handles not crehandles.yTed until after all Crehandles.yTeFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider33_Callback(hObject, eventdata, handles)
% hObject    handle to slider35 (see GCBO)
% eventdhandles.yTa  reserved - to be defined in a future version of Mhandles.yTLAB
% handles    structure with handles and user dhandles.yTa (see GUIDhandles.yTA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object crehandles.yTion, after setting all properties.
function slider33_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider35 (see GCBO)
% eventdhandles.yTa  reserved - to be defined in a future version of Mhandles.yTLAB
% handles    empty - handles not crehandles.yTed until after all Crehandles.yTeFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider34_Callback(hObject, eventdata, handles)
% hObject    handle to slider36 (see GCBO)
% eventdhandles.yTa  reserved - to be defined in a future version of Mhandles.yTLAB
% handles    structure with handles and user dhandles.yTa (see GUIDhandles.yTA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object crehandles.yTion, after setting all properties.
function slider34_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider36 (see GCBO)
% eventdhandles.yTa  reserved - to be defined in a future version of Mhandles.yTLAB
% handles    empty - handles not crehandles.yTed until after all Crehandles.yTeFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end







% --- Executes on button press in reverse.
function reverse_Callback(hObject, eventdata, handles)
% hObject    handle to reverse (see GCBO)
% eventdhandles.yTa  reserved - to be defined in a future version of Mhandles.yTLAB
% handles    structure with handles and user dhandles.yTa (see GUIDhandles.yTA)
[handles.y,handles.Fs] = audioread(handles.fullpathname);
sayang = flipud(handles.y);
subplot(2,2,3);
plot(sayang);
title('Reverse Sinyal A');

handles.g1=get(handles.slider27,'value');
handles.g2=get(handles.slider28,'value');
handles.g3=get(handles.slider29,'value');
handles.g4=get(handles.slider30,'value');
handles.g5=get(handles.slider31,'value');
handles.g6=get(handles.slider47,'value');
handles.g7=get(handles.slider33,'value');
handles.g8=get(handles.slider34,'value');

cut_off=200; %cut off low pass dalama Hz
orde=16;
a=fir1(orde,cut_off/(handles.Fs/2),'low');
y1=handles.g1*filter(a,1,handles.y);

% %bandpass1
f1=201;
f2=400;
b1=fir1(orde,[f1/(handles.Fs/2) f2/(handles.Fs/2)],'bandpass');
y2=handles.g2*filter(b1,1,handles.y);
% 
% %bandpass2
f3=401;
f4=800;
b2=fir1(orde,[f3/(handles.Fs/2) f4/(handles.Fs/2)],'bandpass');
y3=handles.g3*filter(b2,1,handles.y);
% 
% %bandpass3
 f4=801;
f5=1500;
 b3=fir1(orde,[f4/(handles.Fs/2) f5/(handles.Fs/2)],'bandpass');
 y4=handles.g4*filter(b3,1,handles.y);
% 
% %bandpass4
 f5=1501;
f6=3000;
 b4=fir1(orde,[f5/(handles.Fs/2) f6/(handles.Fs/2)],'bandpass');
 y5=handles.g5*filter(b4,1,handles.y);
% 
% %bandpass5
  f7=3001;
f8=5000;
  b5=fir1(orde,[f7/(handles.Fs/2) f8/(handles.Fs/2)],'bandpass');
  y6=handles.g6*filter(b5,1,handles.y);
% 
% %bandpass6
  f9=5001;
f10=7000;
  b6=fir1(orde,[f9/(handles.Fs/2) f10/(handles.Fs/2)],'bandpass');
  y7=handles.g7*filter(b6,1,handles.y);
% 
% %bandpass7
  f11=7001;
f12=10000;
  b7=fir1(orde,[f11/(handles.Fs/2) f12/(handles.Fs/2)],'bandpass');
  y8=handles.g8*filter(b7,1,handles.y);

handles.yT=y1+y2+y3+y4+y5+y6+y7+y8;
subplot(2,2,4);
cinta = flipud(handles.yT);
plot(cinta);
title('Reverse Sinyal Filter');


% --- Executes on selection change in delay.
function delay_Callback(hObject, eventdata, handles)
% hObject    handle to delay (see GCBO)
% eventdhandles.yTa  reserved - to be defined in a future version of Mhandles.yTLAB
% handles    structure with handles and user dhandles.yTa (see GUIDhandles.yTA)

% Hints: contents = cellstr(get(hObject,'String')) returns delay contents as cell array
%        contents{get(hObject,'Value')} returns selected item from delay
val=get(hObject, 'value');
global player; global Fs;
TotalTime = length(player)./Fs;
switch val
    case 1
        D=1*87000;
        player=[zeros(D,1); TotalTime ];
        
    case 2
        D=2*87000;
        player=[zeros(D,1); TotalTime ];
        
    case 3
        D=3*87000;
        player=[zeros(D,1); TotalTime ];
        
    case 4
        D=4*87000;
        player=[zeros(D,1); TotalTime ];
       
    case 5
        D=5*87000;
        player=[zeros(D,1); TotalTime ];
        
end       


% --- Executes during object crehandles.yTion, after setting all properties.
function delay_CreateFcn(hObject, eventdata, handles)
% hObject    handle to delay (see GCBO)
% eventdhandles.yTa  reserved - to be defined in a future version of Mhandles.yTLAB
% handles    empty - handles not crehandles.yTed until after all Crehandles.yTeFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in speed.
function speed_Callback(hObject, eventdata, handles)
% hObject    handle to speed (see GCBO)
% eventdhandles.yTa  reserved - to be defined in a future version of Mhandles.yTLAB
% handles    structure with handles and user dhandles.yTa (see GUIDhandles.yTA)

% Hints: contents = cellstr(get(hObject,'String')) returns speed contents as cell array
%        contents{get(hObject,'Value')} returns selected item from speed
val=get(hObject,'Value');
global Fs; 
switch val
    case 1
        Fs=50*Fs;
    case 2
        Fs=75*Fs;
    case 3
        Fs=1.0*Fs;
    case 4
        Fs=1.25*Fs;
    case 5
        Fs=1.5*Fs;
end      

% --- Executes during object crehandles.yTion, after setting all properties.
function speed_CreateFcn(hObject, eventdata, handles)
% hObject    handle to speed (see GCBO)
% eventdhandles.yTa  reserved - to be defined in a future version of Mhandles.yTLAB
% handles    empty - handles not crehandles.yTed until after all Crehandles.yTeFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in play2.
function play2_Callback(hObject, eventdata, handles)
% hObject    handle to play2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global player2;
global Fs;

[x,Fs] = audioread(handles.fullpathname2);
player2 = audioplayer(x,Fs);
play(player2);
guidata(hObject, handles)

% --- Executes on button press in pause2.
function pause2_Callback(hObject, eventdata, handles)
% hObject    handle to pause2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global player2;
pause(player2);
guidata(hObject, handles)

% --- Executes on button press in stop2.
function stop2_Callback(hObject, eventdata, handles)
% hObject    handle to stop2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global player2;
stop(player2);
guidata(hObject, handles)

% --- Executes on slider movement.
function volume2_Callback(hObject, eventdata, handles)
% hObject    handle to volume2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function volume2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to volume2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in resume2.
function resume2_Callback(hObject, eventdata, handles)
% hObject    handle to resume2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global player2;
resume(player2);
guidata(hObject, handles)

% --- Executes on button press in browse2.
function browse2_Callback(hObject, eventdata, handles)
% hObject    handle to browse2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename pathname2] =uigetfile({'*.mp3;*.wav;*.wma;*.avi;*.mpg','media files (*.mp3,*.wav,*.wma,*.avi,*.mpg)';'*.*',  'All Files (*.*)'},'File Selector');
handles.fullpathname2 = strcat(pathname2, filename);
set(handles.address2, 'String', handles.fullpathname2)
guidata(hObject, handles)
