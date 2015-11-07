%----------------------------------------------------------------
% Matlab source developed by :  Oh Kai Jie (7439970) Swinburne University of Technology Sarawak Campus
% Date :  2 Nov 2015
%
% Reference: 
%      Neefs,J & Doggen,J 2012, AcceleroMMA7361.cpp, GitHub, https://github.com/keshavsaharia/ArduinoLink/blob/master/ArduinoLink/ConnectLibraries/AcceleroMMA7361/AcceleroMMA7361.cpp
%
%----------------------------------------------------------------
%%
% Incorprating modified elements of acceleroMMA7361 - Library for retrieving data from the MMA7361 accelerometer. 
% Copyright 2011-2012 Jef Neefs (neefs@gmail.com) and Jeroen Doggen (jeroendoggen@gmail.com)
% This library is free software; you can redistribute it and/or
% modify it under the terms of the GNU Lesser General Public
% License as published by the Free Software Foundation; either
% version 2.1 of the License, or (at your option) any later version.
% This library is distributed in the hope that it will be useful,
% but WITHOUT ANY WARRANTY; without even the implied warranty of
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
% Lesser General Public License for more details.
% You should have received a copy of the GNU Lesser General Public
% License along with this library; if not, write to the Free Software
% Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
%%


%Declare begin variables for acclerometer
% /// begin variables
% /// - int sleepPin: number indicating to which pin the sleep port is attached. DIGITAL OUT
% /// - int selfTestPin: number indicating to which pin the selftest port is attached. DIGITAL OUT
% /// - int zeroGPin: number indicating to which pin the ZeroGpin is connected to. DIGITAL IN
% /// - int gSelectPin: number indication to which pin the Gselect is connected to. DIGITAL OUT
% /// - int xPin: number indicating to which pin the x-axis pin is connected to. ANALOG IN
% /// - int yPin: number indicating to which pin the y-axis  pin is connected to. ANALOG IN
% /// - int zPin: number indicating to which pin the z-axis  pin is connected to. ANALOG IN
% /// - int offset: array indicating the G offset on the x,y and z-axis
% /// When you use begin() without variables standard values are loaded: A0,A1,A2 as input for X,Y,Z 
% ///  and digital pins 13,12,11,10 for sleep, selftest, zeroG and gSelect
%%

function [sleepPin,selfTestPin,zeroGPin,gSelectPin,xPin,yPin,zPin,sleepvalue,offset0,offset1,offset2,refVoltage,average,sensi]=AcceleroBegin(a,sleep,selfTest,zeroG,gSelect,x,y,z)
    %-----Desired parameters--------------------
    sensitivelevel=0; %0 for high, 1 for low
    Reference_voltage=5; %Only 5V or 3.3V available
    averaging_number=10; %Number of datas to be averaged, default=10
    %---------------------------------------------
    %%
    pinMode(a,gSelect,'output');
    pinMode(a,sleep,'output');
    pinMode(a,selfTest,'output');
    pinMode(a,zeroG,'input');
    pinMode(a,gSelect,'output');
    digitalWrite(a,sleep,1);
    digitalWrite(a,selfTest,0);
    sleepPin = sleep;
    selfTestPin = selfTest;
    zeroGPin = zeroG;
    gSelectPin = gSelect;
    xPin = x;
    yPin = y;
    zPin = z;
    sleepvalue = false;
    [offset0,offset1,offset2]=AcceleroSetOffSets(Reference_voltage,0,0,0);
    refVoltage=AcceleroSetARefVoltage(Reference_voltage);
    average=AcceleroSetAveraging(averaging_number);
    sensi=AcceleroSetSensitivity(a,gSelect,sensitivelevel);
end
