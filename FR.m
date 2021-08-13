%% main test    支持自定义转轴，注意厂家机械臂的坐标系定义  完成定义
clc
clear
dhparams = [
    0 0 0 0         %b1 1
    0 0 0.0745 0    %2  2
   0 pi/2 0.0789 0  %t3 3
    0 0 0.0632 0    %3  4
    -0.4213 0 0 0   %4  5
    -0.3961 0 0 0   %5  6
    0 pi/2 0.0732 0    %t6 7
   0 0 0.0611 0        %6  8
    0 -pi/2 0.0483 0   %t7  9
     0 0 0.0589 0   %7  10
%     0 0 0.1 0
    ];

robot = rigidBodyTree;
body1 = rigidBody('body1');
jnt1 = rigidBodyJoint('jnt1','revolute');
setFixedTransform(jnt1,dhparams(1,:),'dh');
body1.Joint = jnt1;
addBody(robot,body1,'base')

body2 = rigidBody('body2');
jnt2 = rigidBodyJoint('jnt2','revolute');
body3 = rigidBody('body3');
jnt3 = rigidBodyJoint('jnt3','fixed');
body4 = rigidBody('body4');
jnt4 = rigidBodyJoint('jnt4','revolute');
body5 = rigidBody('body5');
jnt5 = rigidBodyJoint('jnt5','revolute');
body6 = rigidBody('body6');
jnt6 = rigidBodyJoint('jnt6','revolute');
body7 = rigidBody('body7');
jnt7 = rigidBodyJoint('jnt7','fixed');

body8 = rigidBody('body8');
jnt8 = rigidBodyJoint('jnt8','revolute');
body9 = rigidBody('body9');
jnt9 = rigidBodyJoint('jnt9','fixed');
body10 = rigidBody('body10');
jnt10 = rigidBodyJoint('jnt10','revolute');
%
setFixedTransform(jnt2,dhparams(2,:),'dh');
setFixedTransform(jnt3,dhparams(3,:),'dh');
setFixedTransform(jnt4,dhparams(4,:),'dh');
setFixedTransform(jnt5,dhparams(5,:),'dh');
setFixedTransform(jnt6,dhparams(6,:),'dh');
setFixedTransform(jnt7,dhparams(7,:),'dh');

setFixedTransform(jnt8,dhparams(8,:),'dh');
setFixedTransform(jnt9,dhparams(9,:),'dh');
setFixedTransform(jnt10,dhparams(10,:),'dh');



body2.Joint = jnt2;
body3.Joint = jnt3;
body4.Joint = jnt4;
body5.Joint = jnt5;
body6.Joint = jnt6;
body7.Joint = jnt7;

body8.Joint = jnt8;
body9.Joint = jnt9;
body10.Joint = jnt10;


addBody(robot,body2,'body1')
addBody(robot,body3,'body2')
addBody(robot,body4,'body3')
addBody(robot,body5,'body4')
addBody(robot,body6,'body5')
addBody(robot,body7,'body6')
%
addBody(robot,body8,'body7')
addBody(robot,body9,'body8')
addBody(robot,body10,'body9')


% figure()
% showdetails(robot)
show(robot);

iviz = interactiveRigidBodyTree(robot);

