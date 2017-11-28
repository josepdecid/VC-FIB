function [ pred ] = vc_8_train( I )
    x = vc_8_pre(I);
    y = ['K'; 'Q'; 'T'; 'H'; 'B'; 'P'];
    
    pred = TreeBagger(100, x, y);
end