%% addpath
addpath('/Volumes/My Passport/NICK/Chang Lab 2016/repositories/tinbergen/functions');
addpath('/Volumes/My Passport/NICK/Chang Lab 2016/repositories/matt/tinbergen');

%% optionally preprocess data

tb_list_files_fn('0712_new');

%% load pre-processed data and reformat it

cd('/Volumes/My Passport/NICK/Chang Lab 2016/matt/angie_mackenzye');
file_name = '0712_new_processed_data';
processed_data = reformat_tinbergen_matlab_data(file_name);

%% some more preprocessing

%   add drug labels

data = collapse_across_drugs(processed_data);

%   make data labels

data = make_struct_labels(data);

%   get the duration of relevant behaviors

data = get_duration(data);

%   normalize by the session duration

data = norm_session_time(data);

%% plot
% output_data = get_frequencies(data,'day')
%   check the command window to see the possible plots

disp(fieldnames(data));

%   decide what to plot

look_at = 'grooming_behaviors';

%   plot - look over 'days', or over 'drugs' | y-axis 'time',
%   'frequency','meanTime', or 'meanFreq'

tinb_plot(data.(look_at),'drugs','frequency');






















%%

% data = sum_within_days(data,'frequency');

if ~strcmp(to_plot,'frequency')
    data = norm_by_session_time(data);
end

plot_behavioral_data_drug(data,look_at,'meanFreq');
% data2 = sum_within_days(data);

%% plot per day

look_at = 'affiliative_behavior';
plot_behavioral_data(processed_data,'grooming_behaviors','time');

