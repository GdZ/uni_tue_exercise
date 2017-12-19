%%% I-DT
function [ fixations ] = idt(protocol)
    % dispersion, duration
    % ratio_width: 0.195312 pixel/mm, ratio_height: 0.187500 pixel/mm
    width_ratio = 0.195312;
    height_ratio = 0.187500;
    duration_threshold = 100000;
    dispertion_threshold = 5;

    left_x = 2;
    left_y = 3;
    right_x = 7;
    right_y = 8;
    t = 1;
    x = 2;
    y = 3;
    D = 600;

    left_p = protocol(:, [t left_x left_y]);
    right_p = protocol(:, [t right_x right_y]);

    left_fixations = [];
    right_fixations = [];

    left_fixation_idx = 1;
    left_idx = 1;
    left_idx_end = 1;

    while left_idx_end <= length(left_p)

        left_duration = 0;
        left_dispertion = 0;
        while (left_duration< duration_threshold ...
                && left_idx_end <= length(left_p(:,t)))
            left_duration = left_p(left_idx_end, t)-left_p(left_idx, t);
            left_idx_end = left_idx_end + 1;
        end

        if(left_idx_end >= length(left_p(:,t)))
            break;
        end

        left_dispertion = (max(left_p(left_idx:left_idx_end, x)) ...
                    - min(left_p(left_idx:left_idx_end, x)))...
                    *width_ratio...
                    +(max(left_p(left_idx:left_idx_end, y)) ...
                    - min(left_p(left_idx:left_idx_end, y)))...
                    *height_ratio;
        
        left_dispertion = 2*atand(left_dispertion/(2*D));


        if left_dispertion <= dispertion_threshold
            while (left_dispertion < dispertion_threshold ...
                    && left_idx_end < length(left_p(:, t)))
                left_idx_end = left_idx_end + 1;
                left_dispertion = (max(left_p(left_idx:left_idx_end, x))...
                            -min(left_p(left_idx:left_idx_end, x)))...
                            *width_ratio...
                            +(max(left_p(left_idx:left_idx_end, y))...
                            -min(left_p(left_idx:left_idx_end, y)))...
                            *height_ratio;
                left_dispertion = 2*atand(left_dispertion/(2*D));
            end

            left_tmp_x = sum(left_p(left_idx:left_idx_end, x))/(left_idx_end-left_idx+1);
            left_tmp_y = sum(left_p(left_idx:left_idx_end, y))/(left_idx_end-left_idx+1);

            left_fixations(left_fixation_idx,:)  = [left_p(left_idx, t), left_tmp_x, left_tmp_y];
            left_fixation_idx = left_fixation_idx +1;
            left_idx = left_idx_end+1;
            left_idx_end = left_idx_end+1;

        else
            left_idx = left_idx +1;
        end
    end

    
    %%% right eye
    right_fixation_idx = 1;
    right_idx = 1;
    right_idx_end = 1;

    while right_idx_end <= length(right_p)

        right_duration = 0;
        right_dispertion = 0;
        while (right_duration< duration_threshold ...
                && right_idx_end <= length(right_p(:,t)))
            right_duration = right_p(right_idx_end, t)-right_p(right_idx, t);
            right_idx_end = right_idx_end + 1;
        end

        if(right_idx_end >= length(right_p(:,t)))
            break;
        end

        right_dispertion = (max(right_p(right_idx:right_idx_end, x)) ...
                    - min(right_p(right_idx:right_idx_end, x)))...
                    *width_ratio...
                    +(max(right_p(right_idx:right_idx_end, y)) ...
                    - min(right_p(right_idx:right_idx_end, y)))...
                    *height_ratio;
        
        right_dispertion = 2*atand(right_dispertion/(2*D));


        if right_dispertion <= dispertion_threshold
            while (right_dispertion < dispertion_threshold ...
                    && right_idx_end < length(right_p(:, t)))
                right_idx_end = right_idx_end + 1;
                right_dispertion = (max(right_p(right_idx:right_idx_end, x))...
                            -min(right_p(right_idx:right_idx_end, x)))...
                            *width_ratio...
                            +(max(right_p(right_idx:right_idx_end, y))...
                            -min(right_p(right_idx:right_idx_end, y)))...
                            *height_ratio;
                right_dispertion = 2*atand(right_dispertion/(2*D));
            end

            right_tmp_x = sum(right_p(right_idx:right_idx_end, x))/(right_idx_end-right_idx+1);
            right_tmp_y = sum(right_p(right_idx:right_idx_end, y))/(right_idx_end-right_idx+1);

            right_fixations(right_fixation_idx,:)  = [right_p(right_idx, t), right_tmp_x, right_tmp_y];
            right_fixation_idx = right_fixation_idx +1;
            right_idx = right_idx_end+1;
            right_idx_end = right_idx_end+1;

        else
            right_idx = right_idx +1;
        end
    end
    
    img = imread('stimuli.jpg');
    imshow(img);
    hold on;
%     scatter(left_fixations(:, x), left_fixations(:, y), '.', 'blue', 'LineWidth', 0.01);
    scatter(right_fixations(:, x), right_fixations(:, y), '.', 'red', 'LineWidth', 0.01);
    hold off;

end


