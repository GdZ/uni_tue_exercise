%% exercise 3: I-VT and I-DT
%%% I-VT
%%% velocity criterion is userllay 10-50 deg/s
%%% acceleration.
%%% when bigger than 300 deg/s belongs to saccades,
%%% smaller than 100 deg/s belongs to fixation
function [fixations] = ivt(protocol, threshold)
    disp([size(protocol) threshold])
    fixations = [];
    saccades = [];
    time = 1;
    x = 2;
    y = 3;
    D = 600;

    for i=1:size(protocol)
        %%% calculate velocity for each point
        if 1 == i % first point cannot calculate the velocity
            continue;
        end
        point_old = protocol(i-1,:);
        point = protocol(i,:);
        %disp(point(1, [2 3]));
        velocity = atand(...
                       sqrt((point(x)-point_old(x))^2+(point(y)-point_old(y))^2)...
                            /(2*D))...
                    /(point(time)-point_old(time)) * 1000;

        %%% if velocity of this point is below 100 deg/s, mark as fixation
        %%% point
        if 100 > velocity
            %%% mark as fixation point, then add to fixation list
            fixations = point;
            fprintf('[fixation] %d. velocity: %f\n', i, velocity);
        else %if 300 < velocity
            %%% mark as sccade point, then add to sccades list
            saccades = point;
            fprintf('[saccade] %d. velocity: %f\n', i, velocity);
        end
    end
end

%%% I-DT