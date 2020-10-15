function cp=fusion_MLMG_PCNN(matrixA,matrixB,n)

%% 
Para.iterTimes=200;
Para.link_arrange=7;
Para.alpha_L=0.02;
Para.alpha_Theta=3;
Para.beta=3;
Para.vL=1;
Para.vTheta=20;
Para.T = 10*n;

%%
MSMG_A=multilevel_morph(abs(matrixA),Para.T);
MSMG_B=multilevel_morph(abs(matrixB),Para.T);

%%
PCNN_timesA=PCNN_withParameters(MSMG_A,Para);
PCNN_timesB=PCNN_withParameters(MSMG_B,Para);
map=(PCNN_timesA>=PCNN_timesB);

%%
cp=map.*matrixA+~map.*matrixB;