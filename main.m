% SHAPE RECOGNITION %
% TEMA 2 %

clc
clear
close all

% Read the image
img = imread('images/shapes.png');

% Convert to gray scale
gray = rgb2gray(img);

% Binarize the image
T = 0.89;
bw = imbinarize(gray, T);

% Morphological operations
se = strel('square', 5);
bw_clean = imopen(bw, se);
bw_clean = ~bw_clean;

% Labeling
[label, num_obj] = bwlabel(bw_clean, 4);
label_color = label2rgb(label, @spring, "c", "shuffle");
% figure, imshow(label_color), title('Labeled Regions')

% Get properties
props = regionprops(logical(label), 'Area', 'Perimeter', 'Eccentricity', ...
                    'Extent', 'BoundingBox', 'Centroid', 'Solidity', ...
                    'EulerNumber', 'Orientation', 'MajorAxisLength', ...
                    'MinorAxisLength');

img_annotated = img;
for i = 1 : num_obj
    region_mask = label == i;

    if props(i).Eccentricity >= 0.4890 && props(i).Eccentricity <= 0.5050
        if props(i).EulerNumber == 0
            shape = 'Triunghi cu gaura';
        elseif props(i).Orientation == -90
            shape = 'Triunghi cu varful in jos';
        else
            shape = 'Triunghi cu varful in sus';
        end
    end

    % B = bwboundaries(region_mask);
    % boundary = B{1};
    % tol = 0.01;
    % simplified = reducepoly(boundary, tol);

    % centroid = props(i).Centroid;
    % img_annotated = insertText(img_annotated, centroid, shape, ...
    %     'BoxColor', 'white', 'TextColor', 'black', 'FontSize', 14);
    % 
    %  img_annotated = insertShape(img_annotated, 'Rectangle', props(i).BoundingBox, ...
    %     'Color', 'green', 'LineWidth', 2);
end


imshow(img_annotated);
title('Detected Shapes');