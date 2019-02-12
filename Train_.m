function Train_(trainloc,testloc,outloc)
adjustsize(trainloc) %adjusting the training images size 
% Load Data
%
% automatically labels the images based on folder names and stores the data
% as an |ImageDatastore| object.

images=imageDatastore(trainloc,'IncludeSubfolders',true,...
    'LabelSource','foldernames');
% Divide the data into training and validation data sets. Use 70% of the
% images for training and 30% for validation. 
[trainingImages] = splitEachLabel(images,1,'randomized');
%Load Pretrained Network
% Load the pretrained AlexNet neural network. 
net = alexnet;


% Transfer Layers to New Network
% The last three layers of the pretrained network |net| are configured for
% 1000 classes. These three layers must be modified for the our
% classification problem. 
layersTransfer = net.Layers(1:end-3);

%
% Transfer the layers to the new classification task by replacing the last
% three layers with a fully connected layer, a softmax layer, and a
% classification output layer. Specify the options of the new fully
% connected layer according to the new data. Set the fully connected layer
% to have the same size as the number of classes in the new data. To learn
% faster in the new layers than in the transferred layers, increase the
% |WeightLearnRateFactor| and |BiasLearnRateFactor| values of the fully
% connected layer.
numClasses = numel(categories(trainingImages.Labels))
layers = [
    layersTransfer
    fullyConnectedLayer(numClasses,'WeightLearnRateFactor',20,'BiasLearnRateFactor',20)
    softmaxLayer
    classificationLayer];


% Train Network
% Specify the training options. For transfer learning, keep the features
% from the early layers of the pretrained network (the transferred layer
% weights). Set |InitialLearnRate| to a small value to slow down learning
% in the transferred layers. In the previous step, you increased the
% learning rate factors for the fully connected layer to speed up learning
% in the new final layers. This combination of learning rate settings
% results in fast learning only in the new layers and slower learning in
% the other layers. When performing transfer learning, you do not need to
% train for as many epochs. An epoch is a full training cycle on the entire
% training data set. Specify the mini-batch size and validation data. The
% software validates the network every |ValidationFrequency| iterations
% during training, and automatically stops training if the validation loss
% stops improving. Validate the network once per epoch.
if length(images.Labels)>10
    
miniBatchSize = 10;
else
 miniBatchSize=1;
end
numIterationsPerEpoch = floor(numel(trainingImages.Labels)/miniBatchSize);
options = trainingOptions('sgdm',...
    'MiniBatchSize',miniBatchSize,...
    'MaxEpochs',4,...
    'InitialLearnRate',1e-4,...
    'Verbose',false,...
    'Plots','training-progress',...
    'ValidationFrequency',numIterationsPerEpoch);




% Train the network that consists of the transferred and new layers. 
netTransfer = trainNetwork(trainingImages,layers,options);
changeTestsize_(testloc); %adjust the testing images size.
resulting_(outloc,testloc,netTransfer);  %write the classification result of the testing data on txt file called RESULT.
