function CA = predictTestData(data, testData)
  number_of_images_in_test_data = rows(testData);
  number_of_images_in_train_data = rows(data);
  number_of_correct_predictions = 0;
  
  A0 = [];
  A1 = [];
  A2 = [];
  A3 = [];
  A4 = [];
  A5 = [];
  A6 = [];
  A7 = [];
  A8 = [];
  A9 = [];
  
  for i = 1:number_of_images_in_train_data
    real_digit = data(i, 1);
    data_row = data(i, :);
    if(real_digit == 0)
      A0 = [A0; data_row];
    elseif(real_digit == 1)
      A1 = [A1; data_row];
    elseif(real_digit == 2)
      A2 = [A2; data_row];
    elseif(real_digit == 3)
      A3 = [A3; data_row];
    elseif(real_digit == 4)
      A4 = [A4; data_row];
    elseif(real_digit == 5)
      A5 = [A5; data_row];
    elseif(real_digit == 6)
      A6 = [A6; data_row];
    elseif(real_digit == 7)
      A7 = [A7; data_row];
    elseif(real_digit == 8)
      A8 = [A8; data_row];
    elseif(real_digit == 9)
      A9 = [A9; data_row];
    endif
  endfor
  
  A = {A0, A1,A2,A3,A4,A5,A6,A7,A8,A9};
  
  for i = 1:number_of_images_in_test_data
    real_digit = testData(i, 1);
    test_image = testData(i, 2:end);
    predicted_digit = getDigit(A, test_image');
    if(real_digit == predicted_digit)
      number_of_correct_predictions += 1;
    endif
  endfor
  CA = number_of_correct_predictions/number_of_images_in_test_data;
