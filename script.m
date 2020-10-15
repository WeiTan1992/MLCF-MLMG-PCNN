% ----------
% Author: Wei Tan
% E-mail: twtanwei1992@163.com; wtan@stu.xidian.edu.cn
% "Multi-modal brain image fusion based on multi-level edge-preserving filtering",
% This paper has been accpted by Biomedical Signal Processing and Control
% This code is only used for research.
% Please cite this publication if you use this code.

I1 = imread('MRI.png');
J1 = rgb2hsv(I1);
L1 = J1(:,:,3);

I2 = imread('PET.png');
J2 = rgb2hsv(I2);
L2 = J2(:,:,3);


[d1_fs,d1_cs,B1] = WMC_GF_decomposition(L1);
[d2_fs,d2_cs,B2] = WMC_GF_decomposition(L2);


B_F = fusion_EA(B1,B2,4);

t = 4;
F_10 = fusion_MLMG_PCNN(d1_fs{1},d2_fs{1},t);
F_11 = fusion_MLMG_PCNN(d1_cs{1},d2_cs{1},t);
F_20 = fusion_MLMG_PCNN(d1_fs{2},d2_fs{2},t);
F_21 = fusion_MLMG_PCNN(d1_cs{2},d2_cs{2},t);
F_30 = fusion_MLMG_PCNN(d1_fs{3},d2_fs{3},t);
F_31 = fusion_MLMG_PCNN(d1_cs{3},d2_cs{3},t);

F_inten = F_10+F_11+F_20+F_21+F_30+F_31+B_F;

J2(:,:,3) = F_inten;

F = hsv2rgb(J2);

figure,imshow(I1),title('MRI')
figure,imshow(I2),title('PET')
figure,imshow(F),title('Fused Image')