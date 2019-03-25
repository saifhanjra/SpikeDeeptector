function [predictedOutput,ConfidencePercentage,channelLabel,frequencyChangePredictedLabel,totalPredcitedOutputFeatureVectors] =predictChannelLabelCummulativeAverage(channelId, yPred_double)

totalPredcitedOutputFeatureVectors=numel(yPred_double);



if totalPredcitedOutputFeatureVectors >= 1
    trackChanges=diff(yPred_double);
    frequencyChangePredictedLabel=nnz(unique(cumsum([true;diff(trackChanges)~=0]).*(trackChanges~=0)));
    maxOccurredLabel=mode(yPred_double);
    indMaxOccuredLabel=find(yPred_double==maxOccurredLabel);
    percentageMaxOccurredLabel=(numel(indMaxOccuredLabel)/totalPredcitedOutputFeatureVectors)*100;
    if percentageMaxOccurredLabel >= 80
        if maxOccurredLabel==1
            ConfidencePercentage=percentageMaxOccurredLabel;
            channelLabel='Neural';
            predictedOutput=sprintf('Stable Channel: channel %d, predicted as neural channel with confidence  %f percent',channelId,percentageMaxOccurredLabel);

        elseif maxOccurredLabel==2
            ConfidencePercentage=percentageMaxOccurredLabel;
            channelLabel='Artifacts';
            predictedOutput=sprintf('Stable Channel: channel %d, predicted as artifacts/noise channel with confidence %f percent',channelId,percentageMaxOccurredLabel);

        end
    elseif percentageMaxOccurredLabel < 80 && percentageMaxOccurredLabel >= 60
        if maxOccurredLabel==1
            ConfidencePercentage=percentageMaxOccurredLabel;
            channelLabel='Neural';
            predictedOutput=sprintf('Partially-stable channel: channel %d, predicted as neural channel with confidence %f percent',channelId,percentageMaxOccurredLabel);
            
        elseif maxOccurredLabel==2
            ConfidencePercentage=percentageMaxOccurredLabel;
            channelLabel='Artifacts';
            predictedOutput=sprintf('Partially-stable channel: channel %d, predicted as artifacts/noise channel with confidene %f percent',channelId,percentageMaxOccurredLabel);
        end
    elseif percentageMaxOccurredLabel < 60
        if maxOccurredLabel==1
            ConfidencePercentage=percentageMaxOccurredLabel;
            channelLabel='Neural';
            predictedOutput=sprintf('Unstable channel: channel %d, predicted as neural channel with confidence %f percent',channelId, percentageMaxOccurredLabel);
            
        elseif maxOccurredLabel==2
            ConfidencePercentage=percentageMaxOccurredLabel;
            channelLabel='Artifacts';
            predictedOutput=sprintf('Unstable channel: predicted as artifacts/noise channel with confidene %f percent',channelId, percentageMaxOccurredLabel);
        end
        
        
    end
   
else
     predictedOutput=sprintf('Channel broken or Not Connected: Channel no. %d', channelId);
     ConfidencePercentage=0;
     channelLabel='Broken';
end

end