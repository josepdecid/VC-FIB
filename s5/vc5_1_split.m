function [ D ] = vc5_1_split(X, sigma)
    [F, ~, I] = size(X);
    D = false(I, 1);
    
    if F > 16
        for i = 1:I
           D(i) = std2(X(:, :, i)) >= sigma;
        end
    end
end