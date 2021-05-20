function digits(pathTrainData = './../data/svdMatricesNearest/', pathTestData = "./../data/testNearest.csv")
  data = [];
  for digit = 0:9
    data = [data, [load(strcat(pathTrainData, num2str(digit), '.mat'))]];
  endfor
  testData = dlmread(pathTestData);
  CA = predictTestData(data, testData);
  disp("Classification accuracy:");
  disp(CA);