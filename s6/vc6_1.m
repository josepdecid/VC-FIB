function [ Comp ] = vc6_1 ( I )
    GLI = rgb2gray(I);
    BW = GLI > 20;
    BW = imfill(BW, 'holes');
    
    SE = strel('disk', 5);
    I = BW - imopen(BW, SE);
    I = bwmorph(I, 'clean');
    
    C = bwconncomp(I);
    Comp = C.NumObjects;
end

