function PlotBarycentric(distances)
% Coordinates : 1 / distance is okay
% distances is a nxm array. n are the points, m the classes
s = size(distances);
N = s(2);
nums = [1:N];
angles = nums * (2*pi) / N;
offset = 0;
anchors = [cos(angles + offset); sin(angles + offset)];
figure;
anchors2 = 100 * [cos(angles); sin(angles)];
[v,c] = voronoin([anchors, anchors2]');
% patch(x,y,'r'); % use color i.
colormap hsv;
cmp = colormap;
cmp2 = cmp / 5 + ones(size(cmp))/1.5;
for i = 1:length(c)
    %if all(c{i}~=1)   % If at least one of the indices is 1,
        % then it is an open region and we can't
        % patch that.
        patch(v(c{i},1),v(c{i},2), cmp2(mod(i * 10, length(cmp2)),:)); % use color i.
    %end
end
hold on;
axis equal;
xlim([-1,1]);ylim([-1,1]);
xlabel('x');ylabel('y');
weights = normr(1.0 ./ distances);
interp = weights * anchors';
hold on;
plot(anchors(1,:),anchors(2,:), '.r', 'MarkerSize', 20);
plot(interp(:,1),interp(:,2), '.b');
% end