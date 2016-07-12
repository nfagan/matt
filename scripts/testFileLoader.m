firstFile = '04_11_2016 Kubrick Tarantino R_sp';
secFile = '04_11_2016 Tarantino Kubrick R_sp';
blocks = 5;

[blockLevel, trialLevel] = analyze_choice_twoWay_sp_3block(firstFile, secFile, blocks);

%% for block-level analysis - self

n = 1;

monkBlockStats = cell(1,size(blockLevel,2)); betaBlocks = zeros(2); pBlocks = zeros(2); %preallocate

for i = 1:size(blockLevel,2) %for each monkey ...
    oneMonk = blockLevel(:,i);
   
    nTrials = oneMonk(1+n:end); %current trial
    nMinusNTrials = oneMonk(1:end-n); % Nth trial - n trials    
    
    [~,~,stats] = glmfit(nMinusNTrials,nTrials,'normal');
    
    monkBlockStats{i} = stats; %store all stats
    betaBlocks(i,:) = stats.beta; %store betas and ps as separate variables (for legibility)
    pBlocks(i,:) = stats.p;
    
end

%% for block-level analysis - other

n = 1;

monkBlockStats = cell(1,size(blockLevel,2)); betaBlocks = zeros(2); pBlocks = zeros(2); %preallocate
monkIds = [1 2]; % add id for which monkey is which in the GLM output

for i = 1:size(blockLevel,2) %for each monkey ...
    blockLevel = fliplr(blockLevel);
    monkIds = fliplr(monkIds);
    oneMonk = blockLevel(:,1);
    otherMonk = blockLevel(:,2);
   
    nTrials = oneMonk(1+n:end); %current trial
    nMinusNTrials = otherMonk(1:end-n); % Nth trial - n trials    
    
    [~,~,stats] = glmfit(nMinusNTrials,nTrials,'normal');
    
    monkBlockStats{i} = stats; %store all stats
    betaBlocks(i,:) = stats.beta; %store betas and ps as separate variables (for legibility)
    pBlocks(i,:) = stats.p;
    
    storeMonkIds(i,1) = monkIds(1);
end



%% for trial-level analysis - self

n = 1;

monks = unique(trialLevel(:,3));
blocks = unique(trialLevel(:,2)); 

% preallocate
pTrials = zeros(2); betaTrials = zeros(2); monkTrialStats = cell(1,length(monks));

for i = 1:length(monks) %for each monkey ...
    storeNOutcome = []; storeNMinusNOutcome = []; %clear per-monkey stores
    for k = 1:length(blocks) % for each block ...
        oneBlockIndex = trialLevel(:,3) == monks(i) & ...
            trialLevel(:,2) == blocks(k); %get index of current block + monkey
        oneBlock = trialLevel(oneBlockIndex,:); %extract only that block + monkey
        
        nOutcome = oneBlock(1+n:end,4); %current trial; 4th column is outcome
        nMinusNOutcome = oneBlock(1:end-n,4); %Nth trial - n trials
        
        storeNOutcome = [storeNOutcome;nOutcome]; %store across blocks
        storeNMinusNOutcome = [storeNMinusNOutcome;nMinusNOutcome];
        
    end
    
    [~,~,stats] = glmfit(storeNMinusNOutcome,storeNOutcome,'binomial'); %predictor(s) are first input
    
    monkTrialStats{i} = stats; %store stats per monkey
    betaTrials(i,:) = stats.beta; %separately store betas and ps, for legibility
    pTrials(i,:) = stats.p;
    
end

%% for trial-level analysis - other

n = 1;

monks = unique(trialLevel(:,3));
blocks = unique(trialLevel(:,2)); 

% preallocate
pTrials = zeros(2); betaTrials = zeros(2); monkTrialStats = cell(1,length(monks));

for i = 1:length(monks) %for each monkey ...
    storeNOutcome = []; storeNMinusNOutcomeOther = []; %clear per-monkey stores
    monks = flipud(monks); %switch order of monkeys for each run of the loop
    for k = 1:length(blocks) % for each block ...
        oneBlockIndex = trialLevel(:,3) == monks(1) & ...
            trialLevel(:,2) == blocks(k); %get index of current block + 1st monkey
        oneBlock = trialLevel(oneBlockIndex,:); %extract only that block + monkey
        
        nOutcome = oneBlock(1+n:end,4); %current trial of monkey 1; 4th column is outcome
        
        otherMonkeyBlockIndex = trialLevel(:,3) == monks(2) & ...
            trialLevel(:,2) == blocks(k); %get index of current block + *other* monkey
        otherMonkeyBlock = trialLevel(otherMonkeyBlockIndex,:);        
        
        nMinusNOutcomeOther = otherMonkeyBlock(1:end-n,4); %Nth trial - n trials of other monkey's data
        
        storeNOutcome = [storeNOutcome;nOutcome]; %store across blocks
        storeNMinusNOutcomeOther = [storeNMinusNOutcomeOther;nMinusNOutcomeOther];
        
    end
    
    [~,~,stats] = glmfit(storeNMinusNOutcomeOther,storeNOutcome,'binomial'); %predictor(s) are first input
    
    monkTrialStats{i} = stats; %store stats per monkey
    betaTrials(i,:) = stats.beta; %separately store betas and ps, for legibility
    pTrials(i,:) = stats.p;
    
end

