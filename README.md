# DeepSpike
This Repository contain the code of DeepSpike Algorithm. We have also provided some data to evaluate the models (DeepSpike CNN & DeepSpike FNN).
Data folder: contains the data of six reocrding sessions from different patients.

EvaluateTrainedModel: Contain the objects(trained model of DeepSpikeCNN & DeepSpikeFNN). It also contain code to evaluate both models 'mainEvaluateTrainedModelDeepSpikeCNN.m'
and 'mainEvaluateTrainedModelDeepSpikeFNN'.Both Matlab files will call the respective functions automatiaclly (just add this folder in MATLAB Path). There are two dependecies to run this code. 
1: please install the Matlab deeplearning tool box (https://www.mathworks.com/products/deep-learning.html). 
2.  This is not mandatory because corresponding data file is avalailbe in mat format, However, to read .nev file Install the NPMK package must be installed, which is Neural Processing Matlab Kit, is a set of functions for loading and manipulating data from Blackrock Microsystems' data files. Information about installing this package can be foound here: https://github.com/BlackrockMicrosystems/NPMK 

Data folder contain recording session files with extension '.NEV', which is the output files genertaed by BLackrock Neural Signal processor. To visualize the data, please download and NPLAYServer and BlackrockCentral software. Instruction for installation and using the software for can be found here 'https://blackrockmicro.com/wp-content/uploads/2016/08/LB-0574-Rev-4.00-Central-Software-Suite-IFU.pdf'. 
We highly recommend the users to use this package for visualiztion of each channel waveforms (annotate each channel) and than the compare your result with DeepSpike algotihm.  

%Data folder also contain labeled waveforms. (Matlab struct)

%CompleteCodeFolder: contain the complete code(for feature vector extraction, training deeplearning algorithms (DeepSpike CNN, DeepSpike FNN)). Please write me if you have any question about uderstanding code. (muhammad.saif-ur-rehman@tu-dortmund.de)

 

 
