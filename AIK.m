robot = loadrobot('abbIrb120','DataFormat','row');
show(robot);

aik = analyticalInverseKinematics(robot);
showdetails(aik);

aik.KinematicGroup

generateIKFunction(aik,'robotIK');

eePosition = [0 0.5 0.5];
eePose = trvec2tform(eePosition);
hold on
plotTransforms(eePosition,tform2quat(eePose))
hold off


ikConfig = robotIK(eePose); % Uses the generated file

show(robot,ikConfig(1,:));
hold on
plotTransforms(eePosition,tform2quat(eePose))
hold off

figure;
numSolutions = size(ikConfig,1);

for i = 1:size(ikConfig,1)
    subplot(1,numSolutions,i)
    show(robot,ikConfig(i,:));
end