function [best_r] = RotationSearch(point_2d,point_3d,epsilon,center_rot,plane_z,plot_flag)
%ROTATIONSEARCH :Find best rotation with a rotation center(center_rot)
%   
%   point_2d:       input 2D point
%   point_3d:       input 3D point
%   epsilon:        input tolerable error
%   center_rot:     input rotation center
%   palne_z:        input X-Y plane position: z=palne_z
%   plot_flag:      input display level,0:off|1:show upper and lower
%                   |2:show all
%   best_r£º        output global optimal rotation

%=initialize the parameters

r_lu=[-pi,-pi,-pi,pi,pi,pi]'; %rotation domain
best_r=[0;0;0];               
best_Q=0;                     

best_branch=r_lu;
branch=[];

Q_u=zeros(1,8); %upper bound of each divided branchs.
Q_l=zeros(1,8); %lower bound of each divided branchs.

iter=1;

if(plot_flag>0)
    figure
    h_L=animatedline('Color','red');
    h_U=animatedline('Color','g');
    title('upper bound and lower bound')
    figure
    h_V=animatedline('Color','k');
    title('remaining volume')
end

while(norm(best_branch(1:3)-best_branch(4:6))>1e-6)
    
    new_branch=Branch(best_branch(1:6));
    
    for i=1:8
        Q_u(i) = Q_upper(point_2d,point_3d,epsilon,new_branch(:,i),center_rot,plane_z);
        Q_l(i) = Q_fun(point_2d,point_3d,epsilon,0.5*(new_branch(1:3,i)+new_branch(4:6,i)),center_rot,plane_z);
    end
    
    branch=[branch,[new_branch;Q_l;Q_u]];
    
    [max_Q_u,index_best_bran]=max(branch(end,:));
    
    [max_Q_l,ind_best_now]=max(Q_l);
    
    if(max_Q_l>best_Q)
        best_Q=max_Q_l;
        best_r=0.5*(new_branch(1:3,ind_best_now)+new_branch(4:6,ind_best_now));
        
        if(plot_flag>=2)
            plotUpper(point_2d,point_3d,best_branch(1:6),center_rot,plane_z);
        end
        
    end
    
    
    [V] = getVolume(branch);
    
    best_branch=branch(1:6,index_best_bran);
    branch(:,index_best_bran)=[]; 
    branch(:,branch(end,:)<best_Q)=[];%cutting branch
    
    
    
    if(max_Q_u==best_Q)
        disp('get best rotation!')
        
        if(plot_flag>=1)
            addpoints(h_L,iter,best_Q);
            addpoints(h_U,iter,max_Q_u);
            [V] = getVolume(branch);
            addpoints(h_V,iter,V);
            drawnow
        end
        
        break;
        
    end
    iter=iter+1;
    
    if(plot_flag>=1)
        addpoints(h_L,iter,best_Q);
        addpoints(h_U,iter,max_Q_u);
        addpoints(h_V,iter,V);
        drawnow
    end
    
end

end

