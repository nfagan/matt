function store_diff = report_difference(data)

fields = fieldnames(data);

store_diff = nan(1000,1); stp = 0;
for i = 1:length(fields)
    try 
        update_size = length(data.(fields{i}).fixed_time);
        store_diff(stp+1:stp+update_size,:) = data.(fields{i}).fixed_time(:,2) - data.(fields{i}).fixed_time(:,1);
        stp = stp + update_size;
    catch
        fprintf('\n%s does not have a fixed_time field',fields{i});
    end
end

store_diff(isnan(store_diff)) = [];