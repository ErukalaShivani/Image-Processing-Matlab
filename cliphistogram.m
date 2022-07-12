function clipped = cliphistogram(hist, clip)
    amount = 0;
    clipped = zeros([1 256]);
    for i = 1:256
        if(hist(i) > clip)
            amount = amount + hist(i) - clip;
            clipped(i) = clip;
        else
            clipped(i) = hist(i);
        end
    end
    for i = 1:256
        clipped(i) = clipped(i) + amount/256;
    end
end
