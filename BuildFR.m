robot = rigidBodyTree;
body1 = rigidBody('body1');
body2 = rigidBody('body2');

jnt1 = rigidBodyJoint('jnt1','revolute');
jnt1.HomePosition = pi/3;
tform = trvec2tform([1, -1, 0]);
setFixedTransform(jnt1,tform);
body1.Joint = jnt1;

jnt2 = rigidBodyJoint('jnt2','revolute');
jnt2.HomePosition = pi/6; 
tform2 = trvec2tform([1, 0, 0]); 
setFixedTransform(jnt2,tform2);
body2.Joint = jnt2;

addBody(robot,body1,'base');
addBody(robot,body2,'body1'); % Add body2 to body1

show(robot);

