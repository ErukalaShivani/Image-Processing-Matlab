function rotated = rotate(img, angle)
    s = size(img);
    rotated = zeros(ceil(s(1)*abs(cos(angle*pi/180)) + s(2)*abs(sin(angle*pi/180))), ceil(s(1)*abs(sin(angle*pi/180)) + s(2)*abs(cos(angle*pi/180)))); 
    s1 = double(size(rotated));
    img = double(img);
    matrix = [cos(angle*pi/180) sin(angle*pi/180); -1*sin(angle*pi/180) cos(angle*pi/180)];
    if(mod(angle,180)==0)
        rotated = zeros(s);
        s1 = double(s);
    elseif(mod(angle,90) == 0)
        rotated = zeros([s(2) s(1)]);
        s1 = double([s(2) s(1)]);
    end
    for i = 1:s1(1)
        for j = 1:s1(2)
            new = matrix*[i - s1(1)/2 - 0.5; j - s1(2)/2 - 0.5];
            x = new(1,1)+ s(1)/2;
            y = new(2,1)+ s(2)/2;
            X= round(x);
            Y = round(y);
            Xdash = X+1;
            Ydash = Y+1;
            if(X<0)
                continue;
            elseif(X>s(1))
                continue;
            end
            if(Y<0)
                continue;
            elseif(Y>s(2))
                continue;
            end
            if(X==0 || Y==0)
                val1 = 0;
            else
                val1 = img(X,Y);
            end
            if(X==0 || Ydash==s(2)+1)
                val2 = 0;
            else
                val2 = img(X,Ydash);
            end
            if(Y==0 || Xdash==s(1)+1)
                val3 = 0;
            else
                val3 = img(Xdash,Y);
            end
            if(Xdash == s(1)+1 || Ydash == s(2)+1)
                val4 = 0;
            else
                val4 = img(Xdash,Ydash);
            end
            rotated(i, j) = (val1*(1-x+X-0.5)*(1-y+Y-0.5) + val2*(1-x+X-0.5)*(y-Y+0.5) + val3*(x-X+0.5)*(1-y+Y-0.5) + val4*(x-X+0.5)*(y-Y+0.5));
        end
    end
    rotated = uint8(rotated);
end
