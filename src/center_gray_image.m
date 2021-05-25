function centered_img = center_gray_image(img, scale = 255/2, offset = 2)
  mostLeftPos = columns(img);
  mostRightPos = 1;
  mostUpperPos = rows(img);
  mostLowerPos = 1;
  for i = 1:rows(img)
    for j = 1:columns(img)
      if(img(i, j) > scale)
        mostLeftPos = min(mostLeftPos, j);
        mostRightPos = max(mostRightPos, j);
        mostUpperPos = min(mostLeftPos, i);
        mostLowerPos = max(mostLowerPos, i);
      endif
    endfor
  endfor
  
  rowStart = max(mostUpperPos - offset, 1);
  rowEnd = min(mostLowerPos + offset, rows(img));
  columnStart = max(mostLeftPos - offset, 1);
  columnEnd = min(mostRightPos + offset, columns(img));
  
  centered_img = img(rowStart:rowEnd, columnStart:columnEnd);
end