function [mu, covariance, likelihood] = kmean_train()
% load and show the small.tiff
A = double(imread('mandrill-small.tiff')); 
imshow(uint8(round(A)));
% k initialization 
k = 5;
initmu = zeros(k,3); 
for l=1:k,
    i = randi(size(A, 1), 1, 1);
    j = randi(size(A, 2), 1, 1);
    initmu(l,1) = A(i,j,1);
    initmu(l,2) = A(i,j,2);
    initmu(l,3) = A(i,j,3);
end;
m = size(A,1);
n = size(A,3);
N = m^2;
initPi = zeros(k,1) + 1 / k;
B = reshape(A,N,3);
initCov = repmat(cov(B),k,1);



% Run K-means
mu = initmu;
piK = initPi;
covariance = initCov;
for iter = 1:100
    if mod(iter,10)==0, 
        fprintf('.'); 
    end    
    newmu = zeros(k,3);
    newPi = zeros(k,1);
    newCov = repmat(eye(n,n),k,1);
    nassign = zeros(k,1);
    gamma = zeros(m,m,k);
    % E step
    for i=1:m,
        for j=1:m,
            denominator = 0;
            temp = reshape(A(i,j,:),1,n);
            for l = 1:k
                %covariance(n*(l-1)+1:n*l,:) = diag(cov(temp'));
                denominator = denominator + ...
                            piK(l) * gauss(temp,mu(l,:), covariance(n*(l-1)+1:n*l,:));
            end
            for l=1:k
                % compute the distance between current pixel and kernel
                gamma(i,j,l) = 1 / denominator * ...
                    piK(l) * gauss(temp,mu(l,:),  covariance(n*(l-1)+1:n*l,:));
            end;
        end; 
    end;
    % M step
    %N_k = zeros(k,1);
    N_k = reshape(sum(sum(gamma)),1,k);
    for l=1:k,
        %for i=1:size(A,1),
        %    for j=1:size(A,1)
        %        N_k(l) = N_k(l) + gamma(i,j,l);
        %    end
        %end
        tempMu = zeros(m,m,3);
        for i=1:size(A,1),
            for j=1:size(A,1)
                tempMu(i,j,:) = gamma(i,j,l) * A(i,j,:);
            end
        end
        tempMu = sum(sum(tempMu));
        newmu(l,:) = 1/N_k(l) * reshape(tempMu,1,n);
        newPi(l) = N_k(l) / N;
        for i = 1:m
            for j = 1:m
                temp = reshape(A(i,j,:),1,n);
                newCov(n*(l-1)+1:n*l,:) = newCov(n*(l-1)+1:n*l,:) + ...
                    1/N_k(l) * (gamma(i,j,l) * ...
                    (temp-newmu(l,:))' * (temp-newmu(l,:)));
            end
        end
    end;
    mu = newmu;
    piK = newPi;
    covariance = newCov;
end
perLikelihood = 0;
likelihood = 0;
for i = 1:m
    for j = 1:m
        perLikelihood = 0;
        temp = reshape(A(i,j,:),1,n);
        for l = 1:k
            perLikelihood = perLikelihood + piK(l) * gauss(temp,mu(l,:),...
                covariance(n*(l-1)+1:n*l,:));
        end
        likelihood = likelihood + log(perLikelihood);
    end
end
end