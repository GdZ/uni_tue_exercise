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
function [left_fixations, right_fixations] = ivt(protocol)
    %disp([size(protocol) threshold]);
    % ratio_width: 0.195312 pixel/mm, ratio_height: 0.187500 pixel/mm
    width_ratio = 0.195312;
    height_ratio = 0.187500;
    left_fixations = [];
    left_saccades = [];
    right_fixations = [];
    right_saccades = [];
    time = 1;
    left_x = 2;
    left_y = 3;
    right_x = 7;
    right_y = 8;
    x = 2;
    y = 3;
    D = 600;
    
    for i=1:length(protocol)
        %%% calculate velocity for each point
        if 1 == i % first point cannot calculate the velocity
            left_fix_i = 1;
            left_sac_j = 1;
            right_fix_i = 1;
            right_sac_j = 1;
            continue;
        end
        
        %%% left eye
        left_point0 = protocol(i-1, [time left_x left_y]);
        left_point1 = protocol(i, [time left_x left_y]);
        % pixel must change to mm
        left_distanzen = sqrt((width_ratio*(left_point1(x)-left_point0(x)))^2 +...
                         (height_ratio*(left_point1(y)-left_point0(y)))^2);
        left_angel = atand(left_distanzen / (2*D));
        left_velocity = (2*left_angel*1000000) / (left_point1(time)-left_point0(time));

        %%% if velocity of this point is below 100 deg/s, mark as fixation
        %%% point
        if 100 > left_velocity
            %%% mark as fixation point, then add to fixation list
            left_fixations(left_fix_i,:) = left_point1(1,[time x y]);
            left_fix_i = left_fix_i+1;
            %fprintf('[fixation] %d. velocity: %f\n', i, velocity);
        else
            if 300 < left_velocity
                %%% mark as sccade point, then add to sccades list
                left_saccades(left_sac_j,:) = left_point1(1,[time x y]);
                left_sac_j = left_sac_j+1;
                %fprintf('[saccade] %d. velocity: %f\n', i, velocity);
            else
            end
        end

        %%% right eye
        right_point0 = protocol(i-1, [time right_x right_y]);
        right_point1 = protocol(i, [time right_x right_y]);
        % pixel must change to mm
        right_distanzen = sqrt((width_ratio*(right_point1(x)-right_point0(x)))^2 +...
                         (height_ratio*(right_point1(y)-right_point0(y)))^2);
        right_angel = atand(right_distanzen / (2*D));
        right_velocity = (2*right_angel*1000000) / (right_point1(time)-right_point0(time));

        %%% if velocity of this point is below 100 deg/s, mark as fixation
        %%% point
        if 100 > right_velocity
            %%% mark as fixation point, then add to fixation list
            right_fixations(left_fix_i,:) = right_point1(1,[time x y]);
            right_fix_i = left_fix_i+1;
            %fprintf('[fixation] %d. velocity: %f\n', i, velocity);
        else
            if 300 < right_velocity
                %%% mark as sccade point, then add to sccades list
                right_saccades(left_sac_j,:) = right_point1(1,[time x y]);
                right_sac_j = left_sac_j+1;
                %fprintf('[saccade] %d. velocity: %f\n', i, velocity);
            else
            end
        end
    end

    img = imread('stimuli.jpg');
    imshow(img);
    hold on;
    size(left_fixations)
    scatter(left_fixations(:, x), left_fixations(:, y), '.', 'blue', 'LineWidth', 0.01);
    scatter(right_fixations(:, x), right_fixations(:, y), '.', 'red', 'LineWidth', 0.01);
    hold off;
end
