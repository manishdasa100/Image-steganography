function varargout = decode(varargin)
% DECODE MATLAB code for decode.fig
%      DECODE, by itself, creates a new DECODE or raises the existing
%      singleton*.
%
%      H = DECODE returns the handle to a new DECODE or the handle to
%      the existing singleton*.
%
%      DECODE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in DECODE.M with the given input arguments.
%
%      DECODE('Property','Value',...) creates a new DECODE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before decode_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to decode_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help decode

% Last Modified by GUIDE v2.5 09-Jun-2019 13:25:21

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @decode_OpeningFcn, ...
                   'gui_OutputFcn',  @decode_OutputFcn, ...
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


% --- Executes just before decode is made visible.
function decode_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to decode (see VARARGIN)

% Choose default command line output for decode
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes decode wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = decode_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


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


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
password_image = getappdata(0,'image_passowrd');
%disp(size(password_image))
password_image_blue = password_image(:,:,3);
staganographed_image = getappdata(0,'image_staganographed');
%disp(size(staganographed_image))
staganographed_image_blue = staganographed_image(:,:,3);
decodingFcn(password_image_blue,staganographed_image_blue,handles);



% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename ,pathname] = uigetfile({'*.jpg';'*.png';'*.tif';'*.jpeg'},'File Selector');
image = strcat(pathname,filename);
axes(handles.axes1)
imshow(image);
s_image = imread(image);
setappdata(0,'image_staganographed',s_image);



% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename ,pathname] = uigetfile({'*.jpg';'*.png';'*.tif';'*.jpeg'},'File Selector');
image_p = strcat(pathname,filename);
axes(handles.axes2)
imshow(image_p);
p_image = imread(image_p);
setappdata(0,'image_passowrd',p_image);

function decodingFcn(password_image,staganographed_image,handles)
plane1  = bitget(staganographed_image,1);
plane2 = bitget(staganographed_image,2);
plane3 = bitget(staganographed_image,3);
plane4 = bitget(staganographed_image,4);
plane5 = bitget(staganographed_image,5);
plane6 = bitget(staganographed_image,6);
plane7 = bitget(staganographed_image,7);
plane8 = bitget(staganographed_image,8);

[m, n, p] = size(plane1);

d1 = bitget(password_image,1);
d2 = bitget(password_image,2);
d3 = bitget(password_image,3);
d4 = bitget(password_image,4);
d5 = bitget(password_image,5);
d6 = bitget(password_image,6);
d7 = bitget(password_image,7);

tc = 0;
for i=1:m
    for j=1:n
        if plane1(i,j) ~= d1(i,j)
           tc = j;
        end
    end
end
for i=1:m
    for j=1:n
        if j<=tc
            c1(j) = xor(d1(i,j),plane1(i,j));
        end
    end
end
% 
% %decoding for plane2
for i=1:m
    for j=1:n
        if j<=tc
            c2(j) = xor(d2(i,j),plane2(i,j));
        end
    end
end
% 
% %decoding for plane3
for i=1:m
    for j=1:n
        if j<=tc
            c3(j) = xor(d3(i,j),plane3(i,j));
        end
    end
end
% 
% %decoding for plane4
for i=1:m
    for j=1:n
        if j<=tc
            c4(j) = xor(d4(i,j),plane4(i,j));
        end
    end
end
% 
% %decoding for plane5
for i=1:m
    for j=1:n
        if j<=tc
            c5(j) = xor(d5(i,j),plane5(i,j));
        end
    end
end
% 
% %decoding for plane6
for i=1:m
    for j=1:n
        if j<=tc
            c6(j) = xor(d6(i,j),plane6(i,j));
        end
    end
end
% 
% 
% %decoding for plane7
for i=1:m
    for j=1:n
        if j<=tc
            c7(j) = xor(d7(i,j),plane7(i,j));
        end
    end
end

decoded_array = [c7;c6;c5;c4;c3;c2;c1];
decoded_array = transpose(decoded_array);
decoded_array = num2str(decoded_array);
decoded_msg_ascii = bin2dec(decoded_array);
decoded_msg = char(decoded_msg_ascii);
deco = transpose(decoded_msg);

disp(deco)

set(handles.edit1,'string',deco);
