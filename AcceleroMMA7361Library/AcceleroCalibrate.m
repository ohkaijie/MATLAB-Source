%----------------------------------------------------------------
% Matlab source by :  Oh Kai Jie (7439970) Swinburne University
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


function [offset0, offset1, offset2]=AcceleroCalibrate(a,xPin,yPin,zPin,offset0,offset1,offset2,average,sensi)
    AcceleroGetOrientation(a,xPin,yPin,zPin,offset0,offset1,offset2,average)
    fprintf('\nCalibrating MMA7361011.....');
    variable=500;
    sumX=0;
    sumY=0;
    sumZ=0;
    for n=1:variable
        sumX=sumX+AcceleroGetXVolt(a,xPin,offset0);
        sumY=sumY+AcceleroGetYVolt(a,yPin,offset1);
        sumZ=sumZ+AcceleroGetZVolt(a,zPin,offset2);
        if (n==1)
            fprintf('5...');
        elseif(n==100)
            fprintf('4...');
        elseif(n==200)
            fprintf('3...');
        elseif(n==300)
            fprintf('2...');
        elseif(n==400)
            fprintf('1...');
        end
    end
    if(sensi==0)
        [offset0,offset1,offset2]=AcceleroSetOffSets(5,1672-sumX/variable, 1671-sumY/variable, 1876-sumZ/variable);
    else
        [offset0,offset1,offset2]=AcceleroSetOffSets(5,1650-sumX/variable, 1650-sumY/variable, 2450-sumZ/variable);
    end
%     if (abs(AcceleroGetOrientation(a,xPin,yPin,zPin,offset0,offset1,offset2,average))~=3)
%         fprintf('\nUnable to Calibrate!');
%         [offset0,offset1,offset2]=AcceleroSetOffSets(5,0,0,0);
%     else
%         fprintf('\nDone\n');
%     end
    fprintf('\nDone\n');
end