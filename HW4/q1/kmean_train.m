function [mu] = kmean_train()
% load and show the small.tiff
A = double(imread('mandrill-small.tiff')); 
imshow(uint8(round(A)));
% K-means initialization 
k = 16;
initmu = zeros(k,3); 
for l=1:k,
i = randi(size(A, 1), 1, 1);
j = randi(size(A, 2), 1, 1);
A(i,j,:);
initmu(l,1) = A(i,j,1);
initmu(l,2) = A(i,j,2);
initmu(l,3) = A(i,j,3);
end;


% Run K-means
mu = initmu;
for iter = 1:500
    if mod(iter,10)==0, 
        fprintf('.'); 
    end
    newmu = zeros(k,3);
    nassign = zeros(k,1);
    for i=1:size(A,1),
        for j=1:size(A,1),
            dist = zeros(k,1);
            for l=1:k,
                % compute the distance between current pixel and kernel
                d = mu(l,:)'-permute(A(i,j,:), [3 2 1]);
                dist(l) = d'*d;
            end;
            % compute the current kernel value
            [minVar, assignment] = min(dist,[],1);
            nassign(assignment) = nassign(assignment) + 1;
            newmu(assignment,:) = newmu(assignment,:) + ...
                permute(A(i,j,:), [3 2 1])';
        end; 
    end;

    for l=1:k,
        if (nassign(l) > 0)
            % update all kernels
            newmu(l,:) = newmu(l,:) / nassign(l);
        end;
    end;

    mu = newmu;
end;
end