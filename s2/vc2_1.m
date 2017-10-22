function [coords] = vc2_1(i)
    if (length(size(i)) == 3)
        i = rgb2gray(i);
    end
    i = double(i);
    
    [rows, ~] = size(i);
    ip = i(:, 2:end);
    ip = horzcat(ip, zeros(rows, 1));
    sub = abs(i - ip);
    sub = sub(:, 1:(end-1));
    [~, max_index] = max(sub(:));
    [x, y] = ind2sub(size(sub), max_index);
    coords = [x, y+1];
end