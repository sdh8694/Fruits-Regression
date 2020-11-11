function [test_accuracy,test_loss] = MLR_test(xtest, ytest, theta)

m=size(xtest,1);
th = theta;

linear_h=xtest*th; %target prediction
ypred=zeros(m,1);
test_loss=0;

for i=1:m
  hp(i,:)=softmax(linear_h(i,:)); % Hypothesis Function
  test_loss = test_loss - log(hp(i,ytest(i)));
  [junk maxind] = max(hp(i,:));
  ypred(i)=maxind;
end

norm_th = norm(theta(:)).^2;
test_loss = test_loss/m;

test_accuracy = mean(ytest==ypred)
 
endfunction

