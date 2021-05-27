function runBilinearTest()
    ca_mp_all = [];
    ca_svd_all_max = [];
    disp("No centering and normalization");
    transformRGBImagesToGrayImages("bilinear", false);
    transformBilinearResizedGrayImagesToBigMatrixCSV();
    for i = 0:9
      saveSVDofA("./../data/dataMatrixWithLabelsBilinear.csv", './../data/svdMatricesBilinear/', "./../data/testBilinear.csv");
      [ca_mp, ca_svd] = digits('./../data/svdMatricesBilinear/', "./../data/testBilinear.csv");
      ca_mp_all = [ca_mp_all, ca_mp];
      ca_svd_all_max = [ca_svd_all_max, max(ca_svd)];
    end
    disp("AVG CA_MP:");
    disp(mean(ca_mp_all));
    disp("AVG CA_SVD:");
    disp(mean(ca_svd_all_max));
    
    ca_mp_all = [];
    ca_svd_all_max = [];
    disp("With centering and normalization");
    transformRGBImagesToGrayImages("bilinear", true);
    transformBilinearResizedGrayImagesToBigMatrixCSV();
    for i = 0:9
      saveSVDofA("./../data/dataMatrixWithLabelsBilinear.csv", './../data/svdMatricesBilinear/', "./../data/testBilinear.csv");
      [ca_mp, ca_svd] = digits('./../data/svdMatricesBilinear/', "./../data/testBilinear.csv");
      ca_mp_all = [ca_mp_all, ca_mp];
      ca_svd_all_max = [ca_svd_all_max, max(ca_svd)];
    end
    disp("AVG CA_MP:");
    disp(mean(ca_mp_all));
    disp("AVG CA_SVD:");
    disp(mean(ca_svd_all_max));
end