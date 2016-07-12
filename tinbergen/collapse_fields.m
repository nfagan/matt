function data = collapse_fields(fields_to_collapse,collapsed_name,data)

data_field_name = 'data';
time_field_name = 'time';
day_field_name = 'day';

% fields_to_collapse = {'grooming_given','grooming_received','grooming_self'};
avail_fields = fieldnames(data);

if sum(cellfun(@(x) sum(strcmp(avail_fields,x)),fields_to_collapse)) ~= ...
        length(fields_to_collapse)
    error('Could not find one of the fields in the data structure');
end

store_fields = cell(1000,1);
store_times = zeros(1000,2);
store_days = cell(1000,1);

stp = 0;
for i = 1:length(fields_to_collapse)
    repeated_field = repmat({fields_to_collapse{i}},length(data.(fields_to_collapse{i}).(data_field_name)),1);
    update_size = length(repeated_field);
    
    store_fields(stp+1:stp+update_size,:) = repeated_field;
    store_times(stp+1:stp+update_size,:) = data.(fields_to_collapse{i}).(time_field_name);
    store_days(stp+1:stp+update_size,:) = data.(fields_to_collapse{i}).(day_field_name);
    
    stp = stp + update_size;
end

empty_ind = cellfun(@isempty,store_fields);
store_fields(empty_ind,:) = [];
store_times(empty_ind,:) = [];
store_days(empty_ind,:) = [];

data.(collapsed_name).(data_field_name) = store_fields;
data.(collapsed_name).(time_field_name) = store_times;
data.(collapsed_name).(day_field_name) = store_days;


