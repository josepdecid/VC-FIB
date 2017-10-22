function [] = vc2_2(I, N)
    if length(size(I)) == 3
        I = rgb2gray(I);
    end
    offset = 255/N;
    bins = 0:offset:255;
    d = discretize(I,bins);
    t = tabulate(d(:));
    r = t(:,2)';
    bar(r);
end