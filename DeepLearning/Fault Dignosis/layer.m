function [layer] = layer(kind,output)
%UNTITLED7 Summary of this function goes here
%   Detailed explanation goes here

if kind == "CNN_1D"
    layer = [
            imageInputLayer([4000 1]);
            
            convolution2dLayer([16 1], 128);
            tanhLayer;
            maxPooling2dLayer([2 1],'stride',2);
            dropoutLayer(0.3);

            convolution2dLayer([8 1], 64);
            tanhLayer;
            maxPooling2dLayer([2 1],'stride',2);
            dropoutLayer(0.3);

            convolution2dLayer([4 1], 32);
            tanhLayer;
            maxPooling2dLayer([2 1],'stride',2);
            dropoutLayer(0.25);
            
            convolution2dLayer([4 1], 16);
            tanhLayer;
            maxPooling2dLayer([2 1],'stride',2);
            
            convolution2dLayer([4 1],8);
            tanhLayer;
            dropoutLayer(0.25);
            
            fullyConnectedLayer(448);

            fullyConnectedLayer(output);
            softmaxLayer;
            classificationLayer;
            
            ];

elseif kind == "CNN_2D"
    layer = [
        imageInputLayer([64 64 1])
    
        convolution2dLayer(5,32)
        reluLayer
        maxPooling2dLayer(2,'Stride', 2)
    
        convolution2dLayer(3,64)
        reluLayer
        maxPooling2dLayer(2,'Stride',2)
    
        convolution2dLayer(3,128)
        reluLayer
        maxPooling2dLayer(2,'Stride',2)
    
        convolution2dLayer(3,256)
        reluLayer
        maxPooling2dLayer(2,'Stride',2)

    
        fullyConnectedLayer(2560,'Name','fc1')
        reluLayer
        fullyConnectedLayer(768,'Name','fc2')
        reluLayer
    
        fullyConnectedLayer(output)
        softmaxLayer
        classificationLayer];

elseif kind == "CNN_LSTM"
    layer1 = [
            imageInputLayer([4000 1]);
            

            convolution2dLayer([20 1], 50,'stride',2,'Padding','same');
            tanhLayer;
            convolution2dLayer([10 1], 30,'stride',2,'Padding','same');
            tanhLayer;

            maxPooling2dLayer([2 1],'stride',2);

          
           ];
    layer2 = [
            convolution2dLayer([6 1], 50,'stride',1,'Padding','same');
            tanhLayer;
            convolution2dLayer([6 1], 40,'stride',1,'Padding','same');
            tanhLayer;

            maxPooling2dLayer([2 1],'stride',2);

            convolution2dLayer([6 1], 30, 'stride',1,'Padding','same');
            tanhLayer;
            convolution2dLayer([6 1], 30, 'stride',2,'Padding','same');
            tanhLayer;

            maxPooling2dLayer([2 1],'stride',2);
      ];      
    layer3 = [
             flattenLayer;
            lstmLayer(60);
            reluLayer;
            lstmLayer(30);
            reluLayer;

            fullyConnectedLayer(output);
            softmaxLayer;

            classificationLayer;
            ];

    add = additionLayer(2,'Name','add_1');
    layer = layerGraph;
    layer = addLayers(layer,layer1);
    layer = addLayers(layer,layer2);
    layer = connectLayers(layer,'imageinput','conv_3');
    layer = addLayers(layer,layer3);
    layer = addLayers(layer,add);

    layer = connectLayers(layer,'maxpool','add_1/in1');
    layer = connectLayers(layer,'maxpool_2','add_1/in2');
    layer = connectLayers(layer,'add_1','flatten');
end






end