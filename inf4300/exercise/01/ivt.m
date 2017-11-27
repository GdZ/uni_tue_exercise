%% exercise 3: I-VT and I-DT
%%% I-VT
function [fixations] = ivt(protocol, threshold)
    fixations = [];
    time = 1;
    x = 2;
    y = 3;
    D = 600;

    for i=1:size(protocol)
        if 1 == i
            continue;
        end
        point_old = protocol(i-1,:);
        point = protocol(i,:);
        velocity = atand(sqrt((point(x)-point_old(x))^2+...
                              (point(y)-point_old(y))^2)...
                            /(2*D))...
                    /(point(time)-point_old(time));

        if threshold > velocity
            fixations = point;
    %         protocol(i,:) = [];
        end
    end
end

%%% I-DT