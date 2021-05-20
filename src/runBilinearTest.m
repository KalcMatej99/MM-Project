function runBilinearTest()
  transformBilinearResizedGrayImagesToBigMatrixCSV();
  saveSVDofA("./../data/dataMatrixWithLabelsBilinear.csv", './../data/svdMatricesBilinear/', "./../data/testBilinear.csv");
  digits('./../data/svdMatricesBilinear/', "./../data/testBilinear.csv");