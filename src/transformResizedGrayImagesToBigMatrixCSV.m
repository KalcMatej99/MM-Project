function transformResizedGrayImagesToBigMatrixCSV()
  filenames = ls('./../data/Slike Matej/Gray/nearest/');
  number_of_images = rows(filenames);
  labels = [1,1,1,1,1,1,1,2,2,2,2,2,2, 3,3,3,3,3,3,3, 4,4,4,4,4,4, 5,5,5,5,5,5, 6,6,6,6,6,6,6, 7,7,7,7,7,7,7, 8,8,8,8,8,8,8, 9,9,9,9,9,9, 0,0,0,0,0,0];
            
  dataMatrix = [];
  for i = 1:number_of_images
    path_of_image = strcat('./../data/Slike Matej/Gray/nearest/', filenames(i, :));
    label = labels(i);
    gray_image = imread(path_of_image);
    reshaped_gray_image = reshape(gray_image', [1, 256]);
    reshaped_gray_image_with_label = [label, reshaped_gray_image];
    dataMatrix = [dataMatrix; reshaped_gray_image_with_label];
  endfor
  dlmwrite('./../data/dataMatrixWithLabels.csv', dataMatrix, ",");