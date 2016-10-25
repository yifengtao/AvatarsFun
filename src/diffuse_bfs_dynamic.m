% BFS algorithm to search for the connected outer area.
function Gd = diffuse_bfs_dynamic(G,step,t)
    [h,w] = size(G);
    Gd = zeros(h,w);
    Gd(1,1) = 1;
    visited = zeros(h,w);
    visited(1,1) = 1;
    route = [1,1];
    k = 0;
    while size(route,1) ~= 0
        k = k+1;
        total_visited = sum(sum(visited));
        if mod(total_visited,step) == 0
            imagesc(Gd(2:end-1,2:end-1));
            pause(t);
            prop = total_visited/sum(sum(G));
            fprintf('visited = %7d, proportion = %.1f%%\n', ...
                total_visited, prop*100);
        end
        current = route(1,:);
        i = current(1); % row
        j = current(2); % col
        route = route(2:end,:); % pop
        % Right.
        if (j+1 <= w)&(visited(i,j+1) == 0)
            route = [route;i,j+1];
            visited(i,j+1) = 1;
            if G(i,j+1) == 1
                Gd(i,j+1) = 1;
            else
                route = route(1:end-1,:);
            end
        end
        % Down.
        if (i+1 <= h)&(visited(i+1,j) == 0)
            route = [route;i+1,j];
            visited(i+1,j) = 1;
            if G(i+1,j) == 1
                Gd(i+1,j) = 1;
            else
                route = route(1:end-1,:);
            end
        end
        % Left.
        if (j-1 >= 1)&(visited(i,j-1) == 0)
            route = [route;i,j-1];
            visited(i,j-1) = 1;
            if G(i,j-1) == 1
                Gd(i,j-1) = 1;
            else
                route = route(1:end-1,:);
            end
        end
        % Up.
        if (i-1 >= 1)&(visited(i-1,j) == 0)
            route = [route;i-1,j];
            visited(i-1,j) = 1;
            if G(i-1,j) == 1
                Gd(i-1,j) = 1;
            else
                route = route(1:end-1,:);
            end
        end
    end
    imagesc(Gd(2:end-1,2:end-1));
end % end of: while size(route,1) ~= 0
% Q.E.D.
