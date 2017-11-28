%%% I-DT
function [ fixations ] = idt(protocol)
    % dispersion, duration
    fixations = [];
    time = 1;
    x = 2;
    y = 3;
    D = 600;

    for i=1:length(protocol)
        % initialize window over first points to cover the duration thershold
        if 1 == i
            point = protocol(1,:);
            duration = point(1, time) + 100000;
            continue;
        end
        % calculation dispersion
        % if calculation of window points <= thershold
        if 
        % else remove this point from points
        else
        end
    end

end


