clc;clear;close all;%rng('default') 
point_3d(1,:)=10*rand(100,1);
point_3d(2,:)=10*rand(100,1);
point_3d(3,:)=10*rand(100,1)-35;

r=rand(3,1);
center_rot=[0;0;-30];
epsilon=0.05;
plane_z=-50;
R=rotationVectorToMatrix(r);
point_3d_roted=R*(point_3d-center_rot)+center_rot;

[point_2d] = Project_point(point_3d_roted,plane_z);

point_2d=[point_2d,10*rand(2,10)];
point_3d=[point_3d,10*rand(3,10)-[0;0;35]];% outlier

tic
[best_r] = RotationSearch(point_2d,point_3d,epsilon,center_rot,plane_z,2)
toc
error_degree=acosd(0.5*(trace(R'*rotationVectorToMatrix(best_r))-1))
