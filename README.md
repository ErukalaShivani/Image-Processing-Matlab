Image-Processing-Matlab


Implementation of some functions like resize, rotate, histogram equalisation, adaptive histogram equalisation, histogram matching, bit plane slicing and tie point reconstruction from the image processing toolbox in Matlab.

adaHist(img, ksize, clip): Returns adaptive histogram equalised img with grid size, ksize and contrast clipped at clip.

bitPlanes(img, planes): Returns img reconstructed from planes in the planes list.

histEqualise(img): Returns equalised img image.

histMatch(img, match): Returns img after matching its histogram with match histogram.

resizeBL(img, target): Returns resized img with size target using bilinear interpolation.

resizeNN(img, target): Returns resized img with size target using nearest neighbor interpolation.

rotate(img, angle): Returns img rotated by angle.

tiePoints(img, points, points_original, size): Returns affine transformed image of size size by using two sets of four tie points, points in img and points_original.
