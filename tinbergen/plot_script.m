%% addpath
addpath('/Volumes/My Passport/NICK/Chang Lab 2016/repositories/tinbergen/functions');
addpath('/Volumes/My Passport/NICK/Chang Lab 2016/repositories/matt/tinbergen');

%% get processed_data
cd('/Volumes/My Passport/NICK/Chang Lab 2016/matt/angie_mackenzye');
file_name = '0708_processed_data';
processed_data = reformat_tinbergen_matlab_data(file_name);

%% plot over days

look_at = 'grooming_behaviors';

%   add drug labels

data = collapse_across_drugs(processed_data);

%   make data labels

data = make_struct_labels(data);

%   get the duration of relevant behaviors

data = get_duration(data);

%   normalize by the session duration

data = norm_session_time(data);

%   plot - look over 'days', or over 'drugs' | y-axis 'time',
%   'frequency','meanTime', or 'meanFreq'

tinb_plot(data.(look_at),'drugs','time');

















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

