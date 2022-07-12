function equalised = findTransform(img, clip)
    s = size(img);
    img = double(img);
    hist = zeros([1 256]);
    for i = 1:s(1)
        for j = 1:s(2)
            hist(img(i,j)+1) = hist(img(i,j)+1) + 1;
        end
    end
    hist = hist/prod(s);
    hist = cliphistogram(hist, clip);
    for i = 2:256
        hist(i) = hist(i) + hist(i-1);
    end
    equalised = round(255.*hist);
end
