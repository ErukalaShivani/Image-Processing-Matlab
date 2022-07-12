function equalised = histEqualise(img)
    s = size(img);
    hist = zeros([256 1]);
    equalised = zeros(s);
    for i = 1:s(1)
        for j = 1:s(2)
            hist(img(i,j)+1) = hist(uint32(img(i,j))+1) + 1;
        end
    end
    hist = hist/(s(1)*s(2));
    for i = 2:256
        hist(i) = hist(i) + hist(i-1);
    end
    for i = 1:s(1)
        for j = 1:s(2)
            equalised(i,j) = (255*hist(img(i,j)+1));
        end
    end
    equalised = uint8(equalised);
end
