function adaptive = adaHist(img, ksize, clip)
    s = size(img);
    img = double(img);
    hists = double(zeros([ksize(1),ksize(2),256]));
    adaptive = zeros(s);
    xfact = s(1)/ksize(1);
    yfact = s(2)/ksize(2);
    for i = 1:ksize(1)
        for j = 1:ksize(2)
            hists(i,j,:) = findTransform(img(floor((i-1)*xfact+1):floor(i*xfact), floor((j-1)*yfact+1):floor(j*yfact)), clip);
        end
    end
    for i = 1:s(1)
        for j = 1:s(2)
            x = i/xfact + 1/2;
            y = j/yfact + 1/2;
            floorx = floor(x);
            floory = floor(y);
            ceilx = floorx+1;
            ceily = floory+1;
            if(floorx<1)
                floorx=1;
            elseif(ceilx>ksize(1))
                ceilx = ksize(1);
            end
            if(floory<1)
                floory=1;
            elseif(ceily>ksize(2))
                ceily = ksize(2);
            end
            val1 = hists(floorx, floory, img(i,j)+1);
            val2 = hists(floorx, ceily, img(i,j)+1);
            val3 = hists(ceilx, floory, img(i,j)+1);
            val4 = hists(ceilx, ceily, img(i,j)+1);
            adaptive(i,j) = val1*(1+floorx-x)*(1+floory-y) + val2*(1+floorx-x)*(y-floory) + val3*(x-floorx)*(1+floory-y) + val4*(x-floorx)*(y-floory);
        end
    end
    adaptive = uint8(adaptive);
end
