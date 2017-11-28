function [best] = vc_8(n)
    I = imread('images/chess_inline.png');
    best = 0;
    for i = 1:n
        pred = vc_8_train(I);
        current = vc_8_test(I, pred);
        best = max(best, current); 
    end
end

