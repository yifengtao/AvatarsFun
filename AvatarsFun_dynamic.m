% AvatarsFun.m
clc; clear all; close all;

G = imread('imgGoku.jpg');
P = imread('imgPlant.jpg');
G = imresize(G,[300,300]);
P = imresize(P,[300,300]);

% show original figures.
figure('color', [1 1 1]);
subplot(2,3,1);
image(G);
title('color_1');
subplot(2,3,4);
image(P);
title('color_2');

% show binary figures.
tr = 220;
Gs = (G(:,:,1) > tr).*(G(:,:,2) > tr).*(G(:,:,3) > tr);
Gb = uint8(Gs*255);

tr = 220;
Ps = (P(:,:,1) > tr).*(P(:,:,2) > tr).*(P(:,:,3) > tr);
Pb = uint8(Ps*255);

colormap(gray);
subplot(2,3,2);
image(Gb);
title('binary_1');
subplot(2,3,5);
image(Pb);
title('binary_2');

% show cropped ones.
step = 100;
t = 0.0001;
[len,len] = size(Gs);
add = 1;
Gs = [ones(add),ones(add,len),ones(add);
    ones(len,add),Gs,ones(len,add);
    ones(add),ones(add,len),ones(add)];
subplot(2,3,3);
Gsd = diffuse_dynamic(Gs,step,t);
Gsd = Gsd(2:end-1,2:end-1);
Gsd = uint8(Gsd*255);

% subplot(3,2,5);
% image(Gsd);
title('cropped_1')

[len,len] = size(Ps);
add = 1;
Ps = [ones(add),ones(add,len),ones(add);
    ones(len,add),Ps,ones(len,add);
    ones(add),ones(add,len),ones(add)];
subplot(2,3,6);
Psd = diffuse_dynamic(Ps,step,t);
Psd = Psd(2:end-1,2:end-1);
Psd = uint8(Psd*255);

% subplot(3,2,6);
% image(Psd);
title('cropped_2');
fprintf('Done!\n');
% Q.E.D.