function yPredicted = predictLabelOfChannel_ANNs(dataNEV,batchSize, electrodeId,trainedNet)
electrodeStamps=dataNEV.Data.Spikes.Electrode;
dataElectrodeStamps=dataNEV.Data.Spikes.Waveform;
extractElectrodIdStamps=find(dataNEV.Data.Spikes.Electrode==electrodeId);
dataElectrodeidStamp=double(dataNEV.Data.Spikes.Waveform(:,extractElectrodIdStamps));

numberWaveformsAtElectrode=numel(extractElectrodIdStamps);
numberFeatureVectorsAtElectrode=floor(numberWaveformsAtElectrode/batchSize);

startingIndex=1;

for i=1:numberFeatureVectorsAtElectrode
    featuresVectorExtracted_i=dataElectrodeidStamp(:,startingIndex:i*batchSize);
    featuresVectorExtracted_i=reshape(featuresVectorExtracted_i,[48*batchSize,1]);
    featuresVectorCompANNs(:,i)=featuresVectorExtracted_i;
    
    startingIndex=startingIndex+batchSize;
end

if numberFeatureVectorsAtElectrode >= 1 
modelOutput= trainedNet(featuresVectorCompANNs);
[~,yPredicted]=max(modelOutput);
yPredicted=yPredicted';
else 
  yPredicted=0; 
end

end