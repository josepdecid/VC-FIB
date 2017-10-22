function [ Out ] = vc3_3( I )
    if length(size(I)) ~= 2
        I = rgb2gray(I);
    end
    I = double(I);
    
    h = fspecial('sobel');
    Gh = imfilter(I, h);
    Gv = imfilter(I, h');
    
    G = hypot(Gh, Gv);
    Out = uint8(I + G);
end