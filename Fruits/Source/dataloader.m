clc;
close all;

pkg load image

dir_Banana = 'C:\Users\SDH\Desktop\fruits\Train\Banana';
dir_Strawberry = 'C:\Users\SDH\Desktop\fruits\Train\Strawberry';
dir_Kiwi = 'C:\Users\SDH\Desktop\fruits\Train\Kiwi';


list_Banana = dir(direc_Banana);
list_Strawberry = dir(direc_Strawberry);
list_Kiwi = dir(direc_Kiwi);

dir_Banana_test='C:\Users\SDH\Desktop\fruits\Test\Banana';
dir_Strawberry_test='C:\Users\SDH\Desktop\fruits\Test\Strawberry';
dir_Kiwi_test='C:\Users\SDH\Desktop\fruits\Test\Kiwi';

list_Banana_test = dir(dir_Banana_test);
list_Strawberry_test = dir(dir_Strawberry_test);
list_Kiwi_test = dir(dir_Kiwi_test);

xtrain=[];
ytrain=[];

xval=[];
yval=[];

xtest=[];
ytest=[]

cnt=1
for i = 3:length(list_Banana)
    xtrain(cnt,:)=reshape(imresize(rgb2gray(im2double(imread([direc_Banana, '\', list_Banana(i).name]))),[50,50]),50*50,1);
    ytrain(cnt)=1;
    cnt=cnt+1
end

for i = 3:length(list_Strawberry)
    xtrain(cnt,:)=reshape(imresize(rgb2gray(im2double(imread([direc_Strawberry, '\', list_Strawberry(i).name]))) , [50,50]),50*50,1);
    ytrain(cnt)=2;
    cnt=cnt+1
end

for i = 3:length(list_Kiwi)
    xtrain(cnt,:)=reshape(imresize(rgb2gray(im2double(imread([direc_Kiwi, '\', list_Kiwi(i).name]))) , [50,50]),50*50,1);
    ytrain(cnt)=3;
    cnt=cnt+1
end

cnt=1
for i = 3:length(list_Banana_test)/2
    xval(cnt,:)=reshape(imresize(rgb2gray(im2double(imread([direc_Banana_test, '\', list_Banana_test(i).name]))),[50,50]),50*50,1);
    yval(cnt)=1;
    cnt=cnt+1
end

for i = 3:length(list_Strawberry_test)/2
    xval(cnt,:)=reshape(imresize(rgb2gray(im2double(imread([direc_Strawberry_test, '\', list_Strawberry_test(i).name]))) ,[50,50]),50*50,1);
    yval(cnt)=2;
    cnt=cnt+1
end

for i = 3:length(list_Kiwi_test)/2
    xval(cnt,:)=reshape(imresize(rgb2gray(im2double(imread([direc_Kiwi_test, '\', list_Kiwi_test(i).name]))) ,[50,50]),50*50,1);
    yval(cnt)=3;
    cnt=cnt+1
end

cnt=1
for i = length(list_Banana_test)/2:length(list_Banana_test)-1
    xtest(cnt,:)=reshape(imresize(rgb2gray(im2double(imread([direc_Banana_test, '\', list_Banana_test(i).name]))) , [50,50]),50*50,1);
    ytest(cnt)=1;
    cnt=cnt+1
end

for i = length(list_Strawberry_test)/2:length(list_Strawberry_test)-1
    xtest(cnt,:)=reshape(imresize(rgb2gray(im2double(imread([direc_Strawberry_test, '\', list_Strawberry_test(i).name]))), [50,50]),50*50,1);
    ytest(cnt)=2;
    cnt=cnt+1
end

for i = length(list_Kiwi_test)/2:length(list_Kiwi_test)-1
    xtest(cnt,:)=reshape(imresize(rgb2gray(im2double(imread([direc_Kiwi_test, '\', list_Kiwi_test(i).name]))), [50,50]),50*50,1);
    ytest(cnt)=3;
    cnt=cnt+1
end

ytrain = ytrain'
ytest = ytest'
yval = yval'

randomize_train = randperm(1448);
randomize_val = randperm(240);
randomize_test = randperm(246);



xtrain = xtrain(randomize_train,:);
ytrain = ytrain(randomize_train);

xval = xval(randomize_val,:);
yval = yval(randomize_val);

xtest = xtest(randomize_test,:);
ytest = ytest(randomize_test);


save 'fruits_data.mat' xtrain xtest xval ytrain ytest yval

% Gray Image
image=reshape(xtrain(1400,:),50,50);

imagesc(image);


