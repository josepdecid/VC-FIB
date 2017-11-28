function [O] = vc3_5(I, alpha, deblurSize)
    if length(size(I)) ~= 2
        I = rgb2gray(I);
    end

    half = floor(deblurSize/2);
    h = double(zeros(1, deblurSize));
    h(1, 1:half) = 1/half;
    
    hr = imrotate(h, alpha);
    O = deconvreg(I, hr, 0);
end