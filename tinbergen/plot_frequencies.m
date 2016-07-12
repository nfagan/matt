function plot_frequencies(data,wanted_field)
% wanted_field = 'affiliative_behavior';

data_fields = fieldnames(data);

if ~any(strcmp(wanted_field,data_fields))
    error('The wanted field doesn''t exist in the data')
end

is_cell = structfun(@(x) iscell(x.data),data);
data_fields = data_fields(is_cell);

if ~any(strcmp(data_fields,wanted_field))
    error('The wanted field cannot have true/false values');
end

% for i = 1:length(data_fields)
% current_behav = data.(data_fields{i});
current_behav = data.(wanted_field);
current_days = unique(current_behav.day);
current_behaviors = unique(current_behav.data);

store_freqs = []; store_freqs_matrix = zeros(length(current_days),length(current_behaviors));
for k = 1:length(current_days)
    day_fieldname = ['day_' current_days{k}];
    for j = 1:length(current_behaviors)
        store_freqs_matrix(k,j) = sum(strcmp(current_behav.day,current_days{k}) & strcmp(current_behav.data,current_behaviors{j}));
        
        store_freqs.(day_fieldname).(current_behaviors{j}) = ...
            sum(strcmp(current_behav.day,current_days{k}) & strcmp(current_behav.data,current_behaviors{j}));
    end
end

bar(store_freqs_matrix);
set(gca,'XTickLabel',current_days);
legend(current_behaviors);

