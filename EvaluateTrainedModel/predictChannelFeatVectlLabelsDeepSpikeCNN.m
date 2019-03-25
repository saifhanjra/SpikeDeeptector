function yPredChannels =predictChannelFeatVectlLabelsDeepSpikeCNN(dataNEV, batchSize, electrodeId,trainedNet)
electrodeStamps=dataNEV.Data.Spikes.Electrode;
dataElectrodeStamps=dataNEV.Data.Spikes.Waveform;
extractElectrodIdStamps=find(dataNEV.Data.Spikes.Electrode==electrodeId);
dataElectrodeidStamp=double(dataNEV.Data.Spikes.Waveform(:,extractElectrodIdStamps));

numberWaveformsAtElectrode=numel(extractElectrodIdStamps);
numberFeatureVectorsAtElectrode=floor(numberWaveformsAtElectrode/batchSize);
startingIndex=1;
for i=1:numberFeatureVectorsAtElectrode
    featuresVectorExtracted_i=dataElectrodeidStamp(:,startingIndex:i*batchSize);
    featuresVectorExtracted_i=featuresVectorExtracted_i';
    compFeaturesVectorsCNNs(:,:,1,i)=featuresVectorExtracted_i;
    %featuresVectorsConstructed{i}=dataElectrodeidStamp(:,startingIndex:i*batchSize);
    startingIndex=startingIndex+batchSize;
end
if numberFeatureVectorsAtElectrode >=1
    yPredicted = classify(trainedNet,compFeaturesVectorsCNNs);% predicted output
    yPredChannels=double(yPredicted);
else
    yPredChannels=0;
end
end
