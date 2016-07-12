function output_data = sum_within_days(data,to_sum)

if nargin < 2
    to_sum = 'time';
end

data_fields = fieldnames(data);

for k = 1:length(data_fields)
    wanted_field = data_fields{k};
    days = unique(data.(wanted_field).day);

    stp = 1;
    for i = 1:length(days)
        unique_behaviors = unique(data.(wanted_field).data);
        for k = 1:length(unique_behaviors)
            ind_of_wanted_behavior = strcmp(data.(wanted_field).data,unique_behaviors{k}) & ...
                strcmp(data.(wanted_field).day,days{i});

            drug = unique(data.(wanted_field).drugs(ind_of_wanted_behavior));

            if strcmp(to_sum,'time');
                extr_time = data.(wanted_field).time(ind_of_wanted_behavior,:);
                if size(extr_time,2) == 1
                    fprintf(['\nSkipping field ''%s'' because it has only one' ...
                        , ' columns'' worth of times'],wanted_field);
                else 
                    output_data.(wanted_field).summed_time(stp,1) = sum(sum(extr_time(:,2) - extr_time(:,1),2));
                end
            else
                extr_freq = sum(ind_of_wanted_behavior);
                output_data.(wanted_field).summed_freq(stp,1) = extr_freq;
            end
            if any(ind_of_wanted_behavior)
                output_data.(wanted_field).day(stp,1) = {days{i}};
                output_data.(wanted_field).drugs(stp,1) = drug;
                output_data.(wanted_field).data(stp,1) = {unique_behaviors{k}};
                stp = stp + 1;
            end
        end
    end
end

