function [ I, count ] = vc6_2 ( I )
    GLI = rgb2gray(I);
    BW = GLI > 220;
    BW = imfill(1 - BW, 'holes');
    
    % Create disk SE radius 16
    SE = strel('disk', 16);
    BW = imopen(BW, SE);
    
    % Divide inner and outer cells
    OuterBlood = 1 - imfill(1 - BW, 'holes');
    InnerBlood = BW - OuterBlood;
    
    % Inner cells
    DT = bwdist(1 - InnerBlood, 'euclidean');
    InnerBlood = DT > 30;
    
    % Outer cells
    DT = bwdist(1 - OuterBlood, 'euclidean');
    RM = imregionalmax(DT);
    OuterBlood = imdilate(RM, SE);
    
    % Mix inner and outer
    Blood = InnerBlood + OuterBlood;
    
    % Get centroid positions
    C = bwconncomp(Blood);
    S = regionprops(C, 'centroid');
    pos = struct2array(S);
    pos = vec2mat(pos, 2);
    
    % Set markers
    I = insertMarker(I ,pos, 'x', 'size', 15, 'color', 'black');
    count = C.NumObjects;
end

