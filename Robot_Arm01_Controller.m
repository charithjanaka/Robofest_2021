%%Initilizing a Connection
clear all;
close all;
clc;
disp('Program started');
% vrep=remApi('remoteApi','extApi.h'); % using the header (requires a compiler)
vrep=remApi('remoteApi'); % using the prototype file (remoteApiProto.m)
vrep.simxFinish(-1); % just in case, close all opened connections
clientID=vrep.simxStart('127.0.0.1',19999,true,true,5000,5);
%%
if (clientID>-1)
    disp('Connected to remote API server');
    
    %initialize the handles
    Joint_Handles = zeros(1,6);
    [~,Joint_Handles(1)] = vrep.simxGetObjectHandle(clientID,'IRB4600_joint1', vrep.simx_opmode_blocking);
    [~,Joint_Handles(2)] = vrep.simxGetObjectHandle(clientID,'IRB4600_joint2', vrep.simx_opmode_blocking);
    [~,Joint_Handles(3)] = vrep.simxGetObjectHandle(clientID,'IRB4600_joint3', vrep.simx_opmode_blocking);
    [~,Joint_Handles(4)] = vrep.simxGetObjectHandle(clientID,'IRB4600_joint4', vrep.simx_opmode_blocking);
    [~,Joint_Handles(5)] = vrep.simxGetObjectHandle(clientID,'IRB4600_joint5', vrep.simx_opmode_blocking);
    [~,Joint_Handles(6)] = vrep.simxGetObjectHandle(clientID,'IRB4600_joint6', vrep.simx_opmode_blocking);
    [~,IK_tip] = vrep.simxGetObjectHandle(clientID,'IRB4600_IkTip', vrep.simx_opmode_blocking);
    [~,IK_target] = vrep.simxGetObjectHandle(clientID,'IRB4600_IkTarget', vrep.simx_opmode_blocking);
    [~,Aux_joint] = vrep.simxGetObjectHandle(clientID,'IRB4600_auxJoint', vrep.simx_opmode_blocking);
    [~,Suc_pad] = vrep.simxGetObjectHandle(clientID,'suctionPad', vrep.simx_opmode_blocking);
    
    %create some joint positions
    joint_pos1 = [-2*pi/3,0,pi/2,0,0,0];%x,y,z,alpha, beta, gamma
    joint_pos2 = [-0.2750,0.7250,0.8,0,0,0];
    joint_pos3 = [-0.2750,0.7250,0.57,0,0,0];
    joint_pos4 = [0,0,0,0,0,0];
    
%     MoveLinear(clientID,IK_target, joint_pos3, 3);
%     MoveLinear(clientID,IK_target, joint_pos2, 3);
%     MoveLinear(clientID,IK_target, joint_pos3, 3);
    
    %%activate the suction pad
    MoveLinear(clientID,IK_target, joint_pos3, 2);
    ControlSuctionPad(clientID,1);
    pause(0.5);
    MoveLinear(clientID,IK_target, joint_pos2, 3);
    pause(0.5);
    MoveLinear(clientID,IK_target, joint_pos1, 10);
    pause(0.5);
    ControlSuctionPad(clientID,0);
    pause(0.5);
    
    %[~]=vrep.simxSetObjectPosition(clientID,IK_target,IK_tip,[0,0,0],vrep.simx_opmode_blocking)
%     MoveLinear(clientID,IK_target, joint_pos4, 2);
%     MoveLinear(clientID,IK_target, joint_pos3, 2);
%     while true
%         %vrep.simxPauseCommunication(clientID,1); %pausing communication to set all the joints at once
%         for i = 1:6
%            vrep.simxSetJointPosition(clientID,Joint_Handles(i),joint_pos1(i),vrep.simx_opmode_streaming);
%         end
%         %vrep.simxPauseCommunication(clientID,0);
%         for i = 1:6
%            vrep.simxSetJointPosition(clientID,Joint_Handles(i),joint_pos2(i),vrep.simx_opmode_streaming);
%         end
%         for i = 1:6
%            vrep.simxSetJointPosition(clientID,Joint_Handles(i),joint_pos3(i),vrep.simx_opmode_streaming);
%         end
%         
%     end
    
    % Before closing the connection to V-REP, make sure that the last command sent out had time to arrive. You can guarantee this with (for example):
    vrep.simxGetPingTime(clientID);

    % Now close the connection to V-REP:    
    vrep.simxFinish(clientID);
else
    disp('Failed connecting to remote API server');
end
vrep.delete(); % call the destructor!

disp('Program ended');
