clear
Generate_Output;

%%
Color=get(gca,'ColorOrder');

X=datenum(2020,2:2:36,1); XT=X+1-datenum(2020,1,1); XTL=datestr(X,'mmm');

figure(2); clf; set(gcf,'position',[1 830 1500 515]);

for LOOP=1:5
     
    load(['Warwick_Output_Loop' num2str(LOOP) '_06_11_21.mat'])
   
    subplot(1,3,1)
    England_Data=squeeze(sum(nALL(2:8,:,:),[1 3])); 
    plot(1:length(England_Data),England_Data,'-','Color',Color(LOOP,:),'LineWidth',2); hold on
    
    subplot(1,3,2)
    England_Data=squeeze(sum(nHOSP_AD(2:8,:,:),[1 3])); 
    plot(1:length(England_Data),England_Data,'-','Color',Color(LOOP,:),'LineWidth',2); hold on
    
    subplot(1,3,3)
    England_Data=squeeze(sum(nDEATHS(2:8,:,:),[1 3])); 
    plot(1:length(England_Data),England_Data,'-','Color',Color(LOOP,:),'LineWidth',2); hold on
   
    drawnow;
end
subplot(1,3,1)
England_Data=squeeze(sum(nALL(2:8,:,:),[1 3]));
plot(1:671,England_Data(1:671),'-k','LineWidth',2); hold off
set(gca,'XLim',[40 970],'XTick',XT,'XTickLabel',XTL);
ylabel('Infections','FontSize',14);

 subplot(1,3,2)
    England_Data=squeeze(sum(nHOSP_AD(2:8,:,:),[1 3])); 
plot(1:673,England_Data(1:673),'-k','LineWidth',2); hold off
set(gca,'XLim',[40 970],'XTick',XT,'XTickLabel',XTL);
ylabel('Hospital Admissions','FontSize',14);

 subplot(1,3,3)
    England_Data=squeeze(sum(nDEATHS(2:8,:,:),[1 3])); 
 plot(1:677,England_Data(1:677),'-k','LineWidth',2); hold off
 set(gca,'XLim',[40 970],'XTick',XT,'XTickLabel',XTL);
ylabel('Deaths','FontSize',14);      
