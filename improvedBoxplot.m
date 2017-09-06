function [h] = improvedBoxplot(x)

x = reshape(x,length(x),min(size(x)));
    
h = figure;
boxplot(x,'jitter', 0.25,'MedianStyle','target','Colors',[0.15 0.15 0.15]);
jit= 0.02.* randn(size(x,1),1);      % COULD MAKE THIS 0.02 VARY BASED ON BOXPLOT WIDTH?
for i= 1: size(x,2)
    hold on; plot((i-0.07):0.001:(i+0.07),mean(x(:,i)),'.r');  % NEED  TO IMPROVE THIS (INSTEAD OF +- 0.07 IT SHOULD VARY BASED ON PLOT)
    plot(jit + ones(size(x,1),1),x(:,i),'.','Color',[0.2 0.2 0.2]);   
end
set(gca,'TickDir','out');
set(gcf, 'color', 'white');

% varargin      % NEED TO ADD THIS OPTION
% if vectors with different lengths
% x1= AssymHCN;
% x2 = AssymThN;
% x3 = AssymPFCN;
% 
% x = [x1; x2; x3];
% g = [ones(length(x1), 1); 2 *ones(length(x2), 1); 3*ones(length(x3), 1)];
% boxplot(x, g,'jitter', 0.25,'MedianStyle','target','Colors',[0.15 0.15 0.15],'orientation', 'horizontal');
% 
% hold on;
% jit= 0.05.* randn(size(x1,1),1);
% hold on; plot(nanmean(x1),(1-0.21):0.01:(1+0.21),'.r'); 
% plot(x1,jit + ones(size(x1,1),1),'.','Color',[0.2 0.2 0.2]);
% set(gca,'XTick',-1:0.5:1);    set(gca,'TickDir','out');
% 
% jit= 0.05.* randn(size(x2,1),1);
% hold on; plot(nanmean(x2),(2-0.21):0.01:(2+0.21),'.r'); 
% plot(x2,jit + 2.*ones(size(x2,1),1),'.','Color',[0.2 0.2 0.2]);
% set(gca,'XTick',-1:0.5:1);    set(gca,'TickDir','out');
% 
% jit= 0.05.* randn(size(x3,1),1);
% hold on; plot(nanmean(x3),(3-0.21):0.01:(3+0.21),'.r'); 
% plot(x3,jit + 3.*ones(size(x3,1),1),'.','Color',[0.2 0.2 0.2]);
% set(gca,'XTick',-1:0.5:1);    set(gca,'TickDir','out');




