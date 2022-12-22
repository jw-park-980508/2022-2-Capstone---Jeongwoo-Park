function [dataset_re,b] = data_load(path)
%   input: data path
%   output: data

addpath("data/pre_data/"+path)

a = load('data.mat');
b = load('label.mat');

a = a.data_set;
b = b.data_set_label;


dataset_re = [];

for i = 1:1000
    dataset_re = [dataset_re a{i,1}];
end

dataset_re = dataset_re';

end