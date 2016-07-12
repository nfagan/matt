function plot_behavioral_data_drug(data,wanted_field,to_plot)

data_fields = fieldnames(data);

if ~any(strcmp(wanted_field,data_fields))
    error('The wanted field doesn''t exist in the data')
end

is_cell = structfun(@(x) iscell(x.data),data);
data_fields = data_fields(is_cell);

if ~any(strcmp(data_fields,wanted_field))
    error('The wanted field cannot have true/false values');
end

current_behav = data.(wanted_field);
current_drugs = unique(current_behav.drugs);
disp(current_drugs);
current_behaviors = unique(current_behav.data);

store_freqs = []; 
store_freqs_matrix = zeros(length(current_drugs),length(current_behaviors)); 
store_errors = zeros(length(current_drugs),length(current_behaviors)); 
stp = 1;
for k = 1:length(current_drugs)
    day_fieldname = ['day_' current_drugs{k}];
    for j = 1:length(current_behaviors)
        if strcmp(to_plot,'frequency')
            frequency = sum(strcmp(current_behav.day,current_drugs{k}) & strcmp(current_behav.data,current_behaviors{j}));
            store_freqs_matrix(k,j) = frequency;
            store_sum(stp) = frequency; stp = stp + 1;
        elseif strcmp(to_plot,'time')
            current_times = current_behav.time(strcmp(current_behav.day,current_drugs{k}) & strcmp(current_behav.data,current_behaviors{j}),:);
%             total_time = sum(sum(current_times(:,2) - current_times(:,1),2));
            total_time = mean(sum(current_times(:,2) - current_times(:,1),2));
            store_freqs_matrix(k,j) = total_time;
            store_errors(k,j) = std(sum(current_times(:,2) - current_times(:,1),2));
%             store_sum(stp) = frequency; stp = stp + 1;
        elseif strcmp(to_plot,'freqOverTime')
            frequency = sum(strcmp(current_behav.day,current_drugs{k}) & strcmp(current_behav.data,current_behaviors{j}));
            current_times = current_behav.time(strcmp(current_behav.day,current_drugs{k}) & strcmp(current_behav.data,current_behaviors{j}),:);
            total_time = sum(sum(current_times(:,2) - current_times(:,1),2));
            store_freqs_matrix(k,j) = frequency ./ total_time;
            store_sum(stp) = frequency; stp = stp + 1;
        elseif strcmp(to_plot,'meanTime')
            current_times = current_behav.summed_time(strcmp(current_behav.drugs,current_drugs{k}) & strcmp(current_behav.data,current_behaviors{j}),:);
            store_freqs_matrix(k,j) = mean(current_times);
            store_errors(k,j) = std(current_times);
        elseif strcmp(to_plot,'meanFreq');
            current_times = current_behav.summed_freq(strcmp(current_behav.drugs,current_drugs{k}) & strcmp(current_behav.data,current_behaviors{j}),:);
            if ~isempty(current_times)
                store_freqs_matrix(k,j) = mean(current_times);
                store_errors(k,j) = std(current_times);
            else
                store_freqs_matrix(k,j) = 0;
                store_errors(k,j) = 0;
            end
            
        end
        
        store_freqs.(day_fieldname).(current_behaviors{j}) = ...
            sum(strcmp(current_behav.day,current_drugs{k}) & strcmp(current_behav.data,current_behaviors{j}));
    end
end

try
    errorbar(store_freqs_matrix,store_errors);
catch
    bar(store_freqs_matrix);
end
set(gca,'XTick',1:length(current_drugs));
set(gca,'XTickLabel',current_drugs);
xlabel('Drugs');

for i = 1:length(current_behaviors)
	current_behaviors{i}(strfind(current_behaviors{i},'_')) = ' ';
end

legend(current_behaviors);

if strcmp(to_plot,'time') || strcmp(to_plot,'meanTime')
    ylabel('Seconds');
else
    ylabel('Frequency');
end

try
    fprintf('\nNumber of behaviors plotted: %d',sum(store_sum));
catch
    fprintf('\nNo store sum variable exists');
end

