function matched = histMatch(img, match)
    s = size(img);
    hist = zeros([256 1]);
    matched = zeros(s);
    img = double(img);
    match = 255*match;
    for i = 2:256
        match(i) = match(i) + match(i-1);
    end
    for i = 1:s(1)
        for j = 1:s(2)
            hist(img(i,j)+1) = hist(img(i,j)+1) + 1;
        end
    end
    hist = 255*hist / numel(img);
    for i = 2:256
        hist(i) = hist(i) + hist(i-1);
    end
    
    trans = zeros([256 1]);
    for i = 1:256
        [~, trans(i)] = min((match-hist(i)).^2);
    end
    for i = 1:s(1)
        for j = 1:s(2)
            matched(i,j) = trans(img(i,j)+1);
        end
    end
    matched = uint8(matched);
end
