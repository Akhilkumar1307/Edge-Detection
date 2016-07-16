function varargout = edgedetection(varargin)
% EDGEDETECTION MATLAB code for edgedetection.fig
%      EDGEDETECTION, by itself, creates a new EDGEDETECTION or raises the existing
%      singleton*.
%
%      H = EDGEDETECTION returns the handle to a new EDGEDETECTION or the handle to
%      the existing singleton*.
%
%      EDGEDETECTION('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in EDGEDETECTION.M with the given input arguments.
%
%      EDGEDETECTION('Property','Value',...) creates a new EDGEDETECTION or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before edgedetection_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to edgedetection_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help edgedetection

% Last Modified by GUIDE v2.5 01-May-2015 22:10:13

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @edgedetection_OpeningFcn, ...
                   'gui_OutputFcn',  @edgedetection_OutputFcn, ...
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


% --- Executes just before edgedetection is made visible.
function edgedetection_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to edgedetection (see VARARGIN)

% Choose default command line output for edgedetection
handles.output = hObject;
f=[1,1,1;1,-9,1;1,1,1];
handles.f=f;
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes edgedetection wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = edgedetection_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
imaqreset
vid = videoinput('winvideo', 1, 'YUY2_640x480');
src = getselectedsource(vid);
vid.ReturnedColorspace = 'rgb';
triggerconfig(vid, 'manual');
vid.FramesPerTrigger = 1;
%preview(vid);
start(vid);
    trigger(vid);
a = getdata(vid);
imshow(a);
stoppreview(vid);
imaqreset;
handles.a=a;
    guidata(hObject, handles);
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double

s=get(handles.edit1,'string');
a=imread(s);
handles.a=a;
guidata(hObject, handles);
imshow(handles.a)
% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

freqz2(handles.f)

% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[r,t,y]=size(handles.a);
if y==3
    a=handles.a;
    a1=a(:,:,1);
    a2=a(:,:,2);
    a3=a(:,:,3);
 c1=conv2(a1,handles.f,'same');   
 c2=conv2(a2,handles.f,'same');  
 c3=conv2(a3,handles.f,'same');  
 c=c1+c2+c3;

 imshow(c)
else
c=conv2(handles.a,handles.f);
handles.c=c;
guidata(hObject, handles);
imshow(handles.c)
end
% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[r,t,y]=size(handles.a);
if y==3
    a=handles.a;
    a1=a(:,:,1);
    a2=a(:,:,2);
    a3=a(:,:,3);
 c1=conv2(a1,handles.f,'same');   
 c2=conv2(a2,handles.f,'same');  
 c3=conv2(a3,handles.f,'same');  
 g(:,:,1)=c1;
 g(:,:,2)=c2;
 g(:,:,3)=c3;
 g=im2uint8(g);
 G=g+a;
 imshow(G)
else
c=conv2(handles.a,handles.f,'same');
a=handles.a;
c=im2uint8(c);

C=a+c;
imshow(C)
guidata(hObject, handles);
end