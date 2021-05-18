function predicted_digit = getDigit(A, b)
  min_error = 9999999;
  predicted_digit = -1;
  for i = 0:9
    i
    Ai = cell2mat(A(i + 1));
    Ai = Ai(:, 2:end);
    [Ui_, Si, _] = svd(Ai);
    Ui = zeros(256,256);
    Ui(1:rows(Ui_), 1:columns(Ui_)) = Ui_;
    size(Ui)
    size(Si)
    yi = (Ui * Si') \ b
    error = norm(Ui' * b - Si' * yi);
    
    if error < min_error
      min_error = error;
      predicted_digit = i;
    endif
    
  endfor
