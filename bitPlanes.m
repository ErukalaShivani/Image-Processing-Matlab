function sliced = bitPlanes(img, planes)
    s = size(img);
    n = size(planes);
    n = n(2);
    sliced = zeros(s);
    for i =1:s(1)
        for j = 1:s(2)
            for k = 1:n
                sliced(i,j) = sliced(i,j) + bitand(img(i,j),bitshift(1,planes(k)-1));
            end
        end
    end
    sliced = uint8(sliced);
end
