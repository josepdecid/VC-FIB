function [ I ] = examen(I)
    [w, h, ~] = size(I);

    GLI = rgb2gray(I);
    % Remove frames (pure white)
    GLI(GLI == 255) = 0;
    BW = GLI > 20;
    
    SE = strel('disk', 5);
    % Remove little residuals
    BW = imopen(BW, SE);
    BW = imfill(BW, 'holes');
    
    DT = bwdist(~BW, 'euclidean');
    DT = -DT;
    DT(~BW) = Inf;
    
    IM = imhmin(DT, 1);
    
    WS = watershed(IM);
    WS(~BW) = 0;
    WS = WS > 0;
    
    % Create edges to paint into original image
    Edges = bwmorph(WS, 'remove');
    SE = strel('disk', 1);
    Edges = imdilate(Edges, SE);
    Edges = Edges * 255;
    Zeros = zeros(w, h);
    % Convert to RGB matrix
    Edges = cat(3, Zeros, Edges, Zeros);
    Edges = uint8(Edges);
    % Soft edges with a Gaussian filter
    Edges = imgaussfilt(Edges, 1);
    
    % Set markers
    I = I + Edges;
end