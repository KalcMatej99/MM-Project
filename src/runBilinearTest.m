function runBilinearTest()
  disp("No centering and normalization");
  transformRGBImagesToGrayImages("bilinear", false);
  transformBilinearResizedGrayImagesToBigMatrixCSV();
  saveSVDofA("./../data/dataMatrixWithLabelsBilinear.csv", './../data/svdMatricesBilinear/', "./../data/testBilinear.csv");
  digits('./../data/svdMatricesBilinear/', "./../data/testBilinear.csv");
  
  disp("With centering and normalization");
  transformRGBImagesToGrayImages("bilinear", true);
  transformBilinearResizedGrayImagesToBigMatrixCSV();
  saveSVDofA("./../data/dataMatrixWithLabelsBilinear.csv", './../data/svdMatricesBilinear/', "./../data/testBilinear.csv");
  digits('./../data/svdMatricesBilinear/', "./../data/testBilinear.csv");