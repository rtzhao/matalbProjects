% 加载机器人模型，puma1是一个六轴机器人刚体树模型
load exampleRobots.mat
showdetails(puma1)

% 获取puma1的一个任意构型
randConfig = puma1.randomConfiguration;

% 在randConfig随机构型下获取从末端执行器（L6）到base的齐次变换
% 使用此变换作为末端执行器的目标姿势
tform = getTransform(puma1,randConfig,'L6','base');
% 展示该目标姿态下的机器人构型
show(puma1,randConfig)

% 创建puma1模型的ik对象
ik = inverseKinematics('RigidBodyTree',puma1);
% 指定姿势不同分量的权重，为啥要设这个权重，目前我也不太清楚，估计和具体算法相关
% 对于方向角分量来说，使用比位置分量小的权重
weights = [0.25 0.25 0.25 1 1 1];
% 将机器人的home构型用作初始猜测的关节角
initialguess = puma1.homeConfiguration;

% 根据预期的末端执行器位姿来逆解得到关节角度
[configSoln,solnInfo] = ik('L6',tform,weights,initialguess);

% 显示逆解得到的关节构型
% 逆解得到的关节构型与目标构型有着细微的差别，因为存在误差
% 多次调用ik对象可以提供相似或非常不同的关节构型
show(puma1,configSoln)
