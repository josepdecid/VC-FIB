function [M] = vc3_2_filter(I)
    [wSize, n] = size(I);
    
    half = floor((wSize + 1)/ 2);
    M = I(half, :);
    
    for i = 1:n
        if or(M(i) == 255, M(i) == 0)
            M(i) = mean([I(1:half-1, i)' I(half+1:wSize, i)']);
        end
    end
end