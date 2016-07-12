monk={'Campion', 'Coppola', 'Hitchcock', 'Lager', 'Kurosawa' };
brief={'cam', 'cop', 'hit', 'lag', 'kur'};
flip={'A','B','C','D','E'};
for t=5
    for f=5
        list=[];
            file_loc=sprintf('~/new/Movie Tbob/%s_18min_%s.AVI.%s.tbobs', monk{t}, flip{f}, brief{t});
            obs=tb_load_obs(file_loc);
            time=obs.behav.time;
            value=obs.behav.value;
            for i=1:length(time)
                A=value(i);
                C=str2num(cell2mat(A));
                B=time(i);
                list=[list, B,C];
            file_name=sprintf('Binary_%s-%s', monk{t}, flip{f});
            fid=fopen(file_name, 'w');
            fprintf(fid, '%6.3f %6.1f\n', list);
            fclose(fid);
        end
    end
end

