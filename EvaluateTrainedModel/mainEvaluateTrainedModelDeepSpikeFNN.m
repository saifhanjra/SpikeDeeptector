clear;clc;
%-------------------Predict Label: Feature Vector--------------------------

dataNEV=openNEV('enter the path of folder where nev file is located\(name of the exmaple as an example, Recording6.nev');
batchSize=20;
% electrodeId=22;
load trainedModelDeepNetFNN.mat


for i=1:96
electrodeId=i;

yPredicted = predictLabelOfChannel_ANNs(dataNEV,batchSize, electrodeId,trainedNet);
if yPredicted ~= 0
[predictedOutput,ConfidencePercentage,channelLabel,frequencyChangesPrediction,totalFeatureVectors]=predictChannelLabelCummulativeAverage(electrodeId,yPredicted);
confidencePercantageSession{i}=ConfidencePercentage;
ChannelLabelSession{1,i}=channelLabel;
ChannelLabelSession{2,i}=num2str(ConfidencePercentage);
ChannelLabelSession{3,i}=num2str(frequencyChangesPrediction);
ChannelLabelSession{4,i}=num2str(totalFeatureVectors);
predictedOutput
end
end

