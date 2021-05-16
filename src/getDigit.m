function predicted_digit = getDigit(data, b)
  
  min_error = 9999999;
  predicted_digit = -1;
  for i = 0:9
    Ai = data[i + 1];
    [Ui, Si, _] = svd(Ai);
    yi = pinv(Ui * Si) * b;
    error = norm(Ui' * b - Si * yi);
    
    if error < min_error
      min_error = error;
      predicted_digit = i;
    endif
    
  endfor
