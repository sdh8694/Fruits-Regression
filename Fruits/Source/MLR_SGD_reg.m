function [th, train_accuracy, train_loss] = MLR_SGD_reg(theta, xtrain, ytrain,alpha,lambda)
%Cost Summary of this function goes here
%   Detailed explanation goes here
th=theta;
m=size(xtrain,1);

for i=1:m
  z = xtrain(i,:)*th;
  py_x = softmax(z);
  th(:,1)=th(:,1) - (alpha)*((py_x(1)-(ytrain(i)==1))*xtrain(i,:)'+lambda*th(:,1));
  th(:,2)=th(:,2) - (alpha)*((py_x(2)-(ytrain(i)==2))*xtrain(i,:)'+lambda*th(:,2));
  th(:,3)=th(:,3) - (alpha)*((py_x(3)-(ytrain(i)==3))*xtrain(i,:)'+lambda*th(:,3));
end


linear_h=xtrain*th; %target prediction
ypred=zeros(m,1);
train_loss=0;



for i=1:m
  hp(i,:)=softmax(linear_h(i,:)); % Hypothesis Function
  train_loss = train_loss - log(hp(i,ytrain(i)));
  [junk maxind] = max(hp(i,:));
  ypred(i)=maxind;
end


norm_th = norm(th(:)).^2;
train_loss = train_loss/m;
train_accuracy = mean(ytrain==ypred);

end

