function tb_list_files_fn(file_name)

% tinbergen_output_directory = '/Volumes/My Passport/NICK/Chang Lab 2016/matt/angie_mackenzye/tinbergenoutput';
tinbergen_output_directory = '/Volumes/My Passport/NICK/Chang Lab 2016/matt/angie_mackenzye/tinbergen_output_new';
save_directory = '/Volumes/My Passport/NICK/Chang Lab 2016/matt/angie_mackenzye';

cd(tinbergen_output_directory);

% tinbergen_files = rid_super_sub_folder_references(dir(tinbergen_output_directory));
tinbergen_files = dir('*.tbobs');

tinbergen_filenames = {tinbergen_files(:).name}';

tinbergen_matlab_output = []; stp = 1;
for i = 1:length(tinbergen_filenames)
    current_file_name = tinbergen_filenames{i};
    underscore_index = strfind(current_file_name,'_');
    
    if isempty(underscore_index)
        error('Filenames must have an underscore followed by the date');
    end
    
    day = current_file_name(underscore_index+1:underscore_index+6);
    
    obs=tb_load_obs(current_file_name);
    
    if ~isempty(obs.behav)
    
        %%%
        % get outputs from obs structure and store them for each file
        %%%
        tinbergen_matlab_output(stp).day = day;
        tinbergen_matlab_output(stp).full_file_name = current_file_name;
        tinbergen_matlab_output(stp).behavior = obs.behav;
        tinbergen_matlab_output(stp).monkey = obs.observer;
        tinbergen_matlab_output(stp).source = obs.source;  
        stp = stp +1;
    end
    
end

cd(save_directory);
full_file_name = sprintf('%s_processed_data.mat',file_name);
save(full_file_name);

