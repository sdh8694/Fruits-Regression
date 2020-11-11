clc;
clear all;

% Xtrain, Xtest, ytrain, ytest 가져오기
load('fruits_data.mat')

% Class 수
k=3;

m_train = size(xtrain,1);
m_test = size(xtest,1);
m_val = size(xval,1);

xtrain=[ones(m_train,1) xtrain]; % Bias를 포함하기 위해서 1을 추가
xtest = [ones(m_test,1) xtest];
xval=[ones(m_val,1) xval];

n = size(xtrain,2);

iter=70; % 학습 횟수
  
theta=zeros(n,k); % theta 초기값

alpha=2e-5; % Learning rate

lambda=0; % Regularization coefficient
 

% 최적화 theta저장
th=zeros(n,k,iter);

train_loss=zeros(1,iter);
test_loss=zeros(1,iter);
val_loss=zeros(1,iter);

train_accuracy=zeros(1,iter);
test_accuracy=zeros(1,iter);
val_accuracy=zeros(1,iter);


ypred_val = zeros(m_val,iter);
ypred = zeros(m_test,iter);

for epoch=1:iter
  epoch
  [th(:,:,epoch), train_accuracy(epoch), train_loss(epoch)]=MLR_SGD_reg(theta, xtrain, ytrain, alpha, lambda); % Cost funtion
  [ypred_val(:,epoch), val_accuracy(epoch), val_loss(epoch)]=MLR_val(xval, yval, th(:,:,epoch));
  val_loss(epoch)
  theta = th(:,:,epoch);
endfor

%MLR_test(xtest, ytest, th(:,:,epoch));
%hold on;
figure;
plot(1:iter, train_loss, 1:iter, val_loss, 'LineWidth', 2);
grid on;
legend('train loss', 'val loss');
xlabel('epoch');
ylabel('Loss');


figure;
plot(1:iter, train_accuracy, 1:iter, val_accuracy, 'LineWidth', 2);
grid on;
legend('train accuracy', 'val accuracy');
xlabel('epoch');
ylabel('Accuracy');
