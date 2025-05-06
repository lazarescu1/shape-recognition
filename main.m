% SHAPE RECOGNITION %
% TEMA 2 %

clc
close all

% reading the original image
img = imread('images/shapes.png');
% figure, imshow(img), title('Original image')

% making the rgb image gray
gray = rgb2gray(img);
% figure, imshow(gray)

% binarizing the image
T = 0.89;
bw = imbinarize(gray, T);
% figure, imshow(bw)

% imopen
se = strel('square', 5);
bw_clean = imopen(bw, se);
% figure, imshow(bw_clean)
bw_clean = ~bw_clean;

% getting the edges of the geometrical shapes
% using the Canny filter
edges = edge(bw_clean, 'canny');
% figure, imshow(edges)

% getting object labels
[label, num_obj] = bwlabel(bw_clean, 4);
% verifying if all objects are detected
label_color = label2rgb(label, @spring, "c", "shuffle");
figure, imshow(label_color)

% region props
props = regionprops(logical(label), 'Area', 'Perimeter', 'Eccentricity', 'Extent', 'BoundingBox', 'Centroid', 'Solidity');