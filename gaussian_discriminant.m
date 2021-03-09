data2=readmatrix("./data/gd.txt","Delimiter",',');
%%
mu0=[9;10];
mu1=[6;7];
sigma=[1.15 0.1; 0.1 0.5];
percentage=0;

group0=zeros(2500,2);
group1=zeros(2500,2);
idx0=1; idx1=1;

for idx=1:6000
    x=data2(idx,:);
    if dot(((mu0-mu1).'*inv(sigma)),x)+...
            1/2*(mu1.'*inv(sigma)*mu1-mu0.'*inv(sigma)*mu0)>=0
        percentage = percentage+1;
        group0(idx0,:)=x;
        idx0=idx1+1;
    else
        group1(idx1,:)=x;
        idx1=idx1+1;
    end
end
percentage = percentage/6000;

figure
plot(group0(:,1),group0(:,2),'.')
hold on
plot(group1(:,1), group1(:,2),'.')

z= @(x1,x2) dot(((mu0-mu1).'*inv(sigma)),[x1;x2])...
    +1/2*(mu1.'*inv(sigma)*mu1-mu0.'*inv(sigma)*mu0);
fcontour(z,[2 13 2 13],'LevelList',[0])

legend('class 0', 'class 1','classification')
title('Data Classification Using p = 0.5')
%%
mu0=[9;10];
mu1=[6;7];
sigma=[1.15 0.1; 0.1 0.5];
p=0.05;
percentage=0;

group0=zeros(2500,2);
group1=zeros(2500,2);
idx0=1; idx1=1;

for idx=1:6000
    x=data2(idx,:);
    if dot(((mu0-mu1).'*inv(sigma)),x)...
            +1/2*(mu1.'*inv(sigma)*mu1-mu0.'*inv(sigma)*mu0)+log((1-p)/p)>=0
        percentage = percentage+1;
        group0(idx0,:)=x;
        idx0=idx1+1;
    else
        group1(idx1,:)=x;
        idx1=idx1+1;
    end
end
percentage = percentage/6000

figure
plot(group0(:,1),group0(:,2),'.')
hold on
plot(group1(:,1), group1(:,2),'.')

z= @(x1,x2) dot(((mu0-mu1).'*inv(sigma)),[x1;x2])...
    +1/2*(mu1.'*inv(sigma)*mu1-mu0.'*inv(sigma)*mu0)+log((1-p)/p);
fcontour(z,[2 13 2 13],'LevelList',[0])

legend('class 0', 'class 1','classification')
title('Data Classification Using p = 0.05')
%%
data3=readmatrix('./data/qd.txt',"Delimiter",',');
%%
mu0=[9;10];
mu1=[6;7];
sigma0=[1.15 0.1; 0.1 0.5];
sigma1=[0.2 0.3; 0.3 2];
p=0.5;
percentage=0;

group0=zeros(4000,2);
group1=zeros(4000,2);
idx0=1; idx1=1;

for idx=1:length(data3)
    x=data3(idx,:).';
    if x.'*(1/2*(inv(sigma0)-inv(sigma1)))*x...
            +dot((mu1.'/(sigma1)-mu0.'/(sigma0)),x)...
         +1/2*(mu0.'/(sigma0)*mu0-mu1.'/(sigma1)*mu1)...
         +log(((1-p)*sqrt(det(sigma0)))/(p*sqrt(det(sigma1))))>=0
       percentage = percentage+1;
        group0(idx0,:)=x;
        idx0=idx1+1;
    else
        group1(idx1,:)=x;
        idx1=idx1+1;
    end
end

percentage=percentage/length(data3)
figure
plot(group0(:,1),group0(:,2),'.')
hold on
plot(group1(:,1), group1(:,2),'.')

z= @(x1, x2) [x1;x2].'*(1/2*(inv(sigma0)-inv(sigma1)))*[x1;x2]...
            +dot((mu1.'/(sigma1)-mu0.'/(sigma0)),[x1;x2])...
         +1/2*(mu0.'/(sigma0)*mu0-mu1.'/(sigma1)*mu1)...
         +log(((1-p)*sqrt(det(sigma0)))/(p*sqrt(det(sigma1))));
fcontour(z,[2 13 2 13],'LevelList',[0])
legend('class 0', 'class 1','classification')
title('Quadratic discriminant analysis')