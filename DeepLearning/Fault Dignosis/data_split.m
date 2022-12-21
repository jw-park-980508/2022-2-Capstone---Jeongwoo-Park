function [Ptrain,Train_class,Ptest,Test_class] = data_split(data,label)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here

env_partition = cvpartition(label,'Holdout',0.3,'Stratify', true);

idxTrain = training(env_partition);
Train_class = label(idxTrain,:);
Train = data(idxTrain,:);

idxTest = test(env_partition);
Test_class = label(idxTest,:);
Test = data(idxTest,:);

Ptrain=(reshape(Train', [4000,1,1,size(Train,1)]));
Ptest=(reshape(Test', [4000,1,1,size(Test,1)]));

end