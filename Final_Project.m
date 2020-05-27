
function varargout = Final_Project(varargin)
% FINAL_PROJECT MATLAB code for Final_Project.fig
%      FINAL_PROJECT, by itself, creates a new FINAL_PROJECT or raises the existing
%      singleton*.
%
%      H = FINAL_PROJECT returns the handle to a new FINAL_PROJECT or the handle to
%      the existing singleton*.
%
%      FINAL_PROJECT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FINAL_PROJECT.M with the given input arguments.
%
%      FINAL_PROJECT('Property','Value',...) creates a new FINAL_PROJECT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Final_Project_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Final_Project_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Final_Project

% Last Modified by GUIDE v2.5 09-Dec-2018 00:41:52

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Final_Project_OpeningFcn, ...
                   'gui_OutputFcn',  @Final_Project_OutputFcn, ...
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



%-------------------------------------------------------------------------------------------

%Setting up questions as global variable in cell array.
global question 
question{1}={'1. What sweet food made by bees using nectar from flowers?'};
question{2}={'2. Name the school that Harry Potter attended?'};
question{3}={'3. Which country is home to the kangaroo?'};
question{4}={'4. Which country sent an Armada to attack Britain in 1588?'};
question{5}={'5. Saint Patrick is the Patron Saint of which country?'};
question{6}={'6. From what tree do acorns come?'};
question{7}={'7. What is the top colour in a rainbow?'};
question{8}={'8. In the nursery rhyme, who sat on a wall before having a great fall?'};
question{9}={'9. Which big country is closest to New Zealand'};
question{10}={'10. Where in Scotland is there supposedly a lake monster called Nessie?'};

% Available answers choices for each question.
global choices 
choices= {'Honey','Candy','Chocolate','Ice cream';'Harvard','Hogwarts', 'Rutgers', 'Yale';...
    'Australia','New Zealand','USA','Germany';'Ghana','Spain','Italy','India';'Ireland','China',...
    'Japan','Mars';'Pine','Red Wood','Walnut','Oak';'Blue','Orange','Red','Black';'Super Mario',...
    'Spiderman','Wall-e','Humpty Dumpty';'Japan','Russia','Australia','Indonesia';'Aberdeen',...
    'Glasgow','Aberdeenshire','Ans Loch Ness'};

% Available amount of dollars for each question.
global earned %available amount of moneys.
earned={'$100,000','$200,000','$300,000','$400,000','$500,000','$600,000','$700,000','$800,000',...
    '$900,000','$1,000,000'};

% Strings for levels from 1 to 10.
global levels 
levels={'Level 1','Level 2','Level 3','Level 4','Level 5','Level 6','Level 7','Level 8',...
    'Level 9','Level 10'};
%-------------------------------------------------------------------------------------------------------------------------------------------------
   
% --- Executes just before Final_Project is made visible.
function Final_Project_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Final_Project (see VARARGIN)

% Choose default command line output for Final_Project
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Final_Project wait for user response (see UIRESUME)
% uiwait(handles.figure1);



% --- Outputs from this function are returned to the command line.
function varargout = Final_Project_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

% All pushbuttons are disabled at first before the game starts.
set(handles.A,'Enable','off')
set(handles.B,'Enable','off')
set(handles.C,'Enable','off')
set(handles.D,'Enable','off')
set(handles.fifty_50,'Enable','off')
set(handles.ask,'Enable','off')
set(handles.phone,'Enable','off')
set(handles.textbox1,'Enable','off')



% --- Executes on button press in A.
% For questions 1,3,5 (i=1,3,5) the correct answer is A.
function A_Callback(hObject, eventdata, handles) 

% Loading the global variables.
global i
global question
global choices
global earned
global levels

%If the user answers the question correctly.
    if i==1 | i==3 | i==5 

% Sets user's answer's  background color to yellow.          
set(handles.A,'BackgroundColor','yellow'); 

% Plays audio indicating the final answer.
[final_answer,fs1]=audioread('final_answer.mp3'); 
sound(final_answer,fs1)

% waits for 3 second.
pause(3)

% If user answered correctly, the pushbutton turns to green.     
set(handles.A,'BackgroundColor','green');

% Cleans the previous sound.
clear sound

% Plays the sound indicating that the user answered correctly.
[correctSound,fs2]=audioread('correct_answer.mp3'); 
sound(correctSound,fs2)

% Waits for 3 second.
pause (3)

% Changing the all pushbuttons' background colors back to original colors. 
handles.A.BackgroundColor=[0.94 0.94 0.94];
handles.B.BackgroundColor=[0.94 0.94 0.94];
handles.C.BackgroundColor=[0.94 0.94 0.94];
handles.D.BackgroundColor=[0.94 0.94 0.94];

% In case if 50/50 lifeline used by the player this code re-enables the...
% answer push buttons for the next iteration.
set(handles.A,'Enable','on')
set(handles.B,'Enable','on')
set(handles.C,'Enable','on')
set(handles.D,'Enable','on')

% Proceeds to the next question.
set(handles.textbox1,'String',question{i+1}); 

% Shows the new amount earned after answering correctly (Display Textbox).
set(handles.money,'String',earned{i}); 

% Changes the current level to the next level (Display TextBox).
set(handles.level,'String',levels{i+1}); 


% Brings the answer options choices for the next question.
set(handles.A,'String',choices{i+1,1})
set(handles.B,'String',choices{i+1,2})
set(handles.C,'String',choices{i+1,3})
set(handles.D,'String',choices{i+1,4})

% Change of global variable i to the next iteration.
i=i+1; 

% If player selects a wrong answer.
    else 
        
% Sets user's answer's background color to yellow.          
set(handles.A,'BackgroundColor','yellow'); 

% Plays audio indicating the final answer.
[final_answer,fs1]=audioread('final_answer.mp3'); 
sound(final_answer,fs1)

% waits for 3 second.
pause(3)

% If user answered wrong, the pushbutton turns to red.     
set(handles.A,'BackgroundColor','red');

% Cleans the previous sound.
clear sound

% Plays the sound indicating that the user answered wrong.
[wrong_answer,fs2]=audioread('wrong_answer.mp3'); 
sound(wrong_answer,fs2)

% shows a messagebox indicating amount earned.
myicon=imread('game_over.jpg');
message=['You won= ', handles.money.String,' !'];
msgbox({message;'';'You can do better!'},'Game is Over!','custom',myicon)

% waits for 5 second.
pause(5)

% Changing the all pushbuttons' background colors back to original colors. 
handles.A.BackgroundColor=[0.94 0.94 0.94];
handles.B.BackgroundColor=[0.94 0.94 0.94];
handles.C.BackgroundColor=[0.94 0.94 0.94];
handles.D.BackgroundColor=[0.94 0.94 0.94];

% Changing the all pushbuttons' strings back to original strings. 
set(handles.A,'String','')
set(handles.B,'String','')
set(handles.C,'String','')
set(handles.D,'String','')

% Changing the all textboxes' strings back to original strings. 
set(handles.money,'String','$0');
set(handles.level,'String',levels{1});
set(handles.textbox1,'String','');

% Disables all the pushbuttons.
set(handles.A,'Enable','off')
set(handles.B,'Enable','off')
set(handles.C,'Enable','off')
set(handles.D,'Enable','off')
set(handles.fifty_50,'Enable','off')
set(handles.ask,'Enable','off')
set(handles.phone,'Enable','off')
set(handles.textbox1,'Enable','off')

% Goes back to first iteration.
i=1;

end
% hObject    handle to A (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)




% --- Executes on button press in B.
% For questions 2,4 the correct answer is B.
function B_Callback(hObject, eventdata, handles)

% Loading the global variables.
global i
global question
global choices
global earned
global levels

% If the player answers the question correctly.
if i==2 | i==4
  
% Sets user's answer's  background color to yellow.          
set(handles.B,'BackgroundColor','yellow'); 

% Plays audio indicating the final answer.
[final_answer,fs1]=audioread('final_answer.mp3'); 
sound(final_answer,fs1)

% waits for 3 second.
pause(3)

% If user answered correctly, the pushbutton turns to green.     
set(handles.B,'BackgroundColor','green');

% Cleans the previous sound.
clear sound

% Plays the sound indicating that the user answered correctly.
[correctSound,fs2]=audioread('correct_answer.mp3'); 
sound(correctSound,fs2)

% Waits for 3 second.
pause (3)

% Changing the all pushbuttons' background colors back to original colors. 
handles.A.BackgroundColor=[0.94 0.94 0.94];
handles.B.BackgroundColor=[0.94 0.94 0.94];
handles.C.BackgroundColor=[0.94 0.94 0.94];
handles.D.BackgroundColor=[0.94 0.94 0.94];

% In case if 50/50 lifeline used by the player this code re-enables the...
% answer push buttons for the next iteration.
set(handles.A,'Enable','on')
set(handles.B,'Enable','on')
set(handles.C,'Enable','on')
set(handles.D,'Enable','on')

% Proceeds to the next question.
set(handles.textbox1,'String',question{i+1}); 

% Shows the new amount earned after answering correctly (Display Textbox).
set(handles.money,'String',earned{i}); 

% Changes the current level to the next level (Display TextBox).
set(handles.level,'String',levels{i+1}); 


% Brings the answer options choices for the next question.
set(handles.A,'String',choices{i+1,1})
set(handles.B,'String',choices{i+1,2})
set(handles.C,'String',choices{i+1,3})
set(handles.D,'String',choices{i+1,4})

% Change of global variable i to the next iteration.
i=i+1; 

% If player selects a wrong answer.
    else 
        
% Sets user's answer's background color to yellow.          
set(handles.B,'BackgroundColor','yellow'); 

% Plays audio indicating the final answer.
[final_answer,fs1]=audioread('final_answer.mp3'); 
sound(final_answer,fs1)

% waits for 3 second.
pause(3)

% If user answered wrong, the pushbutton turns to red.     
set(handles.B,'BackgroundColor','red');

% Cleans the previous sound.
clear sound

% Plays the sound indicating that the user answered wrong.
[wrong_answer,fs2]=audioread('wrong_answer.mp3'); 
sound(wrong_answer,fs2)

% shows a messagebox indicating amount earned.
myicon=imread('game_over.jpg');
message=['You won= ', handles.money.String,' !'];
msgbox({message;'';'Aim for 1 million!'},'Game is Over!','custom',myicon)

% waits for 5 second.
pause(5)

% Changing the all pushbuttons' background colors back to original colors. 
handles.A.BackgroundColor=[0.94 0.94 0.94];
handles.B.BackgroundColor=[0.94 0.94 0.94];
handles.C.BackgroundColor=[0.94 0.94 0.94];
handles.D.BackgroundColor=[0.94 0.94 0.94];

% Changing the all pushbuttons' strings back to original strings. 
set(handles.A,'String','')
set(handles.B,'String','')
set(handles.C,'String','')
set(handles.D,'String','')

% Changing the all textboxes' strings back to original strings. 
set(handles.money,'String','$0');
set(handles.level,'String',levels{1});
set(handles.textbox1,'String','');

% Disables all the pushbuttons.
set(handles.A,'Enable','off')
set(handles.B,'Enable','off')
set(handles.C,'Enable','off')
set(handles.D,'Enable','off')
set(handles.fifty_50,'Enable','off')
set(handles.ask,'Enable','off')
set(handles.phone,'Enable','off')
set(handles.textbox1,'Enable','off')

% Goes back to first iteration.
i=1;

end
% hObject    handle to B (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in C. 
% For questions 7,9 the correct answer is C.
function C_Callback(hObject, eventdata, handles)

%Loading global variables.
global i
global question
global choices
global earned
global levels

% If player selects the correct answer.
if i==7 | i==9

% Sets user's answer's  background color to yellow.          
set(handles.C,'BackgroundColor','yellow'); 

% Plays audio indicating the final answer.
[final_answer,fs1]=audioread('final_answer.mp3'); 
sound(final_answer,fs1)

% waits for 3 second.
pause(3)

% If user answered correctly, the pushbutton turns to green.     
set(handles.C,'BackgroundColor','green');

% Cleans the previous sound.
clear sound

% Plays the sound indicating that the user answered correctly.
[correctSound,fs2]=audioread('correct_answer.mp3'); 
sound(correctSound,fs2)

% Waits for 3 second.
pause (3)

% Changing the all pushbuttons' background colors back to original colors. 
handles.A.BackgroundColor=[0.94 0.94 0.94];
handles.B.BackgroundColor=[0.94 0.94 0.94];
handles.C.BackgroundColor=[0.94 0.94 0.94];
handles.D.BackgroundColor=[0.94 0.94 0.94];

% In case if 50/50 lifeline used by the player this code re-enables the...
% answer push buttons for the next iteration.
set(handles.A,'Enable','on')
set(handles.B,'Enable','on')
set(handles.C,'Enable','on')
set(handles.D,'Enable','on')

% Proceeds to the next question.
set(handles.textbox1,'String',question{i+1}); 

% Shows the new amount earned after answering correctly (Display Textbox).
set(handles.money,'String',earned{i}); 

% Changes the current level to the next level (Display TextBox).
set(handles.level,'String',levels{i+1}); 


% Brings the answer options choices for the next question.
set(handles.A,'String',choices{i+1,1})
set(handles.B,'String',choices{i+1,2})
set(handles.C,'String',choices{i+1,3})
set(handles.D,'String',choices{i+1,4})

% Change of global variable i to the next iteration.
i=i+1; 

% If player selects a wrong answer.
    else 
        
% Sets user's answer's background color to yellow.          
set(handles.C,'BackgroundColor','yellow'); 

% Plays audio indicating the final answer.
[final_answer,fs1]=audioread('final_answer.mp3'); 
sound(final_answer,fs1)

% waits for 3 second.
pause(3)

% If user answered wrong, the pushbutton turns to red.     
set(handles.C,'BackgroundColor','red');

% Cleans the previous sound.
clear sound

% Plays the sound indicating that the user answered wrong.
[wrong_answer,fs2]=audioread('wrong_answer.mp3'); 
sound(wrong_answer,fs2)

% shows a messagebox indicating amount earned.
myicon=imread('game_over.jpg');
message=['You won= ', handles.money.String,' !'];
msgbox({message;'';'Try harder next time!'},'Game is Over!','custom',myicon)

% waits for 5 second.
pause(5)

% Changing the all pushbuttons' background colors back to original colors. 
handles.A.BackgroundColor=[0.94 0.94 0.94];
handles.B.BackgroundColor=[0.94 0.94 0.94];
handles.C.BackgroundColor=[0.94 0.94 0.94];
handles.D.BackgroundColor=[0.94 0.94 0.94];

% Changing the all pushbuttons' strings back to original strings. 
set(handles.A,'String','')
set(handles.B,'String','')
set(handles.C,'String','')
set(handles.D,'String','')

% Changing the all textboxes' strings back to original strings. 
set(handles.money,'String','$0');
set(handles.level,'String',levels{1});
set(handles.textbox1,'String','');

% Disables all the pushbuttons.
set(handles.A,'Enable','off')
set(handles.B,'Enable','off')
set(handles.C,'Enable','off')
set(handles.D,'Enable','off')
set(handles.fifty_50,'Enable','off')
set(handles.ask,'Enable','off')
set(handles.phone,'Enable','off')
set(handles.textbox1,'Enable','off')

% Goes back to first iteration.
i=1;

end
% hObject    handle to C (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in D. 
% For questions 6,8,10 the correct answer is D.
function D_Callback(hObject, eventdata, handles)

%Loading global variables
global i
global question
global choices
global earned
global levels

% If the player answers correctly.
    if i==6 | i==8
  
% Sets user's answer's  background color to yellow.          
set(handles.D,'BackgroundColor','yellow'); 

% Plays audio indicating the final answer.
[final_answer,fs1]=audioread('final_answer.mp3'); 
sound(final_answer,fs1)

% waits for 3 second.
pause(3)

% If user answered correctly, the pushbutton turns to green.     
set(handles.D,'BackgroundColor','green');

% Cleans the previous sound.
clear sound

% Plays the sound indicating that the user answered correctly.
[correctSound,fs2]=audioread('correct_answer.mp3'); 
sound(correctSound,fs2)

% Waits for 3 second.
pause (3)

% Changing the all pushbuttons' background colors back to original colors. 
handles.A.BackgroundColor=[0.94 0.94 0.94];
handles.B.BackgroundColor=[0.94 0.94 0.94];
handles.C.BackgroundColor=[0.94 0.94 0.94];
handles.D.BackgroundColor=[0.94 0.94 0.94];

% In case if 50/50 lifeline used by the player this code re-enables the...
% answer push buttons for the next iteration.
set(handles.A,'Enable','on')
set(handles.B,'Enable','on')
set(handles.C,'Enable','on')
set(handles.D,'Enable','on')

% Proceeds to the next question.
set(handles.textbox1,'String',question{i+1}); 

% Shows the new amount earned after answering correctly (Display Textbox).
set(handles.money,'String',earned{i}); 

% Changes the current level to the next level (Display TextBox).
set(handles.level,'String',levels{i+1}); 


% Brings the answer options choices for the next question.
set(handles.A,'String',choices{i+1,1})
set(handles.B,'String',choices{i+1,2})
set(handles.C,'String',choices{i+1,3})
set(handles.D,'String',choices{i+1,4})

% Change of global variable i to the next iteration.
i=i+1; 

% If player answers million dollar question correctly.
    elseif i==10

% Sets user's answer's  background color to yellow.          
set(handles.D,'BackgroundColor','yellow'); 

% Plays audio indicating the final answer.
[final_answer,fs1]=audioread('final_answer.mp3'); 
sound(final_answer,fs1)

% waits for 3 second.
pause(3)

% If user answered correctly, the pushbutton turns to green.     
set(handles.D,'BackgroundColor','green');

% Waits 0.5 seconds.
pause(0.5)

% Cleans the previous sound.
clear sound

% Plays the sound indicating that the user answered correctly.
[correctSound,fs2]=audioread('winner.mp3'); 
sound(correctSound,fs2)

% 1 million dollars shows on the string of money textbox.
set(handles.money,'String','$1,000,000')

% Displays a pop-up message
myicon1=imread('million_icon.jpg');
million_pic=imread('million_pic.jpg');
imshow(million_pic)
msgbox({'Congratulations!';'';'You just won a Million Dollars!'},'Game is Over!','custom',myicon1)

% waits for 5 second.
pause(5)

% Changing the all pushbuttons' background colors back to original colors. 
handles.A.BackgroundColor=[0.94 0.94 0.94];
handles.B.BackgroundColor=[0.94 0.94 0.94];
handles.C.BackgroundColor=[0.94 0.94 0.94];
handles.D.BackgroundColor=[0.94 0.94 0.94];

% Changing the all pushbuttons' strings back to original strings. 
set(handles.A,'String','')
set(handles.B,'String','')
set(handles.C,'String','')
set(handles.D,'String','')

% Changing the all textboxes' strings back to original strings. 
set(handles.money,'String','$0');
set(handles.level,'String',levels{1});
set(handles.textbox1,'String','');

% Disables all the pushbuttons.
set(handles.A,'Enable','off')
set(handles.B,'Enable','off')
set(handles.C,'Enable','off')
set(handles.D,'Enable','off')
set(handles.fifty_50,'Enable','off')
set(handles.ask,'Enable','off')
set(handles.phone,'Enable','off')
set(handles.textbox1,'Enable','off')

% Goes back to first iteration.
i=1;


% If player selects a wrong answer.
    else 
        
% Sets user's answer's background color to yellow.          
set(handles.D,'BackgroundColor','yellow'); 

% Plays audio indicating the final answer.
[final_answer,fs1]=audioread('final_answer.mp3'); 
sound(final_answer,fs1)

% waits for 3 second.
pause(3)

% If user answered wrong, the pushbutton turns to red.     
set(handles.D,'BackgroundColor','red');

% Cleans the previous sound.
clear sound

% Plays the sound indicating that the user answered wrong.
[wrong_answer,fs2]=audioread('wrong_answer.mp3'); 
sound(wrong_answer,fs2)

% shows a messagebox indicating amount earned.
myicon=imread('game_over.jpg');
message=['You won= ', handles.money.String,' !'];
msgbox({message;'';'Try harder next time!'},'Game is Over!','custom',myicon)

% waits for 5 second.
pause(5)

% Changing the all pushbuttons' background colors back to original colors. 
handles.A.BackgroundColor=[0.94 0.94 0.94];
handles.B.BackgroundColor=[0.94 0.94 0.94];
handles.C.BackgroundColor=[0.94 0.94 0.94];
handles.D.BackgroundColor=[0.94 0.94 0.94];

% Changing the all pushbuttons' strings back to original strings. 
set(handles.A,'String','')
set(handles.B,'String','')
set(handles.C,'String','')
set(handles.D,'String','')

% Changing the all textboxes' strings back to original strings. 
set(handles.money,'String','$0');
set(handles.level,'String',levels{1});
set(handles.textbox1,'String','');

% Disables all the pushbuttons.
set(handles.A,'Enable','off')
set(handles.B,'Enable','off')
set(handles.C,'Enable','off')
set(handles.D,'Enable','off')
set(handles.fifty_50,'Enable','off')
set(handles.ask,'Enable','off')
set(handles.phone,'Enable','off')
set(handles.textbox1,'Enable','off')

% Goes back to first iteration.
i=1;

end

% hObject    handle to D (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)





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




% --- Executes on button press in fifty_50.
function fifty_50_Callback(hObject, eventdata, handles)

% Loading global variables.
global i
global question
global choices
global earned
global levels

% Plays audio
[soundData,fs]=audioread('life_line.mp3');
sound(soundData,fs)

% Switch case statement to eliminate choices for each question.

switch i 
    case 1
         set(handles.B,'Enable','off') % disables choice B and etc.
         set(handles.D,'Enable','off')
    case 2
        set(handles.C,'Enable','off')
        set(handles.D,'Enable','off')
    case 3
        set(handles.B,'Enable','off')
        set(handles.C,'Enable','off')
    case 4
        set(handles.A,'Enable','off')
        set(handles.C,'Enable','off')
    case 5
        set(handles.B,'Enable','off')
        set(handles.D,'Enable','off')
    case 6
        set(handles.A,'Enable','off')
        set(handles.B,'Enable','off')
    case 7
        set(handles.A,'Enable','off') 
        set(handles.B,'Enable','off')
    case 8
        set(handles.A,'Enable','off')
        set(handles.C,'Enable','off')
    case 9
        set(handles.B,'Enable','off')
        set(handles.D,'Enable','off')
    case 10
        set(handles.B,'Enable','off')
        set(handles.C,'Enable','off')
end

% Locks this life-line to avoid future use.
        set(handles.fifty_50,'Enable','off')

% hObject    handle to fifty_50 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



% --- Executes on button press in ask.
function ask_Callback(hObject, eventdata, handles)
% Loading global variable i.
global i

% Plays audio
[soundData1,fs1]=audioread('ask_people.mp3');
sound(soundData1,fs1)

% Flashing the color of all pushbuttons before the percentages for each
%answer shows up.
%-------------------------------------------
pause(0.5)
set(handles.A,'BackgroundColor','blue');
set(handles.B,'BackgroundColor','blue');
set(handles.C,'BackgroundColor','blue');
set(handles.D,'BackgroundColor','blue');
pause(0.5)
handles.A.BackgroundColor=[0.94 0.94 0.94];
handles.B.BackgroundColor=[0.94 0.94 0.94];
handles.C.BackgroundColor=[0.94 0.94 0.94];
handles.D.BackgroundColor=[0.94 0.94 0.94];
pause(0.5)
set(handles.A,'BackgroundColor','blue');
set(handles.B,'BackgroundColor','blue');
set(handles.C,'BackgroundColor','blue');
set(handles.D,'BackgroundColor','blue');
pause(0.5)
handles.A.BackgroundColor=[0.94 0.94 0.94];
handles.B.BackgroundColor=[0.94 0.94 0.94];
handles.C.BackgroundColor=[0.94 0.94 0.94];
handles.D.BackgroundColor=[0.94 0.94 0.94];
%------------------------------------------------

%Waits for 2 seconds.
pause(2)

% Plays audio
[soundData,fs]=audioread('life_line.mp3');
sound(soundData,fs)

% Switch case for bringing percentages for each answer in a message box.
switch i 
    case 1
        
        msgbox('A=98% B=1% C=0.3% D=0.7%','Results');
    case 2
        msgbox('A=8% B=86% C=7% D=3%','Results');
    case 3
        msgbox('A=94% B=3% C=1% D=2%','Results');
    case 4
        msgbox('A=23% B=62% C=10% D=5%','Results');
    case 5
        msgbox('A=92% B=4% C=3% D=1%','Results');
    case 6
        msgbox('A=8% B=4% C=4% D=84%','Results');
    case 7
        msgbox('A=10% B=3% C=72% D=15%','Results');
    case 8
        msgbox('A=2% B=2% C=2% D=94%','Results');
    case 9
        msgbox('A=1.8% B=0.2% C=88% D=10%','Results');
    case 10
        msgbox('A=32% B=28% C=22% D=18%','Results');
end

% Locks this life-line to avoid future use.
set(handles.ask,'Enable','off')
        
% hObject    handle to ask (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



% --- Executes on button press in phone.
% This button phones the genuis which assumes the question is answered
% right and proceeds to the next iteration directly.
function phone_Callback(hObject, eventdata, handles)

% Loading global variables.
global i
global question
global choices
global earned
global levels

% if the user at the 10th question and wants to use this lifeline:
if i==10
    % Sets user's answer's  background color to yellow.          
set(handles.D,'BackgroundColor','yellow'); 

% Plays audio indicating the final answer.
[final_answer,fs1]=audioread('final_answer.mp3'); 
sound(final_answer,fs1)

% waits for 3 second.
pause(3)

% If user answered correctly, the pushbutton turns to green.     
set(handles.D,'BackgroundColor','green');

% Waits 0.5 seconds.
pause(0.5)

% Cleans the previous sound.
clear sound

% Plays the sound indicating that the user answered correctly.
[correctSound,fs2]=audioread('winner.mp3'); 
sound(correctSound,fs2)

% 1 million dollars shows on the string of money textbox.
set(handles.money,'String','$1,000,000')

% Displays a pop-up message
myicon1=imread('million_icon.jpg');
million_pic=imread('million_pic.jpg');
imshow(million_pic)
msgbox({'Congratulations!';'';'You just won a Million Dollars!'},'Game is Over!','custom',myicon1)

% waits for 5 second.
pause(5)

% Changing the all pushbuttons' background colors back to original colors. 
handles.A.BackgroundColor=[0.94 0.94 0.94];
handles.B.BackgroundColor=[0.94 0.94 0.94];
handles.C.BackgroundColor=[0.94 0.94 0.94];
handles.D.BackgroundColor=[0.94 0.94 0.94];

% Changing the all pushbuttons' strings back to original strings. 
set(handles.A,'String','')
set(handles.B,'String','')
set(handles.C,'String','')
set(handles.D,'String','')

% Changing the all textboxes' strings back to original strings. 
set(handles.money,'String','$0');
set(handles.level,'String',levels{1});
set(handles.textbox1,'String','');

% Disables all the pushbuttons.
set(handles.A,'Enable','off')
set(handles.B,'Enable','off')
set(handles.C,'Enable','off')
set(handles.D,'Enable','off')
set(handles.fifty_50,'Enable','off')
set(handles.ask,'Enable','off')
set(handles.phone,'Enable','off')
set(handles.textbox1,'Enable','off')

% Goes back to first iteration.
i=1;

else

% Plays audio
[soundData,fs]=audioread('life_line.mp3');
sound(soundData,fs)

% waits for 2 seconds
pause(2)

% Proceeding the next iteration (question).

set(handles.textbox1,'String',question{i+1});
set(handles.money,'String',earned{i+1});
set(handles.level,'String',levels{i+1});
set(handles.A,'String',choices{i+1,1});
set(handles.B,'String',choices{i+1,2});
set(handles.C,'String',choices{i+1,3});
set(handles.D,'String',choices{i+1,4});

% In case if 50/50 lifeline used by the player this code re-enables the...
% answer push buttons for the next iteration.
set(handles.A,'Enable','on')
set(handles.B,'Enable','on')
set(handles.C,'Enable','on')
set(handles.D,'Enable','on')
 
% next iteration i.
i=i+1;

% Locks this life-line to avoid future use.
 set(handles.phone,'Enable','off')
end

% hObject    handle to phone (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



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




function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double


% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in textbox1.
function textbox1_Callback(hObject, eventdata, handles)
% hObject    handle to textbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in gamestart.
function gamestart_Callback(hObject, eventdata, handles)
% Load global variable.
global i
global question
global choices
global levels

% Initializes iteration (question) to 1.
i=1;

% Enables all the Push Buttons.
set(handles.A,'Enable','on')
set(handles.B,'Enable','on')
set(handles.C,'Enable','on')
set(handles.D,'Enable','on')
set(handles.fifty_50,'Enable','on')
set(handles.ask,'Enable','on')
set(handles.phone,'Enable','on')
set(handles.textbox1,'Enable','on')


% Setting strings accordingly to the global variable i.
set(handles.textbox1,'String',question{i})
set(handles.A,'String',choices{i,1})
set(handles.B,'String',choices{i,2})
set(handles.C,'String',choices{i,3})
set(handles.D,'String',choices{i,4})
set(handles.money,'String','$0');
set(handles.level,'String',levels{i});

% Plays opening sound.
[soundData,fs]=audioread('next_question.mp3');
sound(soundData,fs);

% Changes background image.
imshow('template_mil.jpeg')

% Waits for 6 seconds.
pause(6)

% Clears the sound
clear sound



% hObject    handle to gamestart (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes during object creation, after setting all properties.
function money2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to money2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function axes4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes4
axes(hObject)
template=imread('template_mil.jpeg');
imshow('')
