%% collapse data

group = {...
    'prosocial_vocalization_given',
    'prosocial_vocalization_receieved',
    'prosocial_receieved'
    };
group_name = 'vocalizations';

collapsed_data = collapse_behaviors(data,group,group_name);
collapsed_data = tinb_separate_data(collapsed_data,'behavior',{group_name});

%% plot

%   plot - look over 'days', or over 'drugs' | y-axis 'time',
%   'frequency','meanTime', or 'meanFreq'

tinb_plot(collapsed_data,'drugs','meanFreq');
