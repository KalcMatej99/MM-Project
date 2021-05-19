function saveSVDofA()
  data = dlmread("./../data/dataMatrixWithLabels.csv", ",");
  data = data(randperm(size(data,1)),:);
  number_of_rows = rows(data);
  trainData = data(1:floor(number_of_rows*0.7), :);
  testData = data(floor(number_of_rows*0.7) + 1:end, :);
  dlmwrite('./../data/test.csv', testData, ",");
  number_of_images_in_train_data = rows(trainData);
  
  A = {[], [],[],[],[],[],[],[],[],[]};
  
  for i = 1:number_of_images_in_train_data
    real_digit = trainData(i, 1);
    data_row = trainData(i, :);

    Ai = cell2mat(A(real_digit + 1));
    Ai = [Ai; data_row];
    A(real_digit + 1) = Ai;
  endfor

  for i = 0:9
    Ai = cell2mat(A(i + 1));
    Ai = Ai(:, 2:end)';
    [Ui, Si, _] = svd(Ai);
    structToSave.u = Ui;
    structToSave.s = Si;
    structToSave.a = Ai;
    save("-text", strcat('./../data/svdMatrices/', num2str(i), '.mat'), "structToSave");
  endfor
  