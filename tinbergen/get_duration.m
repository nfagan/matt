function data = get_duration(data)

data_fields = fieldnames(data);

for i = 1:length(data_fields);
    time = data.(data_fields{i}).Data.time;
    
    if size(time,2) == 1;
        fprintf(['\nNot calculating duration for %s because it has only' ...
            , ' one columns'' worth of times'],data_fields{i});
    else
        data.(data_fields{i}).Data.duration = time(:,2) - time(:,1);
    end
    
end

end