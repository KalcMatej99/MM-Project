function transformBilinearResizedGrayImagesToBigMatrixCSV()
  filenames = ls('./../data/Slike Matej/Gray/bilinear/');
  number_of_images = height(filenames)-2;
  labels = [1,1,1,1,1,1,1,2,2,2,2,2,2, 3,3,3,3,3,3,3, 4,4,4,4,4,4, 5,5,5,5,5,5, 6,6,6,6,6,6,6, 7,7,7,7,7,7,7, 8,8,8,8,8,8,8, 9,9,9,9,9,9, 0,0,0,0,0,0];
            
  dataMatrix = [];
  for i = 1:number_of_images
    path_of_image = strcat('./../data/Slike Matej/Gray/bilinear/', filenames(i+2, :));
    label = labels(i);
    gray_image = imread(path_of_image);
    reshaped_gray_image = reshape(gray_image', [1, 256]);
    reshaped_gray_image_with_label = [label, reshaped_gray_image];
    dataMatrix = [dataMatrix; reshaped_gray_image_with_label];
  end

  filenames = ls('./../data/Slike Andraž/Gray/Bilinear/');
  number_of_images = height(filenames)-2;
  labels = [0,0,0,0,0,0,0,0, 1,1,1,1,1,1,1,1,2,2,2,2,2,2,2,2, 3,3,3,3,3,3,3,3, 4,4,4,4,4,4,4,4, 5,5,5,5,5,5,5,5, 6,6,6,6,6,6,6,6, 7,7,7,7,7,7,7,7, 8,8,8,8,8,8,8,8, 9,9,9,9,9,9,9,9];
            
  for i = 1:number_of_images
    path_of_image = strcat('./../data/Slike Andraž/Gray/Bilinear/', filenames(i+2, :));
    label = labels(i);
    gray_image = imread(path_of_image);
    reshaped_gray_image = reshape(gray_image', [1, 256]);
    reshaped_gray_image_with_label = [label, reshaped_gray_image];
    dataMatrix = [dataMatrix; reshaped_gray_image_with_label];
  end
  dlmwrite('./../data/dataMatrixWithLabelsBilinear.csv', dataMatrix, ",");