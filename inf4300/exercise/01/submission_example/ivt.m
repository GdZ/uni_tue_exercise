%% exercise 3: I-VT and I-DT
%%% I-VT
%%% velocity criterion is userllay 10-50 deg/s
%%% acceleration.
%%% when bigger than 300 deg/s belongs to saccades,
%%% smaller than 100 deg/s belongs to fixation
%%%       Augen
%%%         .
%%%        /|\
%%%       / |θ\
%%%      /  |  \
%%%     /   |   \
%%%    /____|____\
%%%   P0         P1
%%% (x0,y0)    (x1,y1)
%%% 
%%% 1. Distanz(mm) zwischen P0 und P1 ist:
%%%     d = sqrt{[(x1-x0)*width_ratio]^2 + [(y1-y0)*height_ratio]^2}
%%% 2. Angle θ ist:
%%%     θ = atand((d/2)/(D)) = atand(d/(2*D))
%%% 3. Zeitlauf:
%%%     ΔT = t1-t1
%%% 4. velocity ist:
%%%     velocity = 2*θ/ΔT
function [fixations, saccades] = ivt(protocol)
    %disp([size(protocol) threshold]);
    % ratio_width: 0.195312 pixel/mm, ratio_height: 0.187500 pixel/mm
    width_ratio = 0.195312;
    height_ratio = 0.187500;
    fixations = [];
    saccades = [];
    time = 1;
    x = 2;
    y = 3;
    D = 600;
    
    for i=1:length(protocol)
        %%% calculate velocity for each point
        if 1 == i % first point cannot calculate the velocity
            j = 1;
            continue;
        end
        point_old = protocol(i-1,:);
        point = protocol(i,:);
        % pixel must change to mm
        distanzen = sqrt((width_ratio*(point(x)-point_old(x)))^2 +...
                         (height_ratio*(point(y)-point_old(y)))^2);
        angel = atand(distanzen / (2*D));
        velocity = (2*angel) / (point(time)-point_old(time)) * 1000000;
        fprintf('[%d] velocity: %f\n', i, velocity);

        %%% if velocity of this point is below 100 deg/s, mark as fixation
        %%% point
        if 100 > velocity
            %%% mark as fixation point, then add to fixation list
            fixations = point(1,[1 2 3]);
            j = j+1;
            %fprintf('[fixation] %d. velocity: %f\n', i, velocity);
        else %if 300 < velocity
            %%% mark as sccade point, then add to sccades list
            saccades = point(1,[1 2 3]);
            %fprintf('[saccade] %d. velocity: %f\n', i, velocity);
        end
    end
end
