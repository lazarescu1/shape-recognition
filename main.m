% SHAPE RECOGNITION %
% TEMA 2 %

clc
close all

% reading the original image
img = imread("images/shapes.png");
figure, imshow(img)

% making the rgb image gray
gray = rgb2gray(img);
figure, imshow(gray)

% binarizing the image
T = graythresh(gray);
bw = imbinarize(gray, T);
figure, imshow(bw)

% getting the edges of the geometrical shapes
% with the Sobel filter
edges = edge(bw, 'sobel');
figure, imshow(edges)