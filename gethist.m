function hist = gethist(img)
    hist = zeros([256 1]);
    s = size(img);
    for i = 1:s(1)
        for j = 1:s(2)
            hist(img(i,j)+1) = hist(img(i,j)+1)+1;
        end
    end
    hist = hist/prod(s);
end
