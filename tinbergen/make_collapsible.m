function data_obj = make_collapsible(data)

data_fields = fieldnames(data);

label_fields = {'day','drugs','behavior'};

for i = 1:length(label_fields)
    store_labels.(label_fields{i}) = cell(1000,1);
end

stp = 0;
for i = 1:length(data_fields)
    current_behav = data.(data_fields{i});
    
    data_types = fieldnames(current_behav.Data);
    
    for k = 1:length(label_fields)
        update_size = length(current_behav.Data.data);
        if ~strcmp(label_fields{k},'behavior')
            store_labels.(label_fields{k})(stp+1:stp+update_size,:) = current_behav.Labels.(label_fields{k});
        else
            store_labels.(label_fields{k})(stp+1:stp+update_size,:) = current_behav.Data.data;
        end
    end
    store_labels.behavior_group(stp+1:stp+update_size,:) = repmat({data_fields{i}},update_size,1);
    
    if any(strcmp(data_types,'duration'));
        store_data.duration(stp+1:stp+update_size,:) = current_behav.Data.duration;
    else
        store_data.duration(stp+1:stp+update_size,:) = NaN;
    end
    
    stp = stp + update_size;
end

empty_ind = cellfun(@isempty,store_labels.(label_fields{1}));
store_labels = structfun(@(x) x(~empty_ind),store_labels,'UniformOutput',false);

data_obj.Labels = store_labels;
data_obj.Data.data = store_labels.behavior;
data_obj.Data.duration = store_data.duration;



% end