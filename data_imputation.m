data=readmatrix("./data/data_imputation.txt","Delimiter",'\n');
N=[10,20,50,100,200,300,500,1000,2000,10000,20000,30000,60000];
%get a array of muN corresponding to different N values
muN=zeros(1,13);
for i=1:13
    M=N(i);
    for j=1:M
        if ~isnan(data(j))
            muN(i) = muN(i)+data(j);
        else
            M=M+1;
        end
    end
end; clear i; clear j; clear M;

muN=muN./N;
%%
figure
scatter(N,muN)
hold on
plot(N, muN)
xlabel("N")
ylabel('\mu_{N}')
ylim([0,20])
set(gca,'XScale','log')
%% 
% 1 (c)

An=zeros(1,13);
%loop through the who set to exclude NaN
Kavail=0;
for i=1:length(data)
    if ~isnan(data(i))
        Kavail=Kavail+1;
    end
end; clear i;

for idx=1:13
    sum=0;
    for i=1:length(data)
        if ~isnan(data(i))
           sum=sum+(data(i)-muN(N==N(idx)))^2;
        end
    end;
    An(idx)=sum/Kavail;
    clear idx;
end
%%
figure
plot(N,An)
hold on; scatter(N,An)
set(gca,'XScale','log')
ylim([0,115])
xlabel("N")
ylabel('A_n')
clear;