rbtree=rigidBodyTree;
body1=rigidBody('b1');
jnt1=rigidBodyJoint('jnt1','revolute');
body1.Joint=jnt1;
%basename=rbtree.BaseName;
addBody(rbtree,body1,'base');

showdetails(rbtree);
show(rbtree)