function varargout = G7(Operation, Global, input)
% Proteek Chandan Roy 2018, email:proteek_buet@yahoo.com

    switch Operation
        case 'init'
            Global.M        = 1;
            Global.D        = 10;
            Global.C        = 8;
            
            bound = zeros(2, Global.D);
            bound(1,1:Global.D) = -10;
            bound(2,1:Global.D) = 10;
                    
            Global.lower    = bound(1,:);
            Global.upper    = bound(2,:);
            Global.operator = @EAreal;
            
            PopDec    = rand(input,Global.D).*repmat(Global.upper-Global.lower,input,1) + repmat(Global.lower,input,1);
            varargout = {PopDec};
        case 'value'
            x = input;
            PopObj = x(:,1).^2+x(:,2).^2+x(:,1).*x(:,2)-14*x(:,1)-16*x(:,2)+(x(:,3)-10).^2+...
    4*(x(:,4)-5).^2+(x(:,5)-3).^2+2*(x(:,6)-1).^2+5*x(:,7).^2+...
    7*(x(:,8)-11).^2+2*(x(:,9)-10).^2+(x(:,10)-7).^2+45;

            % Constraints
            y(:,1) = 4*x(:,1)+5*x(:,2)-3*x(:,7)+9*x(:,8)-105;
            y(:,2) = 10*x(:,1)-8*x(:,2)-17*x(:,7)+2*x(:,8);    
            y(:,3) = -8*x(:,1)+2*x(:,2)+5*x(:,9)-2*x(:,10)-12; 
            y(:,4) = 3*(x(:,1)-2).^2+4*(x(:,2)-3).^2+2*x(:,3).^2-7*x(:,4)-120;      
            y(:,5) = 5*x(:,1).^2+8*x(:,2)+(x(:,3)-6).^2-2*x(:,4)-40;
            y(:,6) = 0.5*(x(:,1)-8).^2+2*(x(:,2)-4).^2+3*x(:,5).^2-x(:,6)-30; 
            y(:,7) = x(:,1).^2+2*(x(:,2)-2).^2-2*x(:,1).*x(:,2)+14*x(:,5)-6*x(:,6);       
            y(:,8) = -3*x(:,1)+6*x(:,2)+12*(x(:,9)-8).^2-7*x(:,10);    
            
            PopCon = y; 
            varargout = {input,PopObj,PopCon};
        case 'PF'
            f = 24.30620906818;
            varargout = {f};
        case 'PS'
            varargout  = {[2.17199634142692, 2.3636830416034,...
8.77392573913157, 5.09598443745173, 0.990654756560493, 1.43057392853463, 1.32164415364306,...
9.82872576524495, 8.2800915887356, 8.3759266477347]}; 
    end
end