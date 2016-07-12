function data = norm_by_session_time(data)

norm_mapping = struct(...
    'day_062716',(1 + (1/6)), ...
    'default',1.5 ...
);

% unique_days = unique(data.(wanted_field).day);
data_fields = fieldnames(data);

for k = 1:length(data_fields)
    wanted_field = data_fields{k};
    unique_days = unique(data.(wanted_field).day);
    for i = 1:length(unique_days)
        ind_of_current_day = strcmp(data.(wanted_field).day,unique_days{i});
        individ_data_fields = fieldnames(data.(wanted_field));
        if ~any(strcmp(individ_data_fields,'summed_time'));
            fprintf('\nNo summed-time field exists for %s, so it will not be normalized.',data_fields{k});
        else
            summed_time = data.(wanted_field).summed_time(ind_of_current_day,:);
            try 
                value_to_norm_by = norm_mapping.(['day_' unique_days{i}]);
            catch
                fprintf('\nUsing default value %f for day %s',norm_mapping.default,unique_days{i});
                value_to_norm_by = norm_mapping.default;
            end
            normed_time = summed_time/value_to_norm_by;
            data.(wanted_field).summed_time(ind_of_current_day) = normed_time;
        end
    end
end