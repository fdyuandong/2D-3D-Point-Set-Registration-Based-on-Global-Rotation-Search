function [Point_2d] = Project_point(Point_3d,plane_z)
%Project points to a plane from origin point
%
%plane_z:( x-y plane : z=plane_z )
%
%Point_3d :3D points(3*N)
%Point_2d :2D points(2*N)


Point_2d=zeros(2,size(Point_3d,2));
Point_2d(1,:)=Point_3d(1,:)./Point_3d(3,:).*plane_z;
Point_2d(2,:)=Point_3d(2,:)./Point_3d(3,:).*plane_z;

end

