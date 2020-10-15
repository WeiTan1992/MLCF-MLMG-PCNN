function fe = fusion_EA(I1,I2,a)

[m,n] = size(I1);

m1 = mean(I1(:));
m2 = mean(I2(:));
M1 = median(I1(:));
M2 = median(I2(:));
G1 = (m1+M1)/2;
G2 = (m2+M2)/2;

w1 = zeros(m,n);
w2 = zeros(m,n);
W1 = zeros(m,n);
W2 = zeros(m,n);
for i = 1:m
    for j = 1:n
        w1(i,j) = exp(a*abs(I1(i,j)-G1));
        w2(i,j) = exp(a*abs(I2(i,j)-G2));
        W1(i,j) = w1(i,j)/(w1(i,j)+w2(i,j));
        W2(i,j) = w2(i,j)/(w1(i,j)+w2(i,j));
    end
end

fe = zeros(m,n);
for i = 1:m
    for j = 1:n
        fe(i,j) = W1(i,j)*I1(i,j)+W2(i,j)*I2(i,j);
    end
end