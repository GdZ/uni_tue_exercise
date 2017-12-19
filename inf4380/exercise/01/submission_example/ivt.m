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
%%%     ?T = t1-t1
%%% 4. velocity ist:
%%%     velocity = 2*θ/?T
function [left_fixations, right_fixations] = ivt(protocol)
    %disp([size(protocol) threshold]);
    % ratio_width: 0.195312 pixel/mm, ratio_height: 0.187500 pixel/mm
    width_ratio = 0.195312;
    height_ratio = 0.187500;

    left_x = 2;
    left_y = 3;
    right_x = 7;
    right_y = 8;
    t = 1;
    x = 2;
    y = 3;
    D = 600;

    left_fixations = [];
    right_fixations = [];
    left_fixation_ct = 0;
    right_fixation_ct = 0;
    for i=1:length(protocol)
        %%% calculate velocity for each point
        if 1 == i % first point cannot calculate the velocity
            left_fix_i = 1;
            right_fix_i = 1;
            continue;
        end
        %%% left eye
        left_point0 = protocol(i-1, [t left_x left_y]);
        left_point1 = protocol(i, [t left_x left_y]);

        % pixel must change to mm
        left_distanzen = sqrt((width_ratio*(left_point1(x)-left_point0(x)))^2 +...
                         (height_ratio*(left_point1(y)-left_point0(y)))^2);
        left_angel = atand(left_distanzen / (2*D));
        left_velocity = (2*left_angel*1000000) / (left_point1(t)-left_point0(t));

        %%% if velocity of this point is below 100 deg/s, mark as fixation
        %%% point
        if 300 > left_velocity
            if 0 == left_fixation_ct
                left_fixations(left_fix_i,:) = left_point0(1,[t x y]);
            else %%% mark as fixation point, then add to fixation list
                left_temp_x = (left_fixations(left_fix_i,x)+left_point1(1,x))/2;
                left_temp_y = (left_fixations(left_fix_i,y)+left_point1(1,y))/2;
                left_fixations(left_fix_i,[x y]) = [left_temp_x left_temp_y];
            end
            left_fixation_ct = left_fixation_ct+1;
        else
            left_fix_i = left_fix_i+1;
            left_fixation_ct = 0;
        end

        %%% right eye
        right_point0 = protocol(i-1, [t right_x right_y]);
        right_point1 = protocol(i, [t right_x right_y]);
        % pixel must change to mm
        right_distanzen = sqrt((width_ratio*(right_point1(x)-right_point0(x)))^2 +...
                         (height_ratio*(right_point1(y)-right_point0(y)))^2);
        right_angel = atand(right_distanzen / (2*D));
        right_velocity = (2*right_angel*1000000) / (right_point1(t)-right_point0(t));

        %%% if velocity of this point is below 100 deg/s, mark as fixation
        %%% point
        if 300 > right_velocity
            if 0 == right_fixation_ct
                right_fixations(right_fix_i,:) = right_point0(1,[t x y]);
            else %%% mark as fixation point, then add to fixation list
                right_temp_x = (right_fixations(right_fix_i,x)+right_point1(1,x))/2;
                right_temp_y = (right_fixations(right_fix_i,y)+right_point1(1,y))/2;
                right_fixations(right_fix_i,[x y]) = [right_temp_x right_temp_y];
            end
            right_fixation_ct = right_fixation_ct+1;
        else
            right_fix_i = right_fix_i+1;
            right_fixation_ct = 0;
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
