function saveSVDofAB()
  data = dlmread("./../data/dataMatrixWithLabelsBilinear.csv", ",");
  data = data(randperm(size(data,1)),:);
  number_of_rows = rows(data);
  trainData = data(1:floor(number_of_rows*0.7), :);
  testData = data(floor(number_of_rows*0.7) + 1:end, :);
  dlmwrite('./../data/testB.csv', testData, ",");
  number_of_images_in_train_data = rows(trainData);
  
  A = {[], [],[],[],[],[],[],[],[],[]};
  
  for i = 1:number_of_images_in_train_data
    real_digit = trainData(i, 1);
    data_row = trainData(i, :);

    Ai = cell2mat(A(real_digit + 1));
    Ai = [Ai; data_row];
    A(real_digit + 1) = Ai;
  end

  for i = 0:9
    Ai = cell2mat(A(i + 1));
    Ai = Ai(:, 2:end)';
    [Ui, Si, ~] = svd(Ai);
    structToSave.u = Ui;
    structToSave.s = Si;
    structToSave.a = Ai;
    save("-text", strcat('./../data/svdMatrices/', num2str(i), 'B.mat'), "structToSave");
  end
  