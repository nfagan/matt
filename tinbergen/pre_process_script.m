%% addpath
addpath('/Volumes/My Passport/NICK/Chang Lab 2016/repositories/tinbergen/functions');
addpath('/Volumes/My Passport/NICK/Chang Lab 2016/repositories/matt/tinbergen');

%% optionally preprocess data

tb_list_files_fn('0712_new');

%% load pre-processed data and reformat it

cd('E:\nick_data\Dropbox (ChangLab)\Nick\angie_mackenzye_data');
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

%   format for collapsing

data = make_collapsible(data);
