function data = collapse_across_drugs(data)

drug_mapping = struct(...
    'n',{{'070616','071016','062716'}},...
    'ot',{{'062216','070116','070916'}},...
    'otn',{{'062116','062816','070516','070816'}},...
    'sal',{{'062916','070716'}},...
    'rem',{{'061516','061616','062016','062316'}} ...
);

drug_fields = fieldnames(drug_mapping);
data_fields = fieldnames(data);

for j = 1:length(data_fields)
wanted_field = data_fields{j};
    data.(wanted_field).drugs = data.(wanted_field).day;
    for i = 1:length(drug_fields)
        days_to_map = drug_mapping.(drug_fields{i});
        for k = 1:length(days_to_map);
            ind = strcmp(data.(wanted_field).drugs,days_to_map{k});
            data.(wanted_field).drugs(ind,:) = {drug_fields{i}};
        end
    end

    % data.(wanted_field).day = data.(wanted_field).drugs;

    rem_ind = strcmp(data.(wanted_field).drugs,'rem');

    data.(wanted_field).day(rem_ind,:) = [];
    data.(wanted_field).time(rem_ind,:) = [];
    data.(wanted_field).data(rem_ind,:) = [];
    data.(wanted_field).drugs(rem_ind,:) = [];
end
% empty_ind = cellfun(@isempty,data.(wanted_field).day);

% data.(wanted_field).day(empty_ind,:) = [];
% data.(wanted_field).time(empty_ind,:) = [];


