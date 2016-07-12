function tinb_plot(data_field,plot_over,to_plot)
% data_field = data.grooming_behaviors;
% plot_days = false;
% to_plot = 'meanTime';

days = unique(data_field.Labels.day);
drugs = unique(data_field.Labels.drugs);
behaviors = unique(data_field.Data.data);

data_fields = fieldnames(data_field.Data);

if (strcmp(to_plot,'time') || strcmp(to_plot,'meanTime')) && ~any(strcmp(data_fields,'duration'));
    error('Cannot plot time for this data-field');
end

if strcmp(plot_over,'days')
    values_to_plot = zeros(length(days),length(behaviors)); 
    errors_to_plot = zeros(length(days),length(behaviors)); 
    loop_length = length(days); x_axis_labels = days; x_label = 'Days';
else
    values_to_plot = zeros(length(drugs),length(behaviors)); 
    errors_to_plot = zeros(length(drugs),length(behaviors)); 
    loop_length = length(drugs); x_axis_labels = drugs; x_label = 'Drugs';
end

for k = 1:length(behaviors)
    curr_behav = behaviors{k};
    for i = 1:loop_length
        if strcmp(plot_over,'days')
            vals_obj = tinb_separate_data(data_field,'day',{days{i}});
        else
            vals_obj = tinb_separate_data(data_field,'drugs',{drugs{i}});
        end
        vals = vals_obj.Data; labs = vals_obj.Labels;
        ind = strcmp(vals.data,curr_behav);
        if strcmp(to_plot,'frequency')
            values_to_plot(i,k) = sum(ind);
        elseif strcmp(to_plot,'time')
            duration = vals.duration(ind);
            values_to_plot(i,k) = sum(duration);
        elseif strcmp(to_plot,'meanTime') % sum within days
            days_in_labs = unique(labs.day); store_sum = zeros(1,length(days_in_labs));
            for j = 1:length(days_in_labs)
                separated_values = tinb_separate_data(vals_obj,'day',{days_in_labs{j}});
                if ~isempty(separated_values.Data.duration)
                    store_sum(j) = sum(separated_values.Data.duration(...
                        strcmp(separated_values.Data.data,curr_behav)));
                end
            end
            values_to_plot(i,k) = mean(store_sum);
            errors_to_plot(i,k) = std(store_sum);
        elseif strcmp(to_plot,'meanFreq') % sum within days
            days_in_labs = unique(labs.day); store_sum = zeros(1,length(days_in_labs));
            for j = 1:length(days_in_labs)
                separated_values = tinb_separate_data(vals_obj,'day',{days_in_labs{j}});
                if ~isempty(separated_values.Data.data)
                    store_sum(j) = sum(strcmp(separated_values.Data.data,curr_behav));
                end
            end
            values_to_plot(i,k) = mean(store_sum);
            errors_to_plot(i,k) = std(store_sum);
        end
    end
end

errorbar(values_to_plot,errors_to_plot);

set(gca,'XTick',1:loop_length);
set(gca,'XTickLabel',x_axis_labels);
xlabel(x_label);

% bar(values_to_plot);