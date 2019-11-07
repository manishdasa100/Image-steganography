function varargout = encode(varargin)
% ENCODE MATLAB code for encode.fig
%      ENCODE, by itself, creates a new ENCODE or raises the existing
%      singleton*.
%
%      H = ENCODE returns the handle to a new ENCODE or the handle to
%      the existing singleton*.
%
%      ENCODE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ENCODE.M with the given input arguments.
%
%      ENCODE('Property','Value',...) creates a new ENCODE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before encode_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to encode_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help encode

% Last Modified by GUIDE v2.5 08-Jun-2019 14:29:35

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @encode_OpeningFcn, ...
                   'gui_OutputFcn',  @encode_OutputFcn, ...
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


% --- Executes just before encode is made visible.
function encode_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to encode (see VARARGIN)

% Choose default command line output for encode
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes encode wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = encode_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;




% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
msgbox('Thank you            --Victor and Manish');
pause(3);
close();
close();


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
decode;
close(encode);


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename ,pathname] = uigetfile({'*.jpg';'*.png';'*.tif';'*.jpeg'},'File Selector');
image = strcat(pathname,filename);
axes(handles.axes1)
imshow(image);
setappdata(0,'image_original',image);


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filenamepb4 ,pathnamepb4] = uigetfile({'*.txt'},'File Selector');
textfile = strcat(pathnamepb4,filenamepb4);
text = fileread(textfile);
setappdata(0,'text_original',text);
set(handles.textfile_text,'string',text);
set(handles.edit1,'string',filenamepb4);
set(handles.edit2,'string',pathnamepb4);



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


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
image_orig = getappdata(0,'image_original');
work_image = imread(image_orig);

% figure,
% imshow(work_image);title('Original image')

image_red = work_image(:,:,1);
image_green = work_image(:,:,2);
image_blue = work_image(:,:,3);

work_text = getappdata(0,'text_original');

% disp(class(work_text));

encodeingFcn(image_red,image_green,image_blue,work_text,handles);

function textfile_text_Callback(hObject, eventdata, handles)
% hObject    handle to textfile_text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of textfile_text as text
%        str2double(get(hObject,'String')) returns contents of textfile_text as a double


% --- Executes during object creation, after setting all properties.
function textfile_text_CreateFcn(hObject, eventdata, handles)
% hObject    handle to textfile_text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function encodeingFcn(image_red,image_green,image_blue,msg,handles)
ascii_values = uint8(msg);
disp(ascii_values)

binary_msg = dec2bin(ascii_values);
binary_msg = binary_msg(:);
binary_msg = str2num(binary_msg);
binary_msg_working = reshape(binary_msg,length(msg),7);
disp(binary_msg_working)

plane1 = bitget(image_blue,1);
plane2 = bitget(image_blue,2);
plane3 = bitget(image_blue,3);
plane4 = bitget(image_blue,4);
plane5 = bitget(image_blue,5);
plane6 = bitget(image_blue,6);
plane7 = bitget(image_blue,7);
plane8 = bitget(image_blue,8);


d1 = plane1;
d2 = plane2;
d3 = plane3;
d4 = plane4;
d5 = plane5;
d6 = plane6;
d7 = plane7;

[m, n ,p] = size(plane1);


% for i=1:m
%     for j=1:n

%encoding for plane1
for i=1:m
    for j=1:n
        if j<=length(msg)
            LSB = binary_msg_working(:,7);
            plane1(i,j) = xor(plane1(i,j),LSB(j));
        end
    end
end


%encoding for plane2
for i=1:m
    for j=1:n
        if j<=length(msg)
            Bit = binary_msg_working(:,6);
            plane2(i,j) = xor(plane2(i,j),Bit(j));
        end
    end
end

%encoding for plane3
for i=1:m
    for j=1:n
        if j<=length(msg)
            Bit = binary_msg_working(:,5);
            plane3(i,j) = xor(plane3(i,j),Bit(j));
        end
    end
end


%encoding for plane4
for i=1:m
    for j=1:n
        if j<=length(msg)
            Bit = binary_msg_working(:,4);
            plane4(i,j) = xor(plane4(i,j),Bit(j));
        end
    end
end


%encoding for plane5
for i=1:m
    for j=1:n
        if j<=length(msg)
            Bit = binary_msg_working(:,3);
            plane5(i,j) = xor(plane5(i,j),Bit(j));
        end
    end
end


%encoding for plane6
for i=1:m
    for j=1:n
        if j<=length(msg)
            Bit = binary_msg_working(:,2);
            plane6(i,j) = xor(plane6(i,j),Bit(j));
        end
    end
end


%encoding for plane7
for i=1:m
    for j=1:n
        if j<=length(msg)
            Bit = binary_msg_working(:,1);
            plane7(i,j) = xor(plane7(i,j),Bit(j));
        end
    end
end

reconstructed_image = plane8.*2^7 + plane7.*2^6 + plane6.*2^5 + plane5.*2^4 + plane4.*2^3 + plane3.*2^2 + plane2.*2^1 + plane1.*2^0;


reconstructed_image_RGB = cat(3,image_red,image_green,reconstructed_image);

axes(handles.axes2)
imshow(reconstructed_image_RGB)

imwrite(reconstructed_image_RGB,'staganographed_image.tif');
