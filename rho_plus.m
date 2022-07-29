%% This function computes the R according to equation (6) in the paper 

%% input: channel gains (G_BS_users,G_BS_BD,G_BD_users)
%% output: vector R

function rho_vect = rho_plus(G_BS_users,G_BS_BD,G_BD_users)
%% channel of the backscattered link
G=G_BS_BD.*G_BD_users; 
%% returns 'empty' if the condition G(k)-G(k-1)>0 is not satisfied 
rho_vect=[];
%% compute R
for k=2:length(G_BD_users)
    if (G(k)>G(k-1))
        rho_vect(k-1)=((G_BS_users(k-1)-G_BS_users(k))/(G(k)-G(k-1)))^2;
    end
end

end

