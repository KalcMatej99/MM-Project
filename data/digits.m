function digits()
  trainData = csvread("./../data/train.csv");
  testData = csvread("./../data/test.csv");
  data = resize(trainData);
  CA = predictTestData(data, testData);
  disp("Classification accuracy:");
  disp(CA);