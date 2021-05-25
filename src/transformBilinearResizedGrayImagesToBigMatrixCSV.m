function transformBilinearResizedGrayImagesToBigMatrixCSV()
  dataMatrix = [];
  for(digit = 0:9)
    filenames = ls(strcat('./../data/Slike Matej/Gray/bilinear/', num2str(digit)));
    for i = 1:rows(filenames)
      path_of_image = strcat('./../data/Slike Matej/Gray/bilinear/', num2str(digit), "/", filenames(i, :));
      gray_image = imread(path_of_image);
      reshaped_gray_image = reshape(gray_image', [1, 256]);
      reshaped_gray_image_with_label = [digit, reshaped_gray_image];
      dataMatrix = [dataMatrix; reshaped_gray_image_with_label];
    end
  end

  filenames = ls('./../data/Slike Andraž/Gray/Bilinear/');
  labels = [0,0,0,0,0,0,0,0,0,0,0,0, 1,1,1,1,1,1,1,1,1,1,1,1,2,2,2,2,2,2,2,2,2,2,2,2, 3,3,3,3,3,3,3,3,3,3,3,3, 4,4,4,4,4,4,4,4,4,4,4,4, 5,5,5,5,5,5,5,5,5,5,5,5, 6,6,6,6,6,6,6,6,6,6,6,6, 7,7,7,7,7,7,7,7,7,7,7,7, 8,8,8,8,8,8,8,8,8,8,8,8, 9,9,9,9,9,9,9,9,9,9,9,9];
            
  for i = 1:length(labels)
    path_of_image = strcat('./../data/Slike Andraž/Gray/Bilinear/', filenames(i, :));
    label = labels(i);
    gray_image = imread(path_of_image);
    reshaped_gray_image = reshape(gray_image', [1, 256]);
    reshaped_gray_image_with_label = [label, reshaped_gray_image];
    dataMatrix = [dataMatrix; reshaped_gray_image_with_label];
  end
  
  filenames = ls('./../data/Slike Samo/Gray/Bilinear/');
  %labels = [0,0,0,0,0,0,0,0,0,0,0,0, 1,1,1,1,1,1,1,1,1,1,1,1,2,2,2,2,2,2,2,2,2,2,2,2, 3,3,3,3,3,3,3,3,3,3,3,3, 4,4,4,4,4,4,4,4,4,4,4,4, 5,5,5,5,5,5,5,5,5,5,5,5, 6,6,6,6,6,6,6,6,6,6,6,6, 7,7,7,7,7,7,7,7,7,7,7,7, 8,8,8,8,8,8,8,8,8,8,8,8, 9,9,9,9,9,9,9,9,9,9,9,9];
            
  for i = 1:100
    path_of_image = strcat('./../data/Slike Samo/Gray/Bilinear/', filenames(i, :));
    label = mod(i, 10);
    gray_image = imread(path_of_image);
    reshaped_gray_image = reshape(gray_image', [1, 256]);
    reshaped_gray_image_with_label = [label, reshaped_gray_image];
    dataMatrix = [dataMatrix; reshaped_gray_image_with_label];
  end
  
  dlmwrite('./../data/dataMatrixWithLabelsBilinear.csv', dataMatrix, ",");