% This script evluate the DeepSpikeCNN on the data of each implanted
% electrode of array, individually. 
%dependencies: 1)Matlab Deeplearning toolbox: please install Matlab Deep learning tool box.
%2)NPMK packge: to read files genetrated by blackrock microsystem.

clear;clc;
%-------------------Predict Label: Feature Vector--------------------------

dataNEV=openNEV('enter the path of folder where nev file is located\(name of the exmaple as an example, Recording6.nev'); %Path of the NEV file.
batchSize=20;
% electrodeId=22;
load trainedModelDeepNetCNN.mat % load trained model of DeepSpikeCNN
for i=1:96 %Utah array contain 96 channels
electrodeId=i;    
yPredChannels =predictChannelFeatVectlLabelsDeepSpikeCNN(dataNEV, batchSize, electrodeId,trainedNet);% prediction on feature vectors
if yPredChannels ~= 0 % if the channel(is not broken and ) contain feature vectors
[predictedOutput,ConfidencePercentage,channelLabel,frequencyChangesPrediction,totalFeatureVectors]=predictChannelLabelCummulativeAverage(electrodeId,yPredChannels);%predicted channel.
% confidencePercantageSession{i}=ConfidencePercentage;% Reliabilty tag
ChannelLabelSession{1,i}=channelLabel;% predicted channel label
ChannelLabelSession{2,i}=num2str(ConfidencePercentage);%Reliabilty tag, percantage
ChannelLabelSession{3,i}=num2str(frequencyChangesPrediction);% how many time the prediction switched at one electrode
ChannelLabelSession{4,i}=num2str(totalFeatureVectors);% total number of feature vector on one electrode
end

end
