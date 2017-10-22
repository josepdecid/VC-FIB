function [ C ] = vc2_4(A, B, T)
    transfObj = affine2d(T);
    sA = size(A);
    sB = size(B);
    offset = 500;
    isize = max([sA(1), sA(2), sB(1), sB(2)]) +
        + offset + max(T(3, 1), T(3, 2));
    ref = imref2d([2*isize, 2*isize], [-isize, isize], [-isize, isize]);
    Imoved = imwarp(A, transfObj, 'OutputView', ref);

    T = transpose(T);
    p1 = (T*[1 ; 1 ; 1])';
    p2 = (T*[sA(2) ; 1 ; 1])';
    p3 = (T*[1 ; sA(1) ; 1])';
    p4 = (T*[sA(2) ; sA(1) ; 1])';

    rmax = floor(max(max([p1(2), p2(2), p3(2), p4(2)]), sB(1))) + isize;
    cmax = floor(max(max([p1(1), p2(1), p3(1), p4(1)]), sB(2))) + isize;

    rmin = floor(min(min([p1(2), p2(2), p3(2), p4(2)]), 1)) + isize;
    cmin = floor(min(min([p1(1), p2(1), p3(1), p4(1)]), 1)) + isize;
    
    if length(sA) == 3
        if length(sB) == 2
            B = cat(3, B, B, B);
        end
        Imoved(isize:(isize+sB(1)-1), isize:(isize+sB(2)-1), :) = B;
        C = Imoved(rmin:rmax, cmin:cmax, :);
    else
        if length(sB) == 3
            B = rgb2gray(B);
        end
        Imoved(isize:(isize+sB(1)-1), isize:(isize+sB(2)-1)) = B;
        C = Imoved(rmin:rmax, cmin:cmax);
    end
end