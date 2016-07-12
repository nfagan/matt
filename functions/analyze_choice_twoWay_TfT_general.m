function [choice, individual_choice_list, error] = analyze_choice_twoWay_TfT_general(file_name_1, file_name_2, block_number)

choice=[];
individual_choice_list=[];
error=[];

for i=1:block_number
    
    choice_temp=[];
    individual_choice1=[];
    individual_choice2=[];
    error1=[];
    error2=[];
    data_list1=[];
    data_list2=[];
    y_1=0;
    y_2=0;
    
%     fid1=sprintf('/Users/matthewpiva/Desktop/Analysis/Reciprocity/Data/Two-Way TfT/%s %d.mat', file_name_1, i);
%     fid2=sprintf('/Users/matthewpiva/Desktop/Analysis/Reciprocity/Data/Two-Way TfT/%s %d.mat', file_name_2, i);

    fid1 = file_name_1; fid2 = file_name_2;
    
    if exist(fid1)==2
        
        data1=load(file_name_1);
        data2=load(file_name_2);
        
    end
    
    if length(data1.condition)==length(data1.choice) && length(data1.condition)==length(data1.start_time) && length(data1.condition)==length(data1.end_time)
        data_list1=horzcat(data1.condition, data1.choice, data1.start_time, data1.end_time);
    elseif length(data1.condition)~=length(data1.choice) || length(data1.condition)~=length(data1.start_time) || length(data1.condition)~=length(data1.end_time)
        data_list1=horzcat(data1.condition(2:end), data1.choice, data1.start_time, data1.end_time);
    end
    
    if length(data2.condition)==length(data2.choice) && length(data2.condition)==length(data2.start_time) && length(data2.condition)==length(data2.end_time)
        data_list2=horzcat(data2.condition, data2.choice, data2.start_time, data2.end_time);
    elseif length(data2.condition)~=length(data2.choice) || length(data2.condition)~=length(data2.start_time) || length(data2.condition)~=length(data2.end_time)
        data_list2=horzcat(data2.condition, data2.choice, data2.start_time(2:end), data2.end_time);
    end

    total_1_1=0;
    total_2_1=0;
    total_1_2=0;
    total_2_2=0;
    
    count_1_1=0;
    count_2_1=0;
    count_3_1=0;
    count_4_1=0;
    count_1_2=0;
    count_2_2=0;
    count_3_2=0;
    count_4_2=0;
    
    for j=1:length(data_list1)
        if data_list1(j,4)==0
            error1=[error1; data_list1(j,1), data_list1(j,3)];
        end
        if data_list1(j,1)==1
            if data_list1(j,4)>0 && data_list1(j,2)==1
                total_1_1=total_1_1+1;
                count_1_1=count_1_1+1;
                individual_choice1=[individual_choice1; i, 1, 1, data_list1(j,3), data_list1(j,4)];
            elseif data_list1(j,4)>0 && data_list1(j,2)==2
                total_1_1=total_1_1+1;
                count_2_1=count_2_1+1;
                individual_choice1=[individual_choice1; i, 1, 0, data_list1(j,3), data_list1(j,4)];
            end
        end
        if data_list1(j,1)==2
            if data_list1(j,4)>0 && data_list1(j,2)==1
                total_1_1=total_1_1+1;
                count_2_1=count_2_1+1;
                individual_choice1=[individual_choice1; i, 1, 0, data_list1(j,3), data_list1(j,4)];
            elseif data_list1(j,4)>0 && data_list1(j,2)==2
                total_1_1=total_1_1+1;
                count_1_1=count_1_1+1;
                individual_choice1=[individual_choice1; i, 1, 1, data_list1(j,3), data_list1(j,4)];
            end
        end
        if data_list1(j,1)==3
            if data_list1(j,4)>0 && data_list1(j,2)==1
                total_2_1=total_2_1+1;
                count_3_1=count_3_1+1;
                individual_choice1=[individual_choice1; i, 1, 1, data_list1(j,3), data_list1(j,4)];
            elseif data_list1(j,4)>0 && data_list1(j,2)==2
                total_2_1=total_2_1+1;
                count_4_1=count_4_1+1;
                individual_choice1=[individual_choice1; i, 1, 0, data_list1(j,3), data_list1(j,4)];
            end
        end
        if data_list1(j,1)==4
            if data_list1(j,4)>0 && data_list1(j,2)==1
                total_2_1=total_2_1+1;
                count_4_1=count_4_1+1;
                individual_choice1=[individual_choice1; i, 1, 0, data_list1(j,3), data_list1(j,4)];
            elseif data_list1(j,4)>0 && data_list1(j,2)==2
                total_2_1=total_2_1+1;
                count_3_1=count_3_1+1;
                individual_choice1=[individual_choice1; i, 1, 1, data_list1(j,3), data_list1(j,4)];
            end
        end
        if data_list1(j,1)==9
            if data_list1(j,4)>0 && data_list1(j,2)==5
                total_1_1=total_1_1+1;
                count_1_1=count_1_1+1;
                individual_choice1=[individual_choice1; i, 1, 1, data_list1(j,3), data_list1(j,4)];
            elseif data_list1(j,4)>0 && data_list1(j,2)==6
                total_2_1=total_2_1+1;
                count_2_1=count_2_1+1;
                individual_choice1=[individual_choice1; i, 1, 0, data_list1(j,3), data_list1(j,4)];
            end
        end
        if data_list1(j,1)==10
            if data_list1(j,4)>0 && data_list1(j,2)==6
                total_1_1=total_1_1+1;
                count_1_1=count_1_1+1;
                individual_choice1=[individual_choice1; i, 1, 1, data_list1(j,3), data_list1(j,4)];
            elseif data_list1(j,4)>0 && data_list1(j,2)==5
                total_1_1=total_1_1+1;
                count_2_1=count_2_1+1;
                individual_choice1=[individual_choice1; i, 1, 0, data_list1(j,3), data_list1(j,4)];
            end
        end
        if data_list1(j,1)==11
            if data_list1(j,4)>0 && data_list1(j,2)==7
                total_1_1=total_1_1+1;
                count_1_1=count_1_1+1;
                individual_choice1=[individual_choice1; i, 1, 1, data_list1(j,3), data_list1(j,4)];
            elseif data_list1(j,4)>0 && data_list1(j,2)==8
                total_1_1=total_1_1+1;
                count_2_1=count_2_1+1;
                individual_choice1=[individual_choice1; i, 1, 0, data_list1(j,3), data_list1(j,4)];
            end
        end
        if data_list1(j,1)==12
            if data_list1(j,4)>0 && data_list1(j,2)==8
                total_1_1=total_1_1+1;
                count_1_1=count_1_1+1;
                individual_choice1=[individual_choice1; i, 1, 1, data_list1(j,3), data_list1(j,4)];
            elseif data_list1(j,4)>0 && data_list1(j,2)==7
                total_1_1=total_1_1+1;
                count_2_1=count_2_1+1;
                individual_choice1=[individual_choice1; i, 1, 0, data_list1(j,3), data_list1(j,4)];
            end
        end
        if data_list1(j,1)==13
            if data_list1(j,4)>0 && data_list1(j,2)==9
                total_1_1=total_1_1+1;
                count_1_1=count_1_1+1;
                individual_choice1=[individual_choice1; i, 1, 1, data_list1(j,3), data_list1(j,4)];
            elseif data_list1(j,4)>0 && data_list1(j,2)==10
                total_1_1=total_1_1+1;
                count_2_1=count_2_1+1;
                individual_choice1=[individual_choice1; i, 1, 0, data_list1(j,3), data_list1(j,4)];
            end
        end
        if data_list1(j,1)==14
            if data_list1(j,4)>0 && data_list1(j,2)==10
                total_1_1=total_1_1+1;
                count_1_1=count_1_1+1;
                individual_choice1=[individual_choice1; i, 1, 1, data_list1(j,3), data_list1(j,4)];
            elseif data_list1(j,4)>0 && data_list1(j,2)==9
                total_1_1=total_1_1+1;
                count_2_1=count_2_1+1;
                individual_choice1=[individual_choice1; i, 1, 0, data_list1(j,3), data_list1(j,4)];
            end
        end
        if data_list1(j,1)==15
            if data_list1(j,4)>0 && data_list1(j,2)==5
                total_1_1=total_1_1+1;
                count_1_1=count_1_1+1;
                individual_choice1=[individual_choice1; i, 1, 1, data_list1(j,3), data_list1(j,4)];
            elseif data_list1(j,4)>0 && data_list1(j,2)==7
                total_1_1=total_1_1+1;
                count_2_1=count_2_1+1;
                individual_choice1=[individual_choice1; i, 1, 0, data_list1(j,3), data_list1(j,4)];
            end
        end
        if data_list1(j,1)==16
            if data_list1(j,4)>0 && data_list1(j,2)==7
                total_1_1=total_1_1+1;
                count_1_1=count_1_1+1;
                individual_choice1=[individual_choice1; i, 1, 1, data_list1(j,3), data_list1(j,4)];
            elseif data_list1(j,4)>0 && data_list1(j,2)==5
                total_1_1=total_1_1+1;
                count_2_1=count_2_1+1;
                individual_choice1=[individual_choice1; i, 1, 0, data_list1(j,3), data_list1(j,4)];
            end
        end
        if data_list1(j,1)==17
            if data_list1(j,4)>0 && data_list1(j,2)==6
                total_1_1=total_1_1+1;
                count_1_1=count_1_1+1;
                individual_choice1=[individual_choice1; i, 1, 1, data_list1(j,3), data_list1(j,4)];
            elseif data_list1(j,4)>0 && data_list1(j,2)==8
                total_1_1=total_1_1+1;
                count_2_1=count_2_1+1;
                individual_choice1=[individual_choice1; i, 1, 0, data_list1(j,3), data_list1(j,4)];
            end
        end
        if data_list1(j,1)==18
            if data_list1(j,4)>0 && data_list1(j,2)==8
                total_1_1=total_1_1+1;
                count_1_1=count_1_1+1;
                individual_choice1=[individual_choice1; i, 1, 1, data_list1(j,3), data_list1(j,4)];
            elseif data_list1(j,4)>0 && data_list1(j,2)==6
                total_1_1=total_1_1+1;
                count_2_1=count_2_1+1;
                individual_choice1=[individual_choice1; i, 1, 0, data_list1(j,3), data_list1(j,4)];
            end
        end
        if data_list1(j,1)==19
            if data_list1(j,4)>0 && data_list1(j,2)==5
                total_1_1=total_1_1+1;
                count_1_1=count_1_1+1;
                individual_choice1=[individual_choice1; i, 1, 1, data_list1(j,3), data_list1(j,4)];
            elseif data_list1(j,4)>0 && data_list1(j,2)==8
                total_1_1=total_1_1+1;
                count_2_1=count_2_1+1;
                individual_choice1=[individual_choice1; i, 1, 0, data_list1(j,3), data_list1(j,4)];
            end
        end
        if data_list1(j,1)==20
            if data_list1(j,4)>0 && data_list1(j,2)==8
                total_1_1=total_1_1+1;
                count_1_1=count_1_1+1;
                individual_choice1=[individual_choice1; i, 1, 1, data_list1(j,3), data_list1(j,4)];
            elseif data_list1(j,4)>0 && data_list1(j,2)==5
                total_1_1=total_1_1+1;
                count_2_1=count_2_1+1;
                individual_choice1=[individual_choice1; i, 1, 0, data_list1(j,3), data_list1(j,4)];
            end
        end
        if data_list1(j,1)==21
            if data_list1(j,4)>0 && data_list1(j,2)==7
                total_1_1=total_1_1+1;
                count_1_1=count_1_1+1;
                individual_choice1=[individual_choice1; i, 1, 1, data_list1(j,3), data_list1(j,4)];
            elseif data_list1(j,4)>0 && data_list1(j,2)==6
                total_1_1=total_1_1+1;
                count_2_1=count_2_1+1;
                individual_choice1=[individual_choice1; i, 1, 0, data_list1(j,3), data_list1(j,4)];
            end
        end
        if data_list1(j,1)==22
            if data_list1(j,4)>0 && data_list1(j,2)==6
                total_1_1=total_1_1+1;
                count_1_1=count_1_1+1;
                individual_choice1=[individual_choice1; i, 1, 1, data_list1(j,3), data_list1(j,4)];
            elseif data_list1(j,4)>0 && data_list1(j,2)==7
                total_1_1=total_1_1+1;
                count_2_1=count_2_1+1;
                individual_choice1=[individual_choice1; i, 1, 0, data_list1(j,3), data_list1(j,4)];
            end
        end
        if data_list1(j,1)==23
            if data_list1(j,4)>0 && data_list1(j,2)==5
                total_2_1=total_2_1+1;
                count_3_1=count_3_1+1;
                individual_choice1=[individual_choice1; i, 1, 1, data_list1(j,3), data_list1(j,4)];
            elseif data_list1(j,4)>0 && data_list1(j,2)==6
                total_2_1=total_2_1+1;
                count_4_1=count_4_1+1;
                individual_choice1=[individual_choice1; i, 1, 0, data_list1(j,3), data_list1(j,4)];
            end
        end
        if data_list1(j,1)==24
            if data_list1(j,4)>0 && data_list1(j,2)==6
                total_2_1=total_2_1+1;
                count_3_1=count_3_1+1;
                individual_choice1=[individual_choice1; i, 1, 1, data_list1(j,3), data_list1(j,4)];
            elseif data_list1(j,4)>0 && data_list1(j,2)==5
                total_2_1=total_2_1+1;
                count_4_1=count_4_1+1;
                individual_choice1=[individual_choice1; i, 1, 0, data_list1(j,3), data_list1(j,4)];
            end
        end
        if data_list1(j,1)==25
            if data_list1(j,4)>0 && data_list1(j,2)==7
                total_2_1=total_2_1+1;
                count_3_1=count_3_1+1;
                individual_choice1=[individual_choice1; i, 1, 1, data_list1(j,3), data_list1(j,4)];
            elseif data_list1(j,4)>0 && data_list1(j,2)==8
                total_2_1=total_2_1+1;
                count_4_1=count_4_1+1;
                individual_choice1=[individual_choice1; i, 1, 0, data_list1(j,3), data_list1(j,4)];
            end
        end
        if data_list1(j,1)==26
            if data_list1(j,4)>0 && data_list1(j,2)==8
                total_2_1=total_2_1+1;
                count_3_1=count_3_1+1;
                individual_choice1=[individual_choice1; i, 1, 1, data_list1(j,3), data_list1(j,4)];
            elseif data_list1(j,4)>0 && data_list1(j,2)==7
                total_2_1=total_2_1+1;
                count_4_1=count_4_1+1;
                individual_choice1=[individual_choice1; i, 1, 0, data_list1(j,3), data_list1(j,4)];
            end
        end
        if data_list1(j,1)==27
            if data_list1(j,4)>0 && data_list1(j,2)==9
                total_2_1=total_2_1+1;
                count_3_1=count_3_1+1;
                individual_choice1=[individual_choice1; i, 1, 1, data_list1(j,3), data_list1(j,4)];
            elseif data_list1(j,4)>0 && data_list1(j,2)==10
                total_2_1=total_2_1+1;
                count_4_1=count_4_1+1;
                individual_choice1=[individual_choice1; i, 1, 0, data_list1(j,3), data_list1(j,4)];
            end
        end
        if data_list1(j,1)==28
            if data_list1(j,4)>0 && data_list1(j,2)==10
                total_2_1=total_2_1+1;
                count_3_1=count_3_1+1;
                individual_choice1=[individual_choice1; i, 1, 1, data_list1(j,3), data_list1(j,4)];
            elseif data_list1(j,4)>0 && data_list1(j,2)==9
                total_2_1=total_2_1+1;
                count_4_1=count_4_1+1;
                individual_choice1=[individual_choice1; i, 1, 0, data_list1(j,3), data_list1(j,4)];
            end
        end
        if data_list1(j,1)==29
            if data_list1(j,4)>0 && data_list1(j,2)==5
                total_2_1=total_2_1+1;
                count_3_1=count_3_1+1;
                individual_choice1=[individual_choice1; i, 1, 1, data_list1(j,3), data_list1(j,4)];
            elseif data_list1(j,4)>0 && data_list1(j,2)==7
                total_2_1=total_2_1+1;
                count_4_1=count_4_1+1;
                individual_choice1=[individual_choice1; i, 1, 0, data_list1(j,3), data_list1(j,4)];
            end
        end
        if data_list1(j,1)==30
            if data_list1(j,4)>0 && data_list1(j,2)==7
                total_2_1=total_2_1+1;
                count_3_1=count_3_1+1;
                individual_choice1=[individual_choice1; i, 1, 1, data_list1(j,3), data_list1(j,4)];
            elseif data_list1(j,4)>0 && data_list1(j,2)==5
                total_2_1=total_2_1+1;
                count_4_1=count_4_1+1;
                individual_choice1=[individual_choice1; i, 1, 0, data_list1(j,3), data_list1(j,4)];
            end
        end
        if data_list1(j,1)==31
            if data_list1(j,4)>0 && data_list1(j,2)==6
                total_2_1=total_2_1+1;
                count_3_1=count_3_1+1;
                individual_choice1=[individual_choice1; i, 1, 1, data_list1(j,3), data_list1(j,4)];
            elseif data_list1(j,4)>0 && data_list1(j,2)==8
                total_2_1=total_2_1+1;
                count_4_1=count_4_1+1;
                individual_choice1=[individual_choice1; i, 1, 0, data_list1(j,3), data_list1(j,4)];
            end
        end
        if data_list1(j,1)==32
            if data_list1(j,4)>0 && data_list1(j,2)==8
                total_2_1=total_2_1+1;
                count_3_1=count_3_1+1;
                individual_choice1=[individual_choice1; i, 1, 1, data_list1(j,3), data_list1(j,4)];
            elseif data_list1(j,4)>0 && data_list1(j,2)==6
                total_2_1=total_2_1+1;
                count_4_1=count_4_1+1;
                individual_choice1=[individual_choice1; i, 1, 0, data_list1(j,3), data_list1(j,4)];
            end
        end
        if data_list1(j,1)==33
            if data_list1(j,4)>0 && data_list1(j,2)==5
                total_2_1=total_2_1+1;
                count_3_1=count_3_1+1;
                individual_choice1=[individual_choice1; i, 1, 1, data_list1(j,3), data_list1(j,4)];
            elseif data_list1(j,4)>0 && data_list1(j,2)==8
                total_2_1=total_2_1+1;
                count_4_1=count_4_1+1;
                individual_choice1=[individual_choice1; i, 1, 0, data_list1(j,3), data_list1(j,4)];
            end
        end
        if data_list1(j,1)==34
            if data_list1(j,4)>0 && data_list1(j,2)==8
                total_2_1=total_2_1+1;
                count_3_1=count_3_1+1;
                individual_choice1=[individual_choice1; i, 1, 1, data_list1(j,3), data_list1(j,4)];
            elseif data_list1(j,4)>0 && data_list1(j,2)==5
                total_2_1=total_2_1+1;
                count_4_1=count_4_1+1;
                individual_choice1=[individual_choice1; i, 1, 0, data_list1(j,3), data_list1(j,4)];
            end
        end
        if data_list1(j,1)==35
            if data_list1(j,4)>0 && data_list1(j,2)==7
                total_2_1=total_2_1+1;
                count_3_1=count_3_1+1;
                individual_choice1=[individual_choice1; i, 1, 1, data_list1(j,3), data_list1(j,4)];
            elseif data_list1(j,4)>0 && data_list1(j,2)==6
                total_2_1=total_2_1+1;
                count_4_1=count_4_1+1;
                individual_choice1=[individual_choice1; i, 1, 0, data_list1(j,3), data_list1(j,4)];
            end
        end
        if data_list1(j,1)==36
            if data_list1(j,4)>0 && data_list1(j,2)==6
                total_2_1=total_2_1+1;
                count_3_1=count_3_1+1;
                individual_choice1=[individual_choice1; i, 1, 1, data_list1(j,3), data_list1(j,4)];
            elseif data_list1(j,4)>0 && data_list1(j,2)==7
                total_2_1=total_2_1+1;
                count_4_1=count_4_1+1;
                individual_choice1=[individual_choice1; i, 1, 0, data_list1(j,3), data_list1(j,4)];
            end
        end
    end
    
    for j=1:length(data_list2)
        if data_list2(j,4)==0
            error2=[error2; data_list2(j,1), data_list2(j,3)];
        end
        if data_list2(j,1)==1
            if data_list2(j,4)>0 && data_list2(j,2)==1
                total_1_2=total_1_2+1;
                count_1_2=count_1_2+1;
                individual_choice2=[individual_choice2; i, 2, 1, data_list2(j,3), data_list2(j,4)];
            elseif data_list2(j,4)>0 && data_list2(j,2)==2
                total_1_2=total_1_2+1;
                count_2_2=count_2_2+1;
                individual_choice2=[individual_choice2; i, 2, 0, data_list2(j,3), data_list2(j,4)];
            end
        end
        if data_list2(j,1)==2
            if data_list2(j,4)>0 && data_list2(j,2)==1
                total_1_2=total_1_2+1;
                count_2_2=count_2_2+1;
                individual_choice2=[individual_choice2; i, 2, 0, data_list2(j,3), data_list2(j,4)];
            elseif data_list2(j,4)>0 && data_list2(j,2)==2
                total_1_2=total_1_2+1;
                count_1_2=count_1_2+1;
                individual_choice2=[individual_choice2; i, 2, 1, data_list2(j,3), data_list2(j,4)];
            end
        end
        if data_list2(j,1)==3
            if data_list2(j,4)>0 && data_list2(j,2)==1
                total_2_2=total_2_2+1;
                count_3_2=count_3_2+1;
                individual_choice2=[individual_choice2; i, 2, 1, data_list2(j,3), data_list2(j,4)];
            elseif data_list2(j,4)>0 && data_list2(j,2)==2
                total_2_2=total_2_2+1;
                count_4_2=count_4_2+1;
                individual_choice2=[individual_choice2; i, 2, 0, data_list2(j,3), data_list2(j,4)];
            end
        end
        if data_list2(j,1)==4
            if data_list2(j,4)>0 && data_list2(j,2)==1
                total_2_2=total_2_2+1;
                count_4_2=count_4_2+1;
                individual_choice2=[individual_choice2; i, 2, 0, data_list2(j,3), data_list2(j,4)];
            elseif data_list2(j,4)>0 && data_list2(j,2)==2
                total_2_2=total_2_2+1;
                count_3_2=count_3_2+1;
                individual_choice2=[individual_choice2; i, 2, 1, data_list2(j,3), data_list2(j,4)];
            end
        end
        if data_list2(j,1)==9
            if data_list2(j,4)>0 && data_list2(j,2)==5
                total_1_2=total_1_2+1;
                count_1_2=count_1_2+1;
                individual_choice2=[individual_choice2; i, 2, 1, data_list2(j,3), data_list2(j,4)];
            elseif data_list2(j,4)>0 && data_list2(j,2)==6
                total_2_2=total_2_2+1;
                count_2_2=count_2_2+1;
                individual_choice2=[individual_choice2; i, 2, 0, data_list2(j,3), data_list2(j,4)];
            end
        end
        if data_list2(j,1)==10
            if data_list2(j,4)>0 && data_list2(j,2)==6
                total_1_2=total_1_2+1;
                count_1_2=count_1_2+1;
                individual_choice2=[individual_choice2; i, 2, 1, data_list2(j,3), data_list2(j,4)];
            elseif data_list2(j,4)>0 && data_list2(j,2)==5
                total_1_2=total_1_2+1;
                count_2_2=count_2_2+1;
                individual_choice2=[individual_choice2; i, 2, 0, data_list2(j,3), data_list2(j,4)];
            end
        end
        if data_list2(j,1)==11
            if data_list2(j,4)>0 && data_list2(j,2)==7
                total_1_2=total_1_2+1;
                count_1_2=count_1_2+1;
                individual_choice2=[individual_choice2; i, 2, 1, data_list2(j,3), data_list2(j,4)];
            elseif data_list2(j,4)>0 && data_list2(j,2)==8
                total_1_2=total_1_2+1;
                count_2_2=count_2_2+1;
                individual_choice2=[individual_choice2; i, 2, 0, data_list2(j,3), data_list2(j,4)];
            end
        end
        if data_list2(j,1)==12
            if data_list2(j,4)>0 && data_list2(j,2)==8
                total_1_2=total_1_2+1;
                count_1_2=count_1_2+1;
                individual_choice2=[individual_choice2; i, 2, 1, data_list2(j,3), data_list2(j,4)];
            elseif data_list2(j,4)>0 && data_list2(j,2)==7
                total_1_2=total_1_2+1;
                count_2_2=count_2_2+1;
                individual_choice2=[individual_choice2; i, 2, 0, data_list2(j,3), data_list2(j,4)];
            end
        end
        if data_list2(j,1)==13
            if data_list2(j,4)>0 && data_list2(j,2)==9
                total_1_2=total_1_2+1;
                count_1_2=count_1_2+1;
                individual_choice2=[individual_choice2; i, 2, 1, data_list2(j,3), data_list2(j,4)];
            elseif data_list2(j,4)>0 && data_list2(j,2)==10
                total_1_2=total_1_2+1;
                count_2_2=count_2_2+1;
                individual_choice2=[individual_choice2; i, 2, 0, data_list2(j,3), data_list2(j,4)];
            end
        end
        if data_list2(j,1)==14
            if data_list2(j,4)>0 && data_list2(j,2)==10
                total_1_2=total_1_2+1;
                count_1_2=count_1_2+1;
                individual_choice2=[individual_choice2; i, 2, 1, data_list2(j,3), data_list2(j,4)];
            elseif data_list2(j,4)>0 && data_list2(j,2)==9
                total_1_2=total_1_2+1;
                count_2_2=count_2_2+1;
                individual_choice2=[individual_choice2; i, 2, 0, data_list2(j,3), data_list2(j,4)];
            end
        end
        if data_list2(j,1)==15
            if data_list2(j,4)>0 && data_list2(j,2)==5
                total_1_2=total_1_2+1;
                count_1_2=count_1_2+1;
                individual_choice2=[individual_choice2; i, 2, 1, data_list2(j,3), data_list2(j,4)];
            elseif data_list2(j,4)>0 && data_list2(j,2)==7
                total_1_2=total_1_2+1;
                count_2_2=count_2_2+1;
                individual_choice2=[individual_choice2; i, 2, 0, data_list2(j,3), data_list2(j,4)];
            end
        end
        if data_list2(j,1)==16
            if data_list2(j,4)>0 && data_list2(j,2)==7
                total_1_2=total_1_2+1;
                count_1_2=count_1_2+1;
                individual_choice2=[individual_choice2; i, 2, 1, data_list2(j,3), data_list2(j,4)];
            elseif data_list2(j,4)>0 && data_list2(j,2)==5
                total_1_2=total_1_2+1;
                count_2_2=count_2_2+1;
                individual_choice2=[individual_choice2; i, 2, 0, data_list2(j,3), data_list2(j,4)];
            end
        end
        if data_list2(j,1)==17
            if data_list2(j,4)>0 && data_list2(j,2)==6
                total_1_2=total_1_2+1;
                count_1_2=count_1_2+1;
                individual_choice2=[individual_choice2; i, 2, 1, data_list2(j,3), data_list2(j,4)];
            elseif data_list2(j,4)>0 && data_list2(j,2)==8
                total_1_2=total_1_2+1;
                count_2_2=count_2_2+1;
                individual_choice2=[individual_choice2; i, 2, 0, data_list2(j,3), data_list2(j,4)];
            end
        end
        if data_list2(j,1)==18
            if data_list2(j,4)>0 && data_list2(j,2)==8
                total_1_2=total_1_2+1;
                count_1_2=count_1_2+1;
                individual_choice2=[individual_choice2; i, 2, 1, data_list2(j,3), data_list2(j,4)];
            elseif data_list2(j,4)>0 && data_list2(j,2)==6
                total_1_2=total_1_2+1;
                count_2_2=count_2_2+1;
                individual_choice2=[individual_choice2; i, 2, 0, data_list2(j,3), data_list2(j,4)];
            end
        end
        if data_list2(j,1)==19
            if data_list2(j,4)>0 && data_list2(j,2)==5
                total_1_2=total_1_2+1;
                count_1_2=count_1_2+1;
                individual_choice2=[individual_choice2; i, 2, 1, data_list2(j,3), data_list2(j,4)];
            elseif data_list2(j,4)>0 && data_list2(j,2)==8
                total_1_2=total_1_2+1;
                count_2_2=count_2_2+1;
                individual_choice2=[individual_choice2; i, 2, 0, data_list2(j,3), data_list2(j,4)];
            end
        end
        if data_list2(j,1)==20
            if data_list2(j,4)>0 && data_list2(j,2)==8
                total_1_2=total_1_2+1;
                count_1_2=count_1_2+1;
                individual_choice2=[individual_choice2; i, 2, 1, data_list2(j,3), data_list2(j,4)];
            elseif data_list2(j,4)>0 && data_list2(j,2)==5
                total_1_2=total_1_2+1;
                count_2_2=count_2_2+1;
                individual_choice2=[individual_choice2; i, 2, 0, data_list2(j,3), data_list2(j,4)];
            end
        end
        if data_list2(j,1)==21
            if data_list2(j,4)>0 && data_list2(j,2)==7
                total_1_2=total_1_2+1;
                count_1_2=count_1_2+1;
                individual_choice2=[individual_choice2; i, 2, 1, data_list2(j,3), data_list2(j,4)];
            elseif data_list2(j,4)>0 && data_list2(j,2)==6
                total_1_2=total_1_2+1;
                count_2_2=count_2_2+1;
                individual_choice2=[individual_choice2; i, 2, 0, data_list2(j,3), data_list2(j,4)];
            end
        end
        if data_list2(j,1)==22
            if data_list2(j,4)>0 && data_list2(j,2)==6
                total_1_2=total_1_2+1;
                count_1_2=count_1_2+1;
                individual_choice2=[individual_choice2; i, 2, 1, data_list2(j,3), data_list2(j,4)];
            elseif data_list2(j,4)>0 && data_list2(j,2)==7
                total_1_2=total_1_2+1;
                count_2_2=count_2_2+1;
                individual_choice2=[individual_choice2; i, 2, 0, data_list2(j,3), data_list2(j,4)];
            end
        end
        if data_list2(j,1)==23
            if data_list2(j,4)>0 && data_list2(j,2)==5
                total_2_2=total_2_2+1;
                count_3_2=count_3_2+1;
                individual_choice2=[individual_choice2; i, 2, 1, data_list2(j,3), data_list2(j,4)];
            elseif data_list2(j,4)>0 && data_list2(j,2)==6
                total_2_2=total_2_2+1;
                count_4_2=count_4_2+1;
                individual_choice2=[individual_choice2; i, 2, 0, data_list2(j,3), data_list2(j,4)];
            end
        end
        if data_list2(j,1)==24
            if data_list2(j,4)>0 && data_list2(j,2)==6
                total_2_2=total_2_2+1;
                count_3_2=count_3_2+1;
                individual_choice2=[individual_choice2; i, 2, 1, data_list2(j,3), data_list2(j,4)];
            elseif data_list2(j,4)>0 && data_list2(j,2)==5
                total_2_2=total_2_2+1;
                count_4_2=count_4_2+1;
                individual_choice2=[individual_choice2; i, 2, 0, data_list2(j,3), data_list2(j,4)];
            end
        end
        if data_list2(j,1)==25
            if data_list2(j,4)>0 && data_list2(j,2)==7
                total_2_2=total_2_2+1;
                count_3_2=count_3_2+1;
                individual_choice2=[individual_choice2; i, 2, 1, data_list2(j,3), data_list2(j,4)];
            elseif data_list2(j,4)>0 && data_list2(j,2)==8
                total_2_2=total_2_2+1;
                count_4_2=count_4_2+1;
                individual_choice2=[individual_choice2; i, 2, 0, data_list2(j,3), data_list2(j,4)];
            end
        end
        if data_list2(j,1)==26
            if data_list2(j,4)>0 && data_list2(j,2)==8
                total_2_2=total_2_2+1;
                count_3_2=count_3_2+1;
                individual_choice2=[individual_choice2; i, 2, 1, data_list2(j,3), data_list2(j,4)];
            elseif data_list2(j,4)>0 && data_list2(j,2)==7
                total_2_2=total_2_2+1;
                count_4_2=count_4_2+1;
                individual_choice2=[individual_choice2; i, 2, 0, data_list2(j,3), data_list2(j,4)];
            end
        end
        if data_list2(j,1)==27
            if data_list2(j,4)>0 && data_list2(j,2)==9
                total_2_2=total_2_2+1;
                count_3_2=count_3_2+1;
                individual_choice2=[individual_choice2; i, 2, 1, data_list2(j,3), data_list2(j,4)];
            elseif data_list2(j,4)>0 && data_list2(j,2)==10
                total_2_2=total_2_2+1;
                count_4_2=count_4_2+1;
                individual_choice2=[individual_choice2; i, 2, 0, data_list2(j,3), data_list2(j,4)];
            end
        end
        if data_list2(j,1)==28
            if data_list2(j,4)>0 && data_list2(j,2)==10
                total_2_2=total_2_2+1;
                count_3_2=count_3_2+1;
                individual_choice2=[individual_choice2; i, 2, 1, data_list2(j,3), data_list2(j,4)];
            elseif data_list2(j,4)>0 && data_list2(j,2)==9
                total_2_2=total_2_2+1;
                count_4_2=count_4_2+1;
                individual_choice2=[individual_choice2; i, 2, 0, data_list2(j,3), data_list2(j,4)];
            end
        end
        if data_list2(j,1)==29
            if data_list2(j,4)>0 && data_list2(j,2)==5
                total_2_2=total_2_2+1;
                count_3_2=count_3_2+1;
                individual_choice2=[individual_choice2; i, 2, 1, data_list2(j,3), data_list2(j,4)];
            elseif data_list2(j,4)>0 && data_list2(j,2)==7
                total_2_2=total_2_2+1;
                count_4_2=count_4_2+1;
                individual_choice2=[individual_choice2; i, 2, 0, data_list2(j,3), data_list2(j,4)];
            end
        end
        if data_list2(j,1)==30
            if data_list2(j,4)>0 && data_list2(j,2)==7
                total_2_2=total_2_2+1;
                count_3_2=count_3_2+1;
                individual_choice2=[individual_choice2; i, 2, 1, data_list2(j,3), data_list2(j,4)];
            elseif data_list2(j,4)>0 && data_list2(j,2)==5
                total_2_2=total_2_2+1;
                count_4_2=count_4_2+1;
                individual_choice2=[individual_choice2; i, 2, 0, data_list2(j,3), data_list2(j,4)];
            end
        end
        if data_list2(j,1)==31
            if data_list2(j,4)>0 && data_list2(j,2)==6
                total_2_2=total_2_2+1;
                count_3_2=count_3_2+1;
                individual_choice2=[individual_choice2; i, 2, 1, data_list2(j,3), data_list2(j,4)];
            elseif data_list2(j,4)>0 && data_list2(j,2)==8
                total_2_2=total_2_2+1;
                count_4_2=count_4_2+1;
                individual_choice2=[individual_choice2; i, 2, 0, data_list2(j,3), data_list2(j,4)];
            end
        end
        if data_list2(j,1)==32
            if data_list2(j,4)>0 && data_list2(j,2)==8
                total_2_2=total_2_2+1;
                count_3_2=count_3_2+1;
                individual_choice2=[individual_choice2; i, 2, 1, data_list2(j,3), data_list2(j,4)];
            elseif data_list2(j,4)>0 && data_list2(j,2)==6
                total_2_2=total_2_2+1;
                count_4_2=count_4_2+1;
                individual_choice2=[individual_choice2; i, 2, 0, data_list2(j,3), data_list2(j,4)];
            end
        end
        if data_list2(j,1)==33
            if data_list2(j,4)>0 && data_list2(j,2)==5
                total_2_2=total_2_2+1;
                count_3_2=count_3_2+1;
                individual_choice2=[individual_choice2; i, 2, 1, data_list2(j,3), data_list2(j,4)];
            elseif data_list2(j,4)>0 && data_list2(j,2)==8
                total_2_2=total_2_2+1;
                count_4_2=count_4_2+1;
                individual_choice2=[individual_choice2; i, 2, 0, data_list2(j,3), data_list2(j,4)];
            end
        end
        if data_list2(j,1)==34
            if data_list2(j,4)>0 && data_list2(j,2)==8
                total_2_2=total_2_2+1;
                count_3_2=count_3_2+1;
                individual_choice2=[individual_choice2; i, 2, 1, data_list2(j,3), data_list2(j,4)];
            elseif data_list2(j,4)>0 && data_list2(j,2)==5
                total_2_2=total_2_2+1;
                count_4_2=count_4_2+1;
                individual_choice2=[individual_choice2; i, 2, 0, data_list2(j,3), data_list2(j,4)];
            end
        end
        if data_list2(j,1)==35
            if data_list2(j,4)>0 && data_list2(j,2)==7
                total_2_2=total_2_2+1;
                count_3_2=count_3_2+1;
                individual_choice2=[individual_choice2; i, 2, 1, data_list2(j,3), data_list2(j,4)];
            elseif data_list2(j,4)>0 && data_list2(j,2)==6
                total_2_2=total_2_2+1;
                count_4_2=count_4_2+1;
                individual_choice2=[individual_choice2; i, 2, 0, data_list2(j,3), data_list2(j,4)];
            end
        end
        if data_list2(j,1)==36
            if data_list2(j,4)>0 && data_list2(j,2)==6
                total_2_2=total_2_2+1;
                count_3_2=count_3_2+1;
                individual_choice2=[individual_choice2; i, 2, 1, data_list2(j,3), data_list2(j,4)];
            elseif data_list2(j,4)>0 && data_list2(j,2)==7
                total_2_2=total_2_2+1;
                count_4_2=count_4_2+1;
                individual_choice2=[individual_choice2; i, 2, 0, data_list2(j,3), data_list2(j,4)];
            end
        end
    end
       
    for_bar=[];
    
    y_1=[(count_1_1-count_2_1)/total_1_1, (count_3_1-count_4_1)/total_2_1];
    y_2=[(count_1_2-count_2_2)/total_1_2, (count_3_2-count_4_2)/total_2_2];
    
    for_bar=[y_1; y_2];
    
%     figure(i)
%     bar(for_bar);
    
    choice_temp=horzcat(y_1(1), y_1(2), y_2(1), y_2(2));
    
    choice=vertcat(choice, choice_temp);
    
    individual_choice_list{1,i}=individual_choice1;
    individual_choice_list{2,i}=individual_choice2;
    
    error{1,i}=error1;
    error{2,i}=error2;
    
end

