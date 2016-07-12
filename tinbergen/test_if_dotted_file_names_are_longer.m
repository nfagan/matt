
for i = 1:length(tinbergen_matlab_output)
    
    day = tinbergen_matlab_output(i).day;
    current_day = tinbergen_matlab_output(i).day;
    file_ind = 0;
    
    dotted_lengths = []; non_dotted_lengths = [];
    while day == current_day & (i + file_ind) < length(tinbergen_matlab_output);
        stp = 1; n_dot_stp = 1;
        flipped_file_name = fliplr(tinbergen_matlab_output(i + file_ind).full_file_name);
        one_file_value_length = [];
        if flipped_file_name(2) == '.'
            try 
                dotted_lengths(stp) = length(concatenateData(tinbergen_matlab_output(i + file_ind).behavior.value));
            catch
                for j = 1:length(tinbergen_matlab_output(i+file_ind).behavior);
                    if ~iscell(tinbergen_matlab_output(i+file_ind).behavior(j).value);
                        one_file_value_length(j) = length(tinbergen_matlab_output(i+file_ind).behavior(j).value);
                    else
                        one_file_value_length(j) = 1;
                    end
                end
                dotted_lengths(stp) = sum(one_file_value_length);
            end
            stp = stp + 1;
        else
            try
                non_dotted_lengths(n_dot_stp) = ...
                    length(concatenateData(tinbergen_matlab_output(i + file_ind).behavior.value));
            catch
                for j = 1:length(tinbergen_matlab_output(i+file_ind).behavior)
                    if ~iscell(tinbergen_matlab_output(i+file_ind).behavior(j).value);
                        one_file_value_length(j) = length(tinbergen_matlab_output(i+file_ind).behavior(j).value);
                    else
                        one_file_value_length(j) = 1;
                    end
                end
                non_dotted_lengths(stp) = sum(one_file_value_length);
            end
            n_dot_stp = n_dot_stp + 1;
        end
       
    current_day = tinbergen_matlab_output(i+file_ind).day;
    file_ind = file_ind + 1;
    
    end
    
    if any(dotted_lengths > non_dotted_lengths)
%         error('Dotted lengths were longer than non dotted lengths');
        fprintf('\nDotted lengths were longer than non dotted lengths');
        fprintf('\n%d',i);
        fprintf('-----------');
    end
    
end