function varargout = SDTLZ1(Operation,Global,input)
% <problem> <DTLZ special>
% An Evolutionary Many-Objective Optimization Algorithm Using
% Reference-point Based Non-dominated Sorting Approach, Part I: Solving
% Problems with Box Constraints
% a ---  2 --- Scaling factor
% operator --- EAreal

%--------------------------------------------------------------------------
% Copyright (c) 2016-2017 BIMK Group. You are free to use the PlatEMO for
% research purposes. All publications which use this platform or any code
% in the platform should acknowledge the use of "PlatEMO" and reference "Ye
% Tian, Ran Cheng, Xingyi Zhang, and Yaochu Jin, PlatEMO: A MATLAB Platform
% for Evolutionary Multi-Objective Optimization [Educational Forum], IEEE
% Computational Intelligence Magazine, 2017, 12(4): 73-87".
%--------------------------------------------------------------------------

    % This problem is scaled DTLZ1
    %a = Global.ParameterSet(2);
    switch Operation
        case 'init'
            Global.M        = 3;
            Global.D        = Global.M + 4;
            Global.C        = 0;
            Global.lower    = zeros(1,Global.D);
            Global.upper    = ones(1,Global.D);
            Global.operator = @EAreal;

            varargout = {Global};
        case 'value'
            if Global.M == 2 || Global.M == 3 || Global.M == 5
                a = 10;
            elseif Global.M == 8
                a = 3;
            elseif Global.M == 10
                a = 2;
            elseif Global.M == 15
                a = 1.2;        
            else
                a = 2; 
            end
                    PopDec = input;
            [N,D]  = size(PopDec);
            M      = Global.M;

            g      = 100*(D-M+1+sum((PopDec(:,M:end)-0.5).^2-cos(20.*pi.*(PopDec(:,M:end)-0.5)),2));
            PopObj = 0.5*repmat(1+g,1,M).*fliplr(cumprod([ones(N,1),PopDec(:,1:M-1)],2)).*[ones(N,1),1-PopDec(:,M-1:-1:1)];
            PopObj = PopObj.*repmat(a.^(0:M-1),size(PopObj,1),1);
            
            PopCon = [];
            
            varargout = {input,PopObj,PopCon};
        case 'PF'
            if Global.M == 2 || Global.M == 3 || Global.M == 5
                a = 10;
            elseif Global.M == 8
                a = 3;
            elseif Global.M == 10
                a = 2;
            elseif Global.M == 15
                a = 1.2;        
            else
                a = 2; 
            end
            f = UniformPoint(input,Global.M)/2;
            f = f.*repmat(a.^(0:Global.M-1),size(f,1),1);
            varargout = {f};
    end
end