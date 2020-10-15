function [d_fs,d_cs,B] = WMC_GF_decomposition(I)

Iteration = 2;
s = 20;
r = 2;
Ic1 = wmcFilter(I,Iteration);
GaussianFilter_1 = fspecial('gaussian',[2*r+1, 2*r+1],s);
Ig1 = imfilter(I,GaussianFilter_1,'conv');
Ic2 = wmcFilter(Ic1,Iteration);
GaussianFilter_2 = fspecial('gaussian',[2*r+1, 2*r+1],s);
Ig2 = imfilter(Ig1,GaussianFilter_2,'conv');
Ic3 = wmcFilter(Ic2,Iteration);
GaussianFilter_3 = fspecial('gaussian',[2*r+1, 2*r+1],s);
Ig3 = imfilter(Ig2,GaussianFilter_3,'conv');

d10 = I-Ic1;
d11 = Ic1-Ig1;
d20 = Ig1-Ic2;
d21 = Ic2-Ig2;
d30 = Ig2-Ic3;
d31 = Ic3-Ig3;

d_fs{1} = d10;
d_fs{2} = d20;
d_fs{3} = d30;
d_cs{1} = d11;
d_cs{2} = d21;
d_cs{3} = d31;
B = Ig3;
