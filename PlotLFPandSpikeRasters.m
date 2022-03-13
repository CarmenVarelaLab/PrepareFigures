
%   LOAD LFP AND SPIKES -- SEE BELOW FOR NEURALYNX DATA FILES
%%

LFPData = CxLFP;
Spikets = muaCx;
  
scrsz=get(0,'screensize'); 
figure('Position',[80 80 scrsz(3) scrsz(4)/1.2])
hold on;
set(gcf, 'color', 'white');
set(gca, 'Box','off','fontsize',14, 'fontweight', 'bold');
set(gca,'linewidth',2.1); % thickness of the axes   

plot(ts,LFPData,'k');
hold on;

ta=length(Spikets);
ta=ta(1);
for i=1:ta
    line([Spikets(i) Spikets(i)], [0.6 0.7],'color','b','linestyle','-','linewidth',1);
end
  
%% add events
hold on; plot(rippleTimes(:,1),0.5,'*r');
ylim([-1.5 1.5]);
 
%% 

% load LFP and spikes
% if neuralynx data

% Cortical LFP
[ timestamps, sampleFrequencies, CxLFP, header ]= Nlx2MatCSC(...
    'CSC9_LFP.ncs',...
    [ 1 0 1 0 1 ],...
    1,...
    1,...
    [ ] );
%% to load just part of the file
% 
% [ timestamps, sampleFrequencies, CxLFP, header ]= Nlx2MatCSC(...
%     CxLFPFile,...
%     [ 1 0 1 0 1 ],...
%     1,...
%     4,...
%     [1632912364203345 (1632912364203345+200000) ] );


%%
  
is_present = not( cellfun( @isempty, strfind( header, 'ADBitVolts' ) ) );

ADBitVolt = header{is_present ==1};
ADBitVolt(1:12) = [];
ADBitVolt = str2num(ADBitVolt);

CxLFP = CxLFP(:)' .* ADBitVolt .* 1000; % in miliVolts


% generate timestamps
sampleInterv = 1 ./ sampleFrequencies ( 1 );
tot = length( CxLFP );
[ ts ] = ( 0 : 1 : ( tot -1 ) ) .* sampleInterv; % genera
% 
timestampsSecs = timestamps(1) *10^-6; % first sample in seconds

%%  CORTEX SPIKES
% Load --- Cx spikes and separate Baseline and Post-training (below for HC spikes)

[AllSpikesCxTT,Header] = Nlx2MatSpike('TT3.ntt',[1 0 0 0 0],1,1,1);

muaCx = AllSpikesCxTT*10^-6;  % TT is in microsec, change to s
muaCx = muaCx - timestampsSecs; % Zero with respect to start of LFP

%


