function resized = resizeBL(img, target)
    resized = zeros(target);
    img = double(img);
    s = double(size(img));
    for i = 1:target(1)
        for j = 1:target(2)
            x = (i-0.5)*s(1)/target(1);
            y = (j-0.5)*s(2)/target(2);
            X= floor(x+0.5);
            Y = floor(y+0.5);
            Xdash = X+1;
            Ydash = Y+1;
            if(X<1)
                X = 1;
                Xdash = 1;
            elseif(X>=s(1))
                X = s(1);
                Xdash = s(1);
            end
            if(Y<1)
                Y = 1;
                Ydash = 1;
            elseif(Y>=s(2))
                Y = s(2);
                Ydash = s(2);
            end
            val1 = img(X,Y);
            val2 = img(X,Ydash);
            val3 = img(Xdash,Y);
            val4 = img(Xdash,Ydash);
            resized(i, j) = (val1*(1-x+X-0.5)*(1-y+Y-0.5) + val2*(1-x+X-0.5)*(y-Y+0.5) + val3*(x-X+0.5)*(1-y+Y-0.5) + val4*(x-X+0.5)*(y-Y+0.5));
        end
    end
    resized = uint8(resized);
end
