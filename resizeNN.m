function resized = resizeNN(img, target)
    resized = zeros(target);
    s = size(img);
    for i = 1:target(1)
        for j = 1:target(2)
            x = (i-0.5)*s(1)/target(1);
            y = (j-0.5)*s(2)/target(2);
            X= round(x+0.5);
            Y = round(y+0.5);
            if(X<1)
                X = 1;
            elseif(X>=s(1))
                X = s(1);
            end
            if(Y<1)
                Y = 1;
            elseif(Y>=s(2))
                Y = s(2);
            end
            resized(i, j) = img(X,Y);
        end
    end
    resized = uint8(resized);
end
