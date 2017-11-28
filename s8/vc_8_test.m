function [ accuracy ] = vc_8_test(I, pred)
    x = vc_8_pre(I);
    
    [~, scores]= predict(pred, x);
    
    scores = sort(scores, 'descend');
    accuracy = sum(scores(1,:) - scores(2,:));
end