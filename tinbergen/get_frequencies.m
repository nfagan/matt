function output_data = get_frequencies(data,within)

% within = 'day';

if ~strcmp(within,'day') && ~strcmp(within,'drugs')
    error('Unrecognized label ''%s''',within);
end

data_fields = fieldnames(data);

output_data = data;

for i = 1:length(data_fields)
    unique_values = unique(data.(data_fields{i}).Labels.(within));
    unique_behaviors = unique(data.(data_fields{i}).Data.data);
    
    for k = 1:length(unique_behaviors)
        output_data.(data_fields{i}).Data.frequencies.(unique_behaviors{k}) = 0;
    end
    
    for k = 1:length(unique_values)
        separated_data = tinb_separate_data(data.(data_fields{i}),within,{unique_values{k}});
        
        for j = 1:length(unique_behaviors)
            freq = sum(strcmp(separated_data.Data.data,unique_behaviors{j}));
            
            output_data.(data_fields{i}).Data.frequencies.(unique_behaviors{j}) = ...
                output_data.(data_fields{i}).Data.frequencies.(unique_behaviors{j}) + freq;
        end
        
    end
    
    
end