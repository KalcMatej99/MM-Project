function transformRGBImagesToGrayImages(resizeMethod = 'bilinear')
  filenames = ls('./../data/Slike Matej/Color');
  number_of_images = rows(filenames);
  for i = 1:number_of_images
    path_of_image = strcat('./../data/Slike Matej/Color/', filenames(i, :));
    gray_image = rgb2gray(imread(path_of_image));
    number_of_rows_of_image = rows(gray_image);
    number_of_columns_of_image = columns(gray_image);
    resized_gray_image = imresize(gray_image, [16,16], resizeMethod);
    imwrite(resized_gray_image, strcat('./../data/Slike Matej/Gray/', resizeMethod, '/', num2str(i), '.png'));
  endfor
