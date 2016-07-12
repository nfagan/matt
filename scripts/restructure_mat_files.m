file_types = 'good_days'; % all | no_no_bs | no_bs | good_days
monk_1 = 'Kubrick';
monk_2 = 'Tarantino';

base_directory = '/Volumes/My Passport/NICK/Chang Lab 2016/matt/tit_for_tat_data';
data_directory = fullfile(base_directory,'Two-Way TfT',file_types);
cd(data_directory);

mat_files = dir('*.mat');
mat_file_names = {mat_files(:).name};

unique_days = unique(cellfun(@(x) x(1:10),mat_file_names,'UniformOutput',false));

%%
store_choices = cell(1,2); store_errors = cell(1,2);
for i = 1:length(unique_days)
    current_day = mat_file_names(strncmpi(mat_file_names,unique_days{i},length(unique_days{i})));
    n_blocks = max((cellfun(@(x) str2double(x(end-4)),current_day,'UniformOutput',true)));
    
    day_field = sprintf('day_%s',unique_days{i});
    
    for k = 1:n_blocks
        file_name_pattern_1 = sprintf('%s %s',monk_1,monk_2);
        file_name_pattern_2 = sprintf('%s %s',monk_2,monk_1);
        current_block_files = current_day(cellfun(@(x) strcmp(x(end-4),num2str(k)),current_day));
        
        
        if isempty(strfind(current_block_files{1},file_name_pattern_1)); % make sure that the
                                                          % pattern of
                                                          % monkey name
                                                          % inputs is the
                                                          % same across
                                                          % blocks / days
            current_block_files = fliplr(current_block_files);
        end
        
        try % some files don't work with analyze_choice_twoWay; skip 'em
            [choice, individual_choices, error] = ...
                analyze_choice_twoWay_TfT_general(current_block_files{1}, current_block_files{2}, k); 
            for j = 1:size(individual_choices,1) % for each monkey ...
                monk_id = j;
                for l = 1:size(individual_choices,2) % for each block ...
                    current_choices = individual_choices{j,l};
                    errors = error{j,l};
                    for m = 1:size(errors,1);
                       ind = (errors(m,2) >  current_choices(:,4)) & (errors(m,2) < current_choices(:,5));
                       
                       if sum(ind) >= 1;
                           fprintf('\nfound em');
                       end
                       
                       current_choices(ind,:) = [];
                       
                       if size(current_choices,1) == 65;
                           current_choices = current_choices(1:64,:);
                           fprintf('\ntruncating 65');
                       elseif size(current_choices,1) == 33;
                           fprintf('\ntruncating 33');
                           current_choices = current_choices(1:32,:);
                       end
                       
                    end
                end
                
                n_choices = size(current_choices,1);
                
                rep_k = repmat(k,n_choices,1);
                rep_i = repmat(i,n_choices,1);
                current_choices = [current_choices rep_k rep_i];
                store_choices{j} = [store_choices{j};current_choices];
                
            end
        catch
            
            fprintf('ERROR: something in analyze_choice_twoWay');
        end
    end
end    

%%

N = 0; % Number of trials to look back

n_days = length(unique(store_choices{1}(:,7)));
store_n_trials = cell(1,2); store_n_minus_n_trials = cell(1,2);
store_all_choices = cell(1,2); stp = 1; store_r = cell(1); store_lags = cell(1);
for i = 1:n_days
    first_monk_one_day = store_choices{1}(store_choices{1}(:,7) == i,:);
    sec_monk_one_day = store_choices{2}(store_choices{2}(:,7) == i,:);
    
    n_blocks = length(unique(first_monk_one_day(:,6)));
    
    for j = 1:n_blocks
        
        first_choices = first_monk_one_day(first_monk_one_day(:,6) == j,3);
        sec_choices = sec_monk_one_day(sec_monk_one_day(:,6) == j,3);
        
        min_n_trials = min([size(first_choices,1) size(sec_choices,1)]);
        
        choices = [first_choices(1:min_n_trials) sec_choices(1:min_n_trials)];
        
        for k = 1:2; % for each monk ...
            
            if k == 1;
                if ~isempty(choices)
                    choices = choices(randperm(length(choices)),:);
                    [r,lags] = xcorr(choices(:,1)',choices(:,2)');
        %             r = xcorr(choices);
                    store_r{stp} = r;
                    store_lags{stp} = lags;
                    stp = stp+1;
                end
            end
            
            choices = fliplr(choices);
            
            n_trials = choices(1+N:end,1); %current trial
            n_minus_n_trials = choices(1:end-N,2); % Nth trial - n trials    
            
            store_n_trials{k} = [store_n_trials{k};n_trials];
            store_n_minus_n_trials{k} = [store_n_minus_n_trials{k};n_minus_n_trials];
            store_all_choices{k} = [store_all_choices{k};choices];
            
        end
            
    end
     
end

% store_r = concatenateData(store_r);


for i = 1:2;
    [~,~,stats] = glmfit(store_n_minus_n_trials{i},store_n_trials{i},'binomial'); %predictor(s) are first input
    
    field_name = sprintf('monk_%d',i);
    
    betas.(field_name) = stats.beta;
    ps.(field_name) = stats.p;
    
end

% [~,~,stats] = glmfit(storeNMinusNOutcome,storeNOutcome,'binomial'); %predictor(s) are first input

%%

monk1_choices = store_all_choices{1}(:,1);
monk2_choices = store_all_choices{1}(:,2);
xs = 1:length(monk1_choices);

plot(xs,monk1_choices); hold on;
plot(xs,monk2_choices);

%%

xs_monk_1 = xs(monk1_choices~=0);
xs_monk_2 = xs(monk2_choices~=0);

monk2_choices_raster = repmat(1.2,length(xs_monk_2),1);
% monk2_choices_raster(1:end) = 2;

scatter(xs_monk_1,monk1_choices(monk1_choices==1),'r*'); hold on;
scatter(xs_monk_2,monk2_choices_raster','b*');

ylim([0 3]);

%% ancova

first_monk = repmat(1,1,length(monk1_choices));
sec_monk = repmat(2,1,length(monk2_choices));

groups = [first_monk;sec_monk];

aoctool(first_monk,sec_monk)

%%
figure;
hold on;

for i = 1:length(store_lags);
    
    plot(store_lags{i},store_r{i});
    
end

%% blocks of n trials analysis -- run after running sections 1 and 2

all_choices = [store_choices{1}(:,3) store_choices{2}(:,3)];
block_ns = store_choices{1}(:,1);
session_ns = store_choices{1}(:,7);

unique_blocks = unique(block_ns);
unique_sessions = unique(session_ns);

stp = 1;
for i = 1:length(unique_sessions)
    for k = 1:length(unique_blocks)
        block_ns(block_ns == unique_blocks(k) & session_ns == unique_sessions(i)) = stp;
        stp = stp+1;
    end
end


unique_blocks = unique(block_ns);   % update what the unique block identifiers are
window_size = 5;                   % number of trials to be considered
matching_threshold = .7;            % threshold for reciprocation in a given window

                                    % preallocate with arbitrarily huge
                                    % vector size
non_overlapping = 0;
percent_matching = nan(1,size(store_choices{1},1)); stp = 1; 
rows = 1:size(store_choices{1},1); start_indices = nan(1,size(store_choices{1},1));
for i = 1:length(unique(block_ns))
    one_block_choices = all_choices(block_ns == unique_blocks(i),:);
    max_n = floor(size(one_block_choices,1)/window_size);
    current_indices = rows(block_ns == unique_blocks(i));
    
    if non_overlapping
        for k = 1:window_size:(max_n-1)*window_size
    %         one_window_choices = one_block_choices(k:k*window_size,:);
            one_window_choices = one_block_choices(k:k+window_size-1,:);
            difference = one_window_choices(:,1) - one_window_choices(:,2);
            percent_matching(stp) = sum(difference == 0)/size(difference,1);
            start_indices(stp) = min(current_indices(k:k+window_size-1));
            stp = stp+1;
        end
    elseif ~non_overlapping
         for k = 1:(max_n-1)*window_size
            one_window_choices = one_block_choices(k:k+window_size-1,:);
            difference = one_window_choices(:,1) - one_window_choices(:,2);
            percent_matching(stp) = sum(difference == 0)/size(difference,1);
            stp = stp+1;
         end
    end
end

percent_matching(isnan(percent_matching)) = []; % get rid of leftover nans
start_indices(isnan(start_indices)) = [];

percent_above_thresh = sum(percent_matching >= matching_threshold)/size(percent_matching,2);

%% plot section 2

smoothed_percent_matching = smooth(percent_matching);
plot(percent_matching);

rows = 1:size(percent_matching,2);

above_point_7 = percent_matching(percent_matching > .7);
above_point_7_x = rows(percent_matching > .7);

between_point_3_point_7 = percent_matching(percent_matching >= .3 & percent_matching <= .7);
between_point_3_point_7_x = rows(percent_matching >= .3 & percent_matching <= .7);

below_point_3 = percent_matching(percent_matching < .3);
below_point_3_x = rows(percent_matching < .3);

plot(above_point_7_x,above_point_7,'r');
hold on; 
plot(between_point_3_point_7_x,between_point_3_point_7,'k'); 
plot(below_point_3_x,below_point_3,'g');

%%

% x = 0:pi/20:10*pi; 
% y = sin(x);
% c = sign(y - 0.5);
% p = patch([x NaN], [y NaN], [c NaN], [c NaN], 'edgecolor', 'interp');
% colormap([0 0 1; 1 0 0]);

above_point_7_ind = percent_matching > .7 | percent_matching < .3;

p = patch([rows NaN],[percent_matching NaN],[above_point_7_ind NaN],[above_point_7_ind NaN],'edgecolor','interp','linewidth',1);
colormap([0 0 1; 1 0 0]);

% figure;
% xs = 1:size(percent_matching,2);
% dotted_line = repmat(.7,1,max(xs));
% dotted_line2 = repmat(.3,1,max(xs));
% hold on; plot(xs,dotted_line,'k-'); plot(xs,dotted_line2,'k-');

%% plot section

window_n = 100;

monk1_choices = all_choices(start_indices(window_n):start_indices(window_n)+window_size,1);
monk2_choices = all_choices(start_indices(window_n):start_indices(window_n)+window_size,2);
xs = 1:length(monk1_choices);

xs_monk1 = xs(monk1_choices == 1);
xs_monk2 = xs(monk2_choices == 1);

monk1_choices = monk1_choices(monk1_choices == 1);
monk2_choices = monk2_choices(monk2_choices == 1) + 1;
    
scatter(xs_monk1,monk1_choices,'r*'); hold on;
scatter(xs_monk2,monk2_choices,'b*'); ylim([-2 4]);











