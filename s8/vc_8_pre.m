function [ x ] = vc_8_pre(I)
    GLI = rgb2gray(I);
    GLI = imgaussfilt(GLI, 2);
    BW = GLI < 50;
    BW1 = bwpropfilt(BW, 'Area', 6);
    BW2 = imfill(BW, 'holes'); 
    
    CC = bwconncomp(BW1);
    props1 = regionprops(CC, 'Extent', 'Eccentricity', 'Solidity', 'EulerNumber');
    
    CC = bwconncomp(BW2);
    props2 = regionprops(CC, 'Extent', 'MajorAxisLength', 'MinorAxisLength', 'Solidity');
    
    x1 = cell2mat(struct2cell(props1))';
    x2 = cell2mat(struct2cell(props2))';
    x = horzcat(x1, x2);
end

