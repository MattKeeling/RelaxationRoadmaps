%% Run a single sample of the July code

clear
Generate_Output;

%% Plot Time Series of Infections, Hospital Admissions and Deaths for  7 different behaviours

clear

Color=[0.8 0.8 0.8; 1 0.8 0.8; 0.7 0.9 0.7];
ECol=[0.6 0 0.8; 1 0 0; 0.3 0.3 1; 0 0.85 0; 1 0 1; 1 0.7 0; 0 0.9 0.8];

X=datenum(2020,2:2:36,1); XT=X+1-datenum(2020,1,1); XTL=datestr(X,'mmm');

figure(1); clf; set(gcf,'position',[1 830 1500 515]);

load(['Warwick_Output_26_06_21.mat']);

VarNames={'ALL','HOSP_AD','DEATHS'};
TrueNames={'Infections','Hospital Admissions','Deaths'};

for Names=1:3
    
    subplot(1,3,Names);
    
    for PreCBeh=1:7
        
        eval(['Y=squeeze(' VarNames{Names} '(PreCBeh,:,:,:));']);
        English_Data=sum(Y(2:8,:,:),[1 3]);
        
        plot(1:length(English_Data),English_Data,'-','LineWidth',2,'Color',ECol(PreCBeh,:)); hold on
        
    end
    
    plot(1:570,English_Data(1:570),'k','LineWidth',2);
    
    hold off
    
    set(gca,'XLim',[40 970],'XTick',XT,'XTickLabel',XTL);
    ylabel(TrueNames{Names},'FontSize',14);
  
end




