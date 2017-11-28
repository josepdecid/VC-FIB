function [ I ] = vc5_1(I, sigma)
   if length(size(I)) == 3
       I = rgb2gray(I);
   end
   D = double(I);
   
   S = qtdecomp(D, @vc5_1_split, sigma);
   [x, y, s] = find(S);
   MS = [y, x, s, s];
   I = insertShape(I, 'Rec', MS, 'LineWidth', 1, 'Color', 'red');
end