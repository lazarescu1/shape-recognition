% SHAPE RECOGNITION %
% TEMA 2 %

clc
close all
img = imread("images/shapes.png");
figure, imshow(img)

gray = rgb2gray(img);
figure, imshow(gray)

T = graythresh(gray);
bw = imbinarize(gray, T);
figure, imshow(bw)

se = strel("arbitrary", 5);
background = imopen(bw, se);
% figure, imshow(background)