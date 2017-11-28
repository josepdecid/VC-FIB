function [ O ] = vc4_2( I, A )
    [nR, nC, nD] = size(I);
    if nD == 3
        I = rgb2gray(I);
    end
    
    h = imhist(I);
    hc = cumsum(h);
    
    DA =  (nR * nC) - A;
    lambda = find(hc >= DA, 1);
    
    O = I > lambda;
end