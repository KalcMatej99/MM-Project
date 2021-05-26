function normalized_img = normalize_gray_image(img)
  maxValue = max(max(img));
  normalized_img = img * (255/maxValue);
  
  normalized_img = (255 - normalized_img);
  maxValue = max(max(normalized_img));
  normalized_img = 255 - (normalized_img * (255/maxValue));
  
  normalized_img = round(normalized_img);
  normalized_img(normalized_img > 255) = 255;
  normalized_img(normalized_img < 0) = 0;