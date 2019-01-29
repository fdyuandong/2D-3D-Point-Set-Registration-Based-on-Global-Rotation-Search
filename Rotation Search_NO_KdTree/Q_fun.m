function [Q] = Q_fun(point_2d,point_3d,epsilon,r_in,center_rot,plane_z)
%Q_FUN evaluate the objective function
%   
%   point_2d:input 2D point
%   point_3d:input 3D point
%   epsilon: tolerable error
%   center_rot:     rotation center
%   plane_z:        X-Y plane position

R_in=rotationVectorToMatrix(r_in);
point_3d_roted=R_in*(point_3d-center_rot)+center_rot;
point_2d_projected = Project_point(point_3d_roted,plane_z);

M=size(point_3d,2);

Q=0;
for i=1:M
    erro=point_2d_projected(:,i)-point_2d;
    if(sum((sum(erro.^2,1)<epsilon.^2))>=1)
        Q=Q+1;
    end
end

end

