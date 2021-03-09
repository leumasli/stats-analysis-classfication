%% 
% 2 (a)

n = [1,2,3,4,5,10,20,30];
figure 
for idx =1:8
    subplot(4,2,idx)
    histogram(Mn(n(idx)),'Normalization',"pdf",'BinWidth',1/(n(idx)+1))
    ylabel('F(Mn)')
    xlabel('Mn')
    title(['n = ',num2str(n(idx))])
end
sgtitle('PDF for continuous RV')
figure
for idx =1:8
    subplot(4,2,idx)
    histogram(Mn(n(idx)),'Normalization',"cdf",'BinWidth',1/(n(idx)+1))
    ylabel('F(Mn)')
    xlabel('Mn')
    title(['n = ',num2str(n(idx))])
end
sgtitle('CDF for continuous RV')
%% 
% 2 (b)

figure
for idx =1:8
    subplot(4,2,idx)
    histogram(Mn(n(idx)),'Normalization',"pdf",'BinWidth',1/(n(idx)+1))
    hold on
    histogram(mvnrnd(4,4/(3*n(idx)),10000),'Normalization',"pdf",'BinWidth',1/(n(idx)+1))
    ylabel('F(Mn)')
    xlabel('Mn')
    title(['n = ',num2str(n(idx))])
end
sgtitle('PDF for continuous RV superimposed with gaussian RV')
figure
for idx =1:8
    subplot(4,2,idx)
    histogram(Mn(n(idx)),'Normalization',"cdf",'BinWidth',1/(n(idx)+1))
    hold on
    histogram(mvnrnd(4,4/(3*n(idx)),10000),'Normalization',"cdf",'BinWidth',1/(n(idx)+1))
    ylabel('F(Mn)')
    xlabel('Mn')
    title(['n = ',num2str(n(idx))])
end
sgtitle('CDF for continuous RV superimposed with gaussian RV')
%% 
% 2 (d)

n = [1,2,3,4,5,10,20,30];
figure
for idx =1:8
    subplot(4,2,idx)
    histogram(MnDis(n(idx)),'Normalization',"pdf",'BinWidth',1/(n(idx)+1))
    ylabel('F(Mn)')
    xlabel('Mn')
    title(['n = ',num2str(n(idx))])
end
sgtitle('PDF for discrete RV ')
figure
for idx =1:8
    subplot(4,2,idx)
    histogram(MnDis(n(idx)),'Normalization',"cdf",'BinWidth',1/(n(idx)+1))
    ylabel('F(Mn)')
    xlabel('Mn')
    title(['n = ',num2str(n(idx))])
end
sgtitle('CDF for discrete RV ')
%%
figure
for idx =1:8
    subplot(4,2,idx)
    histogram(MnDis(n(idx)),'Normalization',"pdf",'BinWidth',1/(n(idx)+1))
    hold on
    histogram(mvnrnd(3,12/(7*n(idx)),10000),'Normalization',"pdf",'BinWidth',1/(n(idx)+1))
    ylabel('F(Mn)')
    xlabel('Mn')
    title(['n = ',num2str(n(idx))])
end
sgtitle('PDF for discrete RV superimposed with gaussian RV')
figure
for idx =1:8
    subplot(4,2,idx)
    histogram(MnDis(n(idx)),'Normalization',"cdf",'BinWidth',1/(n(idx)+1))
    hold on
    histogram(mvnrnd(3,12/(7*n(idx)),10000),'Normalization',"cdf",'BinWidth',1/(n(idx)+1))
    ylabel('F(Mn)')
    xlabel('Mn')
    title(['n = ',num2str(n(idx))])
end
sgtitle('CDF for discrete RV superimposed with gaussian RV')
%%
function out=MnDis(n)
    out=zeros(1,10000);
    for idx=1:10000
        for jdx=1:n
            Xi=randi(7);
            if Xi==6
                Xi=2;
            elseif Xi==7
                Xi=4;
            end
            out(idx)=out(idx)+Xi;
        end
    end
    out=out./n;
    clear idx;
end
%% 
% Generating Mn for uniform distribution

function out=Mn(n)  
    out=zeros(1,10000);
    for idx=1:10000
        for jdx=1:n
            out(idx) = out(idx)+rand()*4+2;
        end
    end
    out=out./n;
    clear idx;
end