clc;
clear;
%% MPC controller
import casadi.*;
opti = casadi.Opti();
N=10;
Ts=0.2;
P = opti.parameter(2, 1);
X0 = opti.parameter(4, 1);
U = opti.variable(2, N);
X = opti.variable(4, N + 1);
J = 0;
Q1 = 1000;
Q2=10^5;
R = 1*eye(2);
for k=1:N
    opti.subject_to(X(:,k+1)==kinematic_vehicle_model(X(:,k),U(:,k),Ts));
    J=J+U(:, k)' * R * U(:, k);
    J=J+(X(3, k + 1) - P(1))' * Q1 * (X(3, k + 1) - P(1))/30^2;
    J=J+(X(2, k + 1) - P(2))' *Q2 * (X(2, k + 1) - P(2))/3.5^2;
end

opti.subject_to(X(:, 1) == X0);
opti.subject_to(0 <= X(3, :) <= 30);
opti.subject_to(-pi/18 <= X(4, :) <= pi/18);
opti.subject_to(-2 <= U(1, :) <= 2);
opti.subject_to(-pi/36 <= U(2, :) <= pi/36);

opti.minimize(J);
opts = struct;
opts.ipopt.max_iter = 100;
opts.ipopt.print_level =0;%0,3
opts.print_time = 0;
opts.ipopt.acceptable_tol =1e-8;
opts.ipopt.acceptable_obj_change_tol = 1e-6;
opti.solver('ipopt',opts);

%% THE SIMULATION LOOP SHOULD START FROM HERE
t = 0;
x = [0;-1.75;20;0]; %X, Y,v,psi

reference = [30;1.75];
u = [0;0];
Ts_s=0.1;

th=[t];
xh=[x];
uh=[u];

simtime=15;
    tic;
for i=1:(simtime/Ts_s)
    opti.set_value(P, reference);
    opti.set_value(X0, x);
    sol = opti.solve();
    uout=sol.value(U);
    u=uout(:,1);
    x_update = kinematic_vehicle_model(x,u,Ts_s);
    x=x_update;
    t=t+Ts;
    
    th=[th,t];
    xh=[xh,x];
    uh=[uh,u]; 
end
    toc;
    
    figure
subplot(2,2,1)
plot(th,xh(3,:),'linewidth',2);
xlabel('T (s)');
ylabel('v (m/s)');
subplot(2,2,2)
plot(th,xh(2,:),'linewidth',2);
xlabel('T (s)');
ylabel('Y (m)');
subplot(2,2,3)
plot(th,uh(1,:),'linewidth',2);
xlabel('T (s)');
ylabel('a (m/s^2)');
subplot(2,2,4)
plot(th,uh(2,:),'linewidth',2);
xlabel('T (s)');
ylabel('$\omega$(rad/s) ','interpreter','latex','FontSize',15');