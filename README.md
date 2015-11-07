# MATLAB-Source-For-Accelerometer-MMA7361

#####Matlab codes to plot waveforms for readings of x,y,z axis from Accelerometer-MMA7361 that connected to an Arduino.

This sources require either 'Arduino Support from MATLAB' package or 'Legacy MATLAB and Simulink Support for Arduino' have 
to be installed first in order to communicate between Matlab and Arduino through serial port. 
Links for MATLAB support package:
[Arduino Support for MATLAB] (http://www.mathworks.com/hardware-support/arduino-matlab.html) or 
[Legacy MATLAB and Simulink Support for Arduino]  (http://www.mathworks.com/matlabcentral/fileexchange/32374-legacy-matlab-and-simulink-support-for-arduino)

**Steps:** 

1. Set Path to folder:
AcceleroMMA7361Library(Legacy) if Legacy MATLAB and Simulink Support installed if Matlab version is older than R2014a.
AcceleroMMA7361Library(Non-Legacy) if latest Arduino Support form MATLAB installed instead of legacy one above.

2. Run AcclerometerRead:
To read x,y,z reading in command window and waveforms plot shows in figure window

3. During Calibrating:
The accelerometer's z-axis should placed direct perpendicular to gravity (face upwards) for the program to accurately identify the position as zero value

--------------
*By: Oh Kai Jie (Student of Swinburne University of Technology)* <br> *Date: 7 November 2015*
> Developed under GNU Lesser General Public License Version 2.1 (Non-Commercial Purpose)
