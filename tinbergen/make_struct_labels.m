function output_data = make_struct_labels(data)

label_fields = {'day','drugs'};
data_fields = {'data','time'};

behaviors = fieldnames(data);

for i = 1:length(behaviors)
    current_behavior = behaviors{i};
    for k = 1:length(label_fields)
        output_data.(current_behavior).Labels.(label_fields{k}) = ...
            data.(current_behavior).(label_fields{k});
    end
    for k = 1:length(data_fields)
        output_data.(current_behavior).Data.(data_fields{k}) = ...
            data.(current_behavior).(data_fields{k});
    end
end