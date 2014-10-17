function [phi_0, phi_1, phi_0_set, phi_1_set] = nb_train(range)

if(range == 0)
    [spmatrix, tokenlist, trainCategory] = readMatrix('MATRIX.TRAIN');
elseif (range == 50)
    [spmatrix, tokenlist, trainCategory] = readMatrix('MATRIX.TRAIN.50');
elseif (range == 100)
    [spmatrix, tokenlist, trainCategory] = readMatrix('MATRIX.TRAIN.100');
elseif (range == 200)
    [spmatrix, tokenlist, trainCategory] = readMatrix('MATRIX.TRAIN.200');
elseif (range == 400)
    [spmatrix, tokenlist, trainCategory] = readMatrix('MATRIX.TRAIN.400');
elseif (range == 800)
    [spmatrix, tokenlist, trainCategory] = readMatrix('MATRIX.TRAIN.800');
elseif (range == 1400)
    [spmatrix, tokenlist, trainCategory] = readMatrix('MATRIX.TRAIN.1400');
end
trainMatrix = full(spmatrix);
numTrainDocs = size(trainMatrix, 1);
numTokens = size(trainMatrix, 2);

% trainMatrix is now a (numTrainDocs x numTokens) matrix.
% Each row represents a unique document (email).
% The j-th column of the row $i$ represents the number of times the j-th
% token appeared in email $i$. 

% tokenlist is a long string containing the list of all tokens (words).
% These tokens are easily known by position in the file TOKENS_LIST

% trainCategory is a (1 x numTrainDocs) vector containing the true 
% classifications for the documents just read in. The i-th entry gives the 
% correct class for the i-th email (which corresponds to the i-th row in 
% the document word matrix).

% Spam documents are indicated as class 1, and non-spam as class 0.
% Note that for the SVM, you would want to convert these to +1 and -1.


%V = size(trainMatrix,2);

% YOUR CODE HERE

negSet = trainMatrix(trainCategory == 0,:);
posSet = trainMatrix(trainCategory == 1,:);

negNumWord = sum(sum(negSet));
posNumWord = sum(sum(posSet));

for i = 1:numTokens
    phi_0_set(i) = (sum(negSet(:, i)) + 1) / (negNumWord + numTokens);
    phi_1_set(i) = (sum(posSet(:, i)) + 1) / (posNumWord + numTokens);
end
phi_0 = log(size(negSet,1) / numTrainDocs);
phi_1 = log(size(posSet,1) / numTrainDocs);

phi_0_set = log(phi_0_set);
phi_1_set = log(phi_1_set);

end