function digits()
  data = [];
  for digit = 0:9
    data = [data, [load(strcat('./../data/svdMatrices/', num2str(digit), '.mat'))]];
  endfor
  testData = dlmread("./../data/test.csv");
  CA = predictTestData(data, testData);
  disp("Classification accuracy:");
  disp(CA);