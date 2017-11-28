function [ O ] = vc4_3(I, W, K)
    if length(size(I)) == 3
        I = rgb2gray(I);
    end
    
    O = colfilt(I, W, 'sliding', @vc4_3_filter, K);
end