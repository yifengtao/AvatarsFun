% DFS algorithm to search for the connected outer area.
function Gd = diffuse_dfs_dynamic(G,step,t)
    %figure;
    colormap(gray);
    [h,w] = size(G);
    Gd = zeros(h,w);
    Gd(1,1) = 1;
    visited = zeros(h,w);
    visited(1,1) = 1;
    route = [1,1];
    % i: row
    i = 1;
    % j: col
    j = 1;
    k = 0;
    while true
        k = k+1;
        total_visited = sum(sum(visited));
        if mod(total_visited,step) == 0
            imagesc(Gd(2:end-1,2:end-1));
            pause(t);
            prop = total_visited/sum(sum(G));
            fprintf('visited = %7d, proportion = %.1f%%\n', ...
                total_visited, prop*100);
        end
        % Right.
        if (j+1 <= w)&(visited(i,j+1) == 0)
            j = j+1;
            visited(i,j) = 1;
            route = [route;i,j];
            if G(i,j) == 1
                Gd(i,j) = 1;
            else % G(i,j) == 0
                route = route(1:end-1,:);
                i = route(end,1);
                j = route(end,2);
            end
        % Down.
        elseif (i+1 <= h)&(visited(i+1,j) == 0)
            i = i+1;
            visited(i,j) = 1;
            route = [route;i,j];
            if G(i,j) == 1
                Gd(i,j) = 1;
            else % G(i,j) == 0
                route = route(1:end-1,:);
                i = route(end,1);
                j = route(end,2);
            end
        % Left.
        elseif (j-1 >= 1)&(visited(i,j-1) == 0)
            j = j-1;
            visited(i,j) = 1;
            route = [route;i,j];
            if G(i,j) == 1
                Gd(i,j) = 1;
            else % G(i,j) == 0
                route = route(1:end-1,:);
                i = route(end,1);
                j = route(end,2);
            end
        % Up.
        elseif (i-1 >= 1)&(visited(i-1,j) == 0)
            i = i-1;
            visited(i,j) = 1;
            route = [route;i,j];
            if G(i,j) == 1
                Gd(i,j) = 1;
            else % G(i,j) == 0
                route = route(1:end-1,:);
                i = route(end,1);
                j = route(end,2);
            end
        else % if nodes around (i,j) are all visited.
            route = route(1:end-1,:);
            % back to the root node: get out of search.
            if size(route,1) == 0
               break
            end
            i = route(end,1);
            j = route(end,2);
        end
    end
    imagesc(Gd(2:end-1,2:end-1));
end % end of: while true
% Q.E.D.
