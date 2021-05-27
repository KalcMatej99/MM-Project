function [CA_MP, CA_SVD] = digits(pathTrainData = './../data/svdMatricesNearest/', pathTestData = "./../data/testNearest.csv")
  data = [];
  for digit = 0:9
    data = [data, [load(strcat(pathTrainData, num2str(digit), '.mat'))]];
  endfor
  testData = dlmread(pathTestData);
  
  CA_MP = predictTestData(data, testData, false);
  CA_SVD = [];
  for k = 1:columns(data(1).structToSave.s)
    CA_SVD = [CA_SVD, predictTestData(data, testData, true, k)];
  end
  disp("Classification accuracy for MP:");
  disp(CA_MP);
  disp("Classification accuracy for SVD:");
  disp(max(CA_SVD));
  
  figure
  plot(CA_SVD);
  xlabel("k");
  ylabel("CA");
end