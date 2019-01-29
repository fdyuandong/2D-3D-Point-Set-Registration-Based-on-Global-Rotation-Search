function [center_circle_2d,radius_circle_2d] = Project_ball_multi(b_c,b_r,plane_z)
% 把多个球进行投影，注意b_c为N列，表示N个球


%1.首先求圆环的法线
e_=b_c;
L_b_c=sqrt(sum(e_.^2));
e=e_./L_b_c;%单位法向量

%2.求圆环半径

L_tangent=realsqrt(abs(L_b_c.^2-b_r.^2));

r_circle=b_r.*L_tangent./L_b_c; %<-------圆环半径

%3.求圆环中心
% k=realsqrt(abs(L_tangent.^2-r_circle.^2));
k=r_circle.*(L_tangent./b_r);
c_circle=k.*e;%<-----------圆环中心

%4.求投影
M=size(e,2);
e_plane=repmat([0;0;1],1,M);

e1_=cross(e,e_plane);

e2_=cross(e1_,e);
e2_L=sqrt(sum(e2_.^2));
flag=e2_L<1e-6;%这一步是为了处理，球心和投影点的连线和Z轴平行的情形
                %在这种情况下，e1和[0;0;1]平行，e2为[0;0;0]。
                %e1和[0;0;1]平行时，e2设置为[0;1;0];
    
e2_L(flag)=1;
e2=e2_./e2_L;

e2(1,flag)=0;
e2(2,flag)=1;
e2(3,flag)=0;



Point_3D_axis=[c_circle+r_circle.*e2,c_circle-r_circle.*e2];

Point_2D_dim = Project_point(Point_3D_axis,plane_z);
radius_circle_2d=0.5*realsqrt(sum((Point_2D_dim(:,1:M)-Point_2D_dim(:,M+1:end)).^2));

center_circle_2d=0.5*(Point_2D_dim(:,1:M)+Point_2D_dim(:,M+1:end));


end

