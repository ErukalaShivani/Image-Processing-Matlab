function output = tiePoints(img, points, points_original, s)
    output = zeros(s);
    s1 = size(img);
    X = [points_original(1,1)-0.5 ; points_original(1,2)-0.5 ; points_original(2,1)-0.5 ; points_original(2,2)-0.5 ; points_original(3,1)-0.5 ; points_original(3,2)-0.5 ; points_original(4,1)-0.5 ; points_original(4,2)-0.5];
    M = [points(1,1)-0.5 points(1,2)-0.5 (points(1,1)-0.5)*(points(1,2)-0.5) 1 0 0 0 0;
             0 0 0 0 points(1,1)-0.5 points(1,2)-0.5 (points(1,1)-0.5)*(points(1,2)-0.5) 1;
             points(2,1)-0.5 points(2,2)-0.5 (points(2,1)-0.5)*(points(2,2)-0.5) 1 0 0 0 0;
             0 0 0 0 points(2,1)-0.5 points(2,2)-0.5 (points(2,1)-0.5)*(points(2,2)-0.5) 1;
             points(3,1)-0.5 points(3,2)-0.5 (points(3,1)-0.5)*(points(3,2)-0.5) 1 0 0 0 0;
             0 0 0 0 points(3,1)-0.5 points(3,2)-0.5 (points(3,1)-0.5)*(points(3,2)-0.5) 1;
             points(4,1)-0.5 points(4,2)-0.5 (points(4,1)-0.5)*(points(4,2)-0.5) 1 0 0 0 0;
             0 0 0 0 points(4,1)-0.5 points(4,2)-0.5 (points(4,1)-0.5)*(points(4,2)-0.5) 1];
    C = M\X;
    for i = 1:s(1)
        for j = 1:s(2)
            x = C(1)*(i-0.5) + C(2)*(j-0.5) + C(3)*(i-0.5)*(j-0.5) + C(4);
            y = C(5)*(i-0.5) + C(6)*(j-0.5) + C(7)*(i-0.5)*(j-0.5) + C(8);
            X= floor(x+0.5);
            Y = floor(y+0.5);
            Xdash = X+1;
            Ydash = Y+1;
            if(X<1)
                X = 1;
                Xdash = 1;
            elseif(X>=s1(1))
                X = s1(1);
                Xdash = s1(1);
            end
            if(Y<1)
                Y = 1;
                Ydash = 1;
            elseif(Y>=s1(2))
                Y = s1(2);
                Ydash = s1(2);
            end
            val1 = img(X,Y);
            val2 = img(X,Ydash);
            val3 = img(Xdash,Y);
            val4 = img(Xdash,Ydash);
            output(i, j) = round(val1*(1-x+X-0.5)*(1-y+Y-0.5) + val2*(1-x+X-0.5)*(y-Y+0.5) + val3*(x-X+0.5)*(1-y+Y-0.5) + val4*(x-X+0.5)*(y-Y+0.5));
        end
    end
    output = uint8(output);
end
