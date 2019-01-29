function [b_c,b_r] = get_ball(point_3d,r_lu,center_rot)
%GET_BALL 使用不确定球包住不确定伞状区域
%   
alpha=0.5*norm(r_lu(4:6)-r_lu(1:3)); 
alpha=min([alpha,pi/2]);
r_c=0.5*(r_lu(4:6)+r_lu(1:3));
R_c=rotationVectorToMatrix(r_c);
b_c=R_c*(point_3d-center_rot)*cos(alpha)+center_rot;

L=sqrt(sum((point_3d-center_rot).^2));
b_r= L.*sin(alpha); %ξ

end

