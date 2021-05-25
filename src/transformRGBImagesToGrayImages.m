function transformRGBImagesToGrayImages(resizeMethod = 'bilinear')
  for digit = 0:9
    filenames = ls(strcat('./../data/Slike Matej/Color/', num2str(digit)));
    number_of_images = rows(filenames);
    for i = 1:number_of_images
      path_of_image = strcat('./../data/Slike Matej/Color/', num2str(digit), "/", filenames(i, :));
      if isrgb(imread(path_of_image))
        gray_image = rgb2gray(imread(path_of_image));
      else
        gray_image = imread(path_of_image);
      endif
      centered_gray_image = center_gray_image(gray_image);
      resized_gray_image = imresize(centered_gray_image, [16,16], resizeMethod);
      imwrite(resized_gray_image, strcat('./../data/Slike Matej/Gray/', resizeMethod, '/', num2str(digit), '/', num2str(i), '.png'));
    endfor
    
  endfor
  
  filenames = ls(strcat('./../data/Slike Andraž/Color/'));
  number_of_images = rows(filenames);
  for i = 1:number_of_images
    path_of_image = strcat('./../data/Slike Andraž/Color/', filenames(i, :));
    if isrgb(imread(path_of_image))
      gray_image = rgb2gray(imread(path_of_image));
    else
      gray_image = imread(path_of_image);
    endif
    centered_gray_image = center_gray_image(gray_image);
    resized_gray_image = imresize(centered_gray_image, [16,16], resizeMethod);
    imwrite(resized_gray_image, strcat('./../data/Slike Andraž/Gray/', resizeMethod, '/', num2str(i), '.png'));
  endfor
  
  
  filenames = ls(strcat('./../data/Slike Samo/Color/'));
  number_of_images = rows(filenames);
  for i = 1:number_of_images
    path_of_image = strcat('./../data/Slike Samo/Color/', filenames(i, :));
    if isrgb(imread(path_of_image))
      gray_image = rgb2gray(imread(path_of_image));
    else
      gray_image = imread(path_of_image);
    endif
    centered_gray_image = center_gray_image(gray_image);
    resized_gray_image = imresize(centered_gray_image, [16,16], resizeMethod);
    label = mod(i,10);
    imwrite(resized_gray_image, strcat('./../data/Slike Samo/Gray/', resizeMethod, '/', num2str(label), '.png'));
  endfor
  
  
