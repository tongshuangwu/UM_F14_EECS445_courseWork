function [model] = svm_train(range)

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

addpath('liblinear/matlab');  % add LIBLINEAR to the path
[sparseTrainMatrix, tokenlist, trainCategory] = readMatrix('MATRIX.TRAIN');

numTrainDocs = size(sparseTrainMatrix, 1);
numTokens = size(sparseTrainMatrix, 2);

% sparseTrainMatrix is a (numTrainDocs x numTokens) sparse matrix.
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

% Note that the train function for LIBLINEAR uses the sparse matrix 
% representation of the document word matrix, which is stored in sparseTrainMatrix.
% Additionally, it expects the labels to be a regular vector
% of dimension (numTrainDocs x 1).


%---------------
% YOUR CODE HERE
svm_category = 2.*trainCategory - 1;
model = train(svm_category', sparseTrainMatrix);

%---------------
end