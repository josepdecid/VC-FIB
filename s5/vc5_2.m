function [ Out ] = vc5_2( I )
    [w, h, ~] = size(I);
    
    HSV = rgb2hsv(I);
    H = HSV(:,:,1);
    S = HSV(:,:,2);
    V = HSV(:,:,3);
    
    O = [H(:), S(:), V(:)];
    C = kmeans(O, 4);
    
    IKM = reshape(C, w, h);
    IKM = uint8(IKM) * (255 / 4);
    
    thresh = graythresh(IKM);
    BW = imbinarize(IKM, thresh);
    C = bwconncomp(BW);
   
    Out = I;
    npixels = cellfun(@numel, C.PixelIdxList);
    [~, maxInd] = max(npixels);
    
    Out(C.PixelIdxList{maxInd}) = 0;
    Out(C.PixelIdxList{maxInd} + (w*h)) = 255;
    Out(C.PixelIdxList{maxInd} + (w*h*2)) = 0;
end