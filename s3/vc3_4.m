function [O] = vc3_4(I, alpha, blurSize)
    if length(size(I)) ~= 2
        I = rgb2gray(I);
    end

    half = floor(blurSize/2);
    h = double(zeros(1, blurSize));
    h(1, 1:half) = 1/half;
    
    hr = imrotate(h, alpha);
    O = imfilter(I, hr, 'conv', 'circular');
end

