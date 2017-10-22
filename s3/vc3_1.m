function [M] = vc3_1(I)
    [nRows, nCols, dim] = size(I);
    if dim == 3
       I = rgb2gray(I); 
    end
    
    M = I;
    
    for i = 1:nRows
        currentSum = sum(I(i, 1:3));
        M(i, 1) = currentSum / 3;
        currentSum = currentSum + I(i, 4);
        M(i, 2) = currentSum / 4;
       
        for j = 3:nCols-3
            M(i, j) = currentSum / 5;
            currentSum = currentSum - I(i, j-2) + I(i, j+3);
        end
        
        M(i, nCols-2) = currentSum / 5;
        currentSum = currentSum - I(i, nCols-4);
        M(i, nCols-1) = currentSum / 4;
        currentSum = currentSum - I(i, nCols-3);
        M(i, nCols) = currentSum / 3;
    end 
end

