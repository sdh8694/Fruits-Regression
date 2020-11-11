function [ypred_val, val_accuracy, val_loss] = MLR_val(xval, yval, theta)

m=size(xval,1);
th = theta;

linear_h=xval*th; %target prediction
ypred_val=zeros(m,1);
val_loss=0;

for i=1:m
  hp(i,:)=softmax(linear_h(i,:)); % Hypothesis Function
  val_loss = val_loss - log(hp(i,yval(i)));
  [junk maxind] = max(hp(i,:));
  ypred_val(i)=maxind;
end

norm_th = norm(theta(:)).^2;
val_loss = val_loss/m;

val_accuracy = mean(yval==ypred_val)
 
endfunction

