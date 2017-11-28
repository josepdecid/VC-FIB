function [ M ] = vc4_3_filter(I, K)
    [wSize, n] = size(I);

    half = floor((wSize + 1)/ 2);
    M = I(half, :);

    for i = 1:n
        localAverage = mean(I(:,i));
        M(i) = (localAverage > M(i) + K) * 255;
    end
end