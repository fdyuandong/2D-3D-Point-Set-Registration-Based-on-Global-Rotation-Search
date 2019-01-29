function fig_h=plotUpper(point_2d,point_3d,r_lu,center_rot,plane_z)
%PLOTUPPER 
%   画出投影扩展球形区域

fig_h=figure;

[b_c,b_r] = get_ball(point_3d,r_lu,center_rot);

[center_circle_2d,radius_circle_2d] = Project_ball_multi(b_c,b_r,plane_z);
plot_circle(center_circle_2d,radius_circle_2d);

plot(point_2d(1,:),point_2d(2,:),'+');

axis equal

end

