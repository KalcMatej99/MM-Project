function CA = predictTestData(data, testData)
  number_of_images_in_test_data = nrows(testData);
  number_of_correct_predictions = 0;
  for i = 1:number_of_images_in_test_data
    real_digit = testData(i, 1);
    test_image = testData(i, 2:);
    predicted_digit = getDigit(data, test_image');
    if real_digit == predicted_digit:
      number_of_correct_predictions += 1
    endif
  endfor
  CA = number_of_correct_predictions/number_of_images_in_test_data;
