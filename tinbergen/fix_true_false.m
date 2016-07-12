function processed_data = fix_true_false(processed_data)

%   make true / false -> 1 / 0

fields = fieldnames(processed_data);

for i = 1:length(fields)
    if strcmp(processed_data.(fields{i}).data{1},'true') || ...
            strcmp(processed_data.(fields{i}).data{1},'false')
        fprintf('\nAdjusting');
        
        true_ind = strcmp(processed_data.(fields{i}).data,'true');
        false_ind = strcmp(processed_data.(fields{i}).data,'false');
        
        if sum(true_ind) + sum(false_ind) ~= length(processed_data.(fields{i}).data)
            error('Lengths don''t match')
        end
        
        new_vector = false(length(true_ind),1);
        new_vector(true_ind,:) = true;
        
        if ~new_vector(1)
            error('first value is not true')
        end
        
        check_pairs = diff(new_vector); rows = 1:length(check_pairs);
        
        error_ind = rows(check_pairs == 0);
        
        if ~isempty(error_ind)
            new_vector(error_ind,:) = [];
        end
        
        check_diff_2 = diff(new_vector);
        if any(check_diff_2 == 0)
            error(' still not fixed')
        end
        
        if new_vector(end)
            fprintf('\nterminating last value');
            new_vector(end,:) = [];
        end
        
        time_no_errors = processed_data.(fields{i}).time;
        days_no_errors = processed_data.(fields{i}).day;
        time_no_errors(error_ind,:) = [];
        days_no_errors(error_ind,:) = [];
        
        fixed_time = [];
        
        fixed_time(:,1) = time_no_errors(new_vector,:);
        fixed_time(:,2) = time_no_errors(~new_vector,:);
        fixed_data = new_vector(new_vector,:);
        fixed_days = days_no_errors(new_vector);
        
        processed_data.(fields{i}).data = fixed_data;
        processed_data.(fields{i}).time = fixed_time;
        processed_data.(fields{i}).day = fixed_days;
        
%         processed_data.(fields{i}).fixed_data = fixed_data;
%         processed_data.(fields{i}).fixed_time = fixed_time;
%         processed_data.(fields{i}).fixed_days = fixed_days;
%         processed_data.(fields{i}).day(error_ind,:) = [];
        processed_data.(fields{i}).error_ind = error_ind;

        
    end
end


