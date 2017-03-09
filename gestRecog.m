clc;
clear all;
s=serial('COM3');
set(s,'Baudrate',115200);
fopen(s);
x=1;
y=zeros(1,1000);
y2=zeros(20,1000);
load('F:\Sachin\projects\gestExample.mat','y1')
d=200:10:320;
x3=1;
    while 1   
    if x>999
        y2(x3,:)=y;
       disp('helllloooo');
       disp(y2(x3,:));
       disp(x3);
       
       for j=1:12
        d(j)=dtw(y1(j,:),y2(x3,:));
       end
       k=find(d==min(d));
       if k<=5 & k~=1
           disp('Circleeeeeeeeee');
       elseif k>5 & k<=10
           disp('Rectangleeeeee');
       elseif k==1 | k==11
           disp('NOTHINGGGGGGGGGGGG');
       else
           disp('Could Not Detect, TRY AGAIN');
       end
       x3=x3+1;
       x=1; 
       y2(x3,:)=smooth(y2(x3,:));
    end
    
    try
        y(x)=fscanf(s,'%f');
    catch
        disp(x);
        y(x)=0;
    end
    x=x+1;
    end
