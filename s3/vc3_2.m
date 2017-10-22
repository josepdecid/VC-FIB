function [Out] = vc3_2(I)
    if length(size(I)) ~= 2
       I = rgb2gray(I); 
    end
    Out = colfilt(I, [3, 3], 'sliding', @vc3_2_filter);
end