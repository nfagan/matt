function data = norm_session_time(data)

data_fields = fieldnames(data);

session_durations = struct(...
    'day_062716',(1 + (1/6)), ...
    'default',1.5 ...
);

for i = 1:length(data_fields)
    unique_days = unique(data.(data_fields{i}).Labels.day);
    for k = 1:length(unique_days)
        [separated_data,ind] = tinb_separate_data(data.(data_fields{i}),'day',{unique_days{k}});
        data_items = fieldnames(separated_data.Data);
        
        if ~any(strcmp(data_items,'duration'))
            fprintf('\nSkipping %s because it does not have duration data.',data_fields{i});
        else
            duration = separated_data.Data.duration;
            try
                to_norm_by = session_durations.(['day_' unique_days{k}]);
            catch
                fprintf('\nUsing default value %f for day %s',session_durations.default,unique_days{k});
                to_norm_by = session_durations.('default');
            end
            data.(data_fields{i}).Data.duration(ind) = duration ./ to_norm_by;
        end
    end
end