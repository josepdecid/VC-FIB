I = imread('wheel.bmp');
GLI = rgb2gray(I);
imshow(GLI);
BW = GLI > 20;

% Disk amb radi = 6
SE = strel('disk', 6);


% Erosionar
EI = imerode(BW, SE);
subplot(2, 4, 1); imshow(EI);
% Obrir
OI = imopen(BW, SE);
subplot(2, 4, 2); imshow(OI);
% Tancar
CI = imclose(BW, SE);
subplot(2, 4, 3); imshow(CI);
% Dilatar
DI = imdilate(BW, SE);
subplot(2, 4, 4); imshow(DI);

% Omplim el centre (innecessari)
BW = imfill(BW, 'holes');

EIC = BW * 255 - EI * 128;
subplot(2, 4, 1); imshow(EIC);
OIC = BW * 255 - OI * 128;
subplot(2, 4, 2); imshow(OIC);
CIC = BW * 255 - CI * 128;
subplot(2, 4, 3); imshow(CIC);
DIC = BW * 255 - DI * 128;
subplot(2, 4, 4); imshow(DIC);

%%%%% CAFE %%%%%

I = imread('cafe.tif');
BW = I < 16; imshow(BW);
SE = strel('disk', 9);
EI = imerode(BW, SE);
DT = bwdist(1 - BW, 'euclidean');
BDT = DT > 8.5;
C = bwconncomp(BDT);
C.NumObjects

BM = bwmorph(BW, 'shrink');
% srink -> Ultimate erode
% remove -> Deixa només 1px de frontera.
% skel -> Esquelet de l'objecte
% clean -> Treu píxels individuals