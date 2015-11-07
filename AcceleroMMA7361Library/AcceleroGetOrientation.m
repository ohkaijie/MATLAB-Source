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


function [return_val]=AcceleroGetOrientation(a,xPin,yPin,zPin,offset0,offset1,offset2,average)
    gemiddelde=10;
    x=0;
    y=0;
    z=0;
    xAbs=0;
    yAbs=0;
    zAbs=0;
    return_val=0;
    
    for n=0:gemiddelde-1
        x=x+AcceleroGetXAccel(a,xPin,offset0,average);
        y=y+AcceleroGetYAccel(a,yPin,offset1,average);
        z=z+AcceleroGetZAccel(a,zPin,offset2,average);
    end
    
    x=x/gemiddelde;
    y=y/gemiddelde;
    z=z/gemiddelde;
    
    xAbs=abs(100-abs(x));
    yAbs=abs(100-abs(y));
    zAbs=abs(100-abs(z));
    
    if(xAbs<yAbs)
        if(xAbs<zAbs)
            if(x>0)
                return_val=1;
            end
            return_val=-1;
        end
    end
    if(yAbs<xAbs)
        if(yAbs<zAbs)
            if(y>0)
                return_val=2;
            end
            return_val=-2;
        end
    end
    if(zAbs<xAbs)
        if(zAbs<yAbs)
            if(z>0)
                return_val=3;
            end
            return_val=-3;
        end
    end
    return_val=0;
end