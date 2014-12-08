function [] = kmean_assign(mu)
k = 5;
% Assign new colors to large image
bigimage = double(imread('mandrill-large.tiff'));
figure;
imshow(uint8(round(bigimage)));
qimage = bigimage;
for i=1:size(bigimage,1), 
    for j=1:size(bigimage,1),
        dist = zeros(k,1);
        for l=1:k,
            d = mu(l,:)'-permute(bigimage(i,j,:), [3 2 1]);
            dist(l) = d'*d;
        end;
        [minVar assignment] = min(dist,[],1);
        qimage(i,j,:) = ipermute(mu(assignment,:), [3 2 1]);
    end; 
end;
figure;
imshow(uint8(round(qimage)));

end