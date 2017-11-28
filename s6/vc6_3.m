function [ I ] = vc6_3(I)
    GLI = rgb2gray(I);
    BW = GLI > 220;
    BW = imfill(1 - BW, 'holes');
    
    SE = strel('disk', 15);
    BW = imopen(BW, SE);
    
    SE = strel('disk', 10);
    BW = imdilate(BW, SE);
    C = bwconncomp(BW);
    npixels = cellfun(@numel, C.PixelIdxList);
    [~, minInd] = min(npixels);
    
    S = regionprops(C, 'centroid');
    pos = struct2array(S(minInd));
    pos = vec2mat(pos, 2);
    
    I = insertMarker(I, pos, 'x', 'size', 15, 'color', 'black');
end

