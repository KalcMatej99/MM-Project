function digits()
  data = dlmread("./../data/dataMatrixWithLabels.csv", ",");
  data = data(randperm(size(data,1)),:);
  number_of_rows = rows(data);
  trainData = data(1:floor(number_of_rows*0.7), :);
  testData = data(floor(number_of_rows*0.7 + 1):end, :);
  CA = predictTestData(trainData, testData);
  disp("Classification accuracy:");
  disp(CA);