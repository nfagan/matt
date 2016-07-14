function data = collapse_behaviors(data,collapse,collapse_to)

labels = data.Labels;
for i = 1:length(collapse)
    [~,ind] = tinb_separate_data(data,'behavior',{collapse{i}});
    labels.behavior(ind) = {collapse_to};
end

data.Labels = labels;
data.Data.data = labels.behavior;

end