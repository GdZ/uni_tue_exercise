function [edge] = Edge(contrast, size)
    c = contrast;
    pos = [];
    edge = [];
    ids = find(c < sum(c(:))/length(c(:)));
    for i=1:length(ids(:))
        x = mod(ids(i), size);
        y = (ids(i) - mod(ids(i), size)) / size;
        pos = [ pos; x y ];
    end
    % find edge
    max_x = max(pos(:,1));
    min_x = min(pos(:,1));
    for x=min_x:max_x
        min_y = min(pos(find(pos(:,1)==x), 2));
        max_y = max(pos(find(pos(:,1)==x), 2));
        edge = [ edge; x min_y; x max_y ];
    end
end

