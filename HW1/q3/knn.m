function [accuracy] = knn(k,digits_train,labels_train,digits_test,labels_test)
classArr = zeros (length(digits_test),1);
count = 0;
for index = 1:length(digits_test)
    class = nearestNeighbor(index,k,digits_train,labels_train,digits_test,labels_test);
    classArr(index) = class;
    if(class == labels_test(index))
        count = count+1;
    end
end
accuracy = count / length(digits_test);
end
