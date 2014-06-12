Adam_Packers_Data
=================

To execute simpleProgrammaticslider_recon.m

1.Please change line 2 to the path to your score files. GTE scores are available for conditioning levels {1,1.1,1.2} and bin edge = 0.15 for 
H115_z150_dfofOut and H116_z150_dfofOut. The former has 279 neurons and the latter has 334 neurons.
The number of time points is 5400.

2.Please change line 6 to the path to your .mat file. (Eg: H116_z150_dfofOut.mat). These are raw traces 
without any baseline correction.

3.The code for merging baseline corrected series from Jordi is in baseline_corrected.m

The code to generate the video from the images is in im2vid.m. Please change line 2 in im2vid.m to point to your folder of 
images corresponding to 20130523_H116_T-003. You can download the images folder corresponding to
20130523_H116_T-003 from here .
All of this corresponds to the movieName 20130523_H116_T003_z150 found here .
The README is here 
which describes the 'z_150' experimental conditions for time series 3. The neuron locations can be found in  
H116_z150_dfofOut(1).contours. Each cell describes the contours of the neurons. For my MATLAB figures, I just 
assumed a 'mean' position for each neuron, so that I could draw the arrows.
