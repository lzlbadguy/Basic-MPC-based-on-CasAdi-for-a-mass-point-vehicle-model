function x_update = kinematic_vehicle_model(x,u,Ts)
    % x(1)-车辆的x坐标
    % x(2)-车辆的y坐标
    % x(3)-车辆的偏转角
    % u(1)-车辆的加速度
    % u(2)-车辆的角速度
    % Ts-模型的采样时间
    xdot1=x(3)*cos(x(4));
    xdot2=x(3)*sin(x(4));
    xdot3=u(1);
    xdot4=u(2);
    xdot=[xdot1;xdot2;xdot3;xdot4];
    x_up1=x(1)+xdot(1)*Ts;
    x_up2=x(2)+xdot(2)*Ts;
    x_up3=x(3)+xdot(3)*Ts;
    x_up4=x(4)+xdot(4)*Ts;
    x_update=[x_up1;x_up2;x_up3;x_up4];
end

