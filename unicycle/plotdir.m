
function h = plotdir(j,y,N)
a=["r","g","b","y","m","k","c","w"];
%%description this function plots the angle change in the vechicle
%%direction for every iteration
for i=1:2:2*N
    unicycleTranslations = [y(:,i:i+1) zeros(length(y),1)];
    unicycleRot = axang2quat([repmat([0 0 1],length(y),1) y(:,(i-1)/2+3*N+1)]);
    axis([-10 10 -10 10])
    axis  manual
    h=plotTransforms(unicycleTranslations(j,:),unicycleRot(j,:),'MeshFilePath','groundvehicle.stl',"MeshColor",a((i-1)/2+1));
    view(0,90)
    hold on
end
end
