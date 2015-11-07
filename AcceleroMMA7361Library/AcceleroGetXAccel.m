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
function [sum_average]=AcceleroGetXAccel(a,xPin,offset0,average)
    total=0;
    for n=0:average-1
        total = total + AcceleroGetXRaw(a,xPin,offset0)*2400/1024 - 800;
    end
    sum_average=total/average;
end

%IN CPP
%---------------------------------------------------------
% /// getXAccel(): Returns the acceleration of the X-axis as 
% a int (1 G = 100.00)
%
% int AcceleroMMA7361::getXAccel()
% {
%   int sum = 0;
%   for (int i = 0;i<_average;i++)
%   {
%     sum = sum + _mapMMA7361G(getXRaw());
%   }
%   return sum/_average;
% }