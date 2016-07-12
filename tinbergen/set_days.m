function data = set_days(data,wanted_field,days_to_set,day_to_set_to)

avail_fields = fieldnames(data);

if ~any(strcmp(avail_fields,wanted_field))
    error('The wanted field doesn''t exist in the data structure');
end

if ~strcmp(days_to_set,'all')
    for i = 1:length(days_to_set)
        data.(wanted_field).days(strcmp(data.(wanted_field).days,days_to_set{i})) = day_to_set_to;
    end
else
    data.(wanted_field).days(:) = day_to_set_to;
end
