function processed_data = reformat_tinbergen_matlab_data(file_name)

%   get pre-processed tinbergen output

% load('0708_processed_data.mat');
load(file_name);

%   transform it into struct form

processed_data = process_tinbergen_matlab_output(tinbergen_matlab_output);

%   remove non true-false pairs

processed_data = fix_true_false(processed_data);

%   combine individual grooming behaviors into one field called
%   "grooming_behaviors"

processed_data = collapse_fields(...
    {'grooming_given','grooming_received','grooming_self'},...
    'grooming_behaviors',...
    processed_data);

%   transform data so that 'true' = the name of the behavior

fields_to_collapse = {'huddling','grooming_given','grooming_received','grooming_self'};

for i = 1:length(fields_to_collapse)
    processed_data = collapse_fields({fields_to_collapse{i}},fields_to_collapse{i},processed_data);
end


