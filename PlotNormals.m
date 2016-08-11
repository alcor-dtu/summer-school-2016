function PlotNormals(theta, phi)
    [x, y, z] = sph2cart(phi, pi/2 - theta, ones(size(theta)));
    figure;
    plot3(x, y, z, '.r');
    axis equal;
    xlim([-1,1]);ylim([-1,1]);zlim([0,1]);
    xlabel('x');ylabel('y');zlabel('z');
end