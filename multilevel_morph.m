function FM = multilevel_morph(img, num)

img = double(img);
FM = double(zeros(size(img))); 

for ii = 1 : num
    scale = 2 * ii + 1;
    se = strel('disk', scale);
    g = imdilate(img, se) - imerode(img, se);
	FM = FM + 1 / (scale) *(g);
end

return