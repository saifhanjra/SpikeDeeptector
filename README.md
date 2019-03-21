# DeepSpike
This Repository contain the code of DeepSpike Algorithm. We have also provided some data to evaluate the models (DeepSpike CNN & DeepSpike FNN).
Data folder: contains the data of six reocrding sessions from different patients.

EvaluateTrainedModel: Contain the objects(trained model of DeepSpikeCNN & DeepSpikeFNN). It also contain code to evaluate both models 'mainEvaluateTrainedModelDeepSpikeCNN.m'
and 'mainEvaluateTrainedModelDeepSpikeFNN'.Both Matlab files will call the respective functions automatiaclly (just add this folder in MATLAB Path). There are two dependecies to run this code. 1: please install the Matlab deeplearning tool box (https://www.mathworks.com/mwaccount/profiles/reverify?uri=https%3A%2F%2Fwww.mathworks.com%2Flogin). 
2. Install the NPMK package, which is Neural Processing Matlab Kit, is a set of functions for loading 
and manipulating data from Blackrock Microsystems' data files. Information about installing this package can be foound here: https://github.com/BlackrockMicrosystems/NPMK 

Data folder contain recording session files with extension '.NEV', '.NSx', which are the output files genertaed by BLackrock Neural Signal processor. To visualize the data, please download and NPLAYServer and BlackrockCentral software. Intruction for installation and using the software for can be found here 
'https://blackrockmicro.com/wp-content/uploads/2016/08/LB-0574-Rev-4.00-Central-Software-Suite-IFU.pdf'

%Data folder also contain labeled waveforms. (Matlab struct)

%CompleteCodeFolder: contain the complete code(for feature vector extraction, training deeplearning algorithms (DeepSpike CNN, DeepSpike FNN)). Please write me if you 
%have any question about uderstanding code. (muhammad.saif-ur-rehman@tu-dortmund.de)

 

 
