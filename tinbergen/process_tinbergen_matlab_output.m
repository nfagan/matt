function processed_data = process_tinbergen_matlab_output(tinbergen_matlab_output)

%% establish the unique behavior metrics

all_fields = cell(1,length(tinbergen_matlab_output));
for i = 1:length(tinbergen_matlab_output)
    all_fields{i} = lower({tinbergen_matlab_output(i).behavior(:).name}');
end

unique_fields = unique(concatenateData(all_fields'));

%% preallocate data and time fields of processed_data

for i = 1:length(unique_fields)
    processed_data.(unique_fields{i}).data = cell(1);
    processed_data.(unique_fields{i}).time = cell(1);
    processed_data.(unique_fields{i}).day = cell(1);
    
end

%% for each line of tinbergen_matlab_output, get the name of the behavior metric,
% and append the per-day values, per-day times, and the day-id to the
% appropriate field of processed_data.(field) (e.g.,
% processed_data.(...).data, etc.)

for i = 1:length(tinbergen_matlab_output)
    
   for j = 1:length(tinbergen_matlab_output(i).behavior);
        field_name = lower(tinbergen_matlab_output(i).behavior(j).name);
        
        data_to_update = tinbergen_matlab_output(i).behavior(j).value;
        times_to_update = tinbergen_matlab_output(i).behavior(j).time;
        days_to_update = repmat({tinbergen_matlab_output(i).day},length(data_to_update),1);
        
        if length(data_to_update) ~= length(times_to_update) || ...
                length(days_to_update) ~= length(data_to_update)
            error('lengths don''t match');
        end
        
        processed_data.(field_name).data = ...
            [processed_data.(field_name).data; data_to_update];
        
        processed_data.(field_name).time = ...
            [processed_data.(field_name).time; times_to_update];
        
        processed_data.(field_name).day = ...
            [processed_data.(field_name).day; days_to_update];
        
   end
end

%% remove the one extra empty cell, and transform cell arrays of times into a vector of times
for i = 1:length(unique_fields)
    empty_data_ind = cellfun(@isempty,processed_data.(unique_fields{i}).data);
    empty_time_ind = cellfun(@isempty,processed_data.(unique_fields{i}).time);
    empty_day_ind = cellfun(@isempty,processed_data.(unique_fields{i}).day);
    
    processed_data.(unique_fields{i}).data(empty_data_ind) = [];
    processed_data.(unique_fields{i}).time(empty_time_ind) = [];
    processed_data.(unique_fields{i}).day(empty_day_ind) = [];
    
    processed_data.(unique_fields{i}).time = concatenateData(processed_data.(unique_fields{i}).time);
end

end