function [choice, individual_choice] = analyze_choice_twoWay_sp_3block(file_name_1, file_name_2, block_number)

choice=[];
individual_choice=[];

for i=1:block_number
    
    choice_list=[];
    choice_temp=[];
    data_list1=[];
    data_list2=[];
    
    fid1=sprintf('/Volumes/My Passport/NICK/Chang Lab 2016/matt/reciprocitycodeanddata/%s %d.mat', file_name_1, i);
%     fid1=sprintf('/Users/matthewpiva/Desktop/Analysis/Reciprocity/Data/Two Way Choice_sp/%s %d.mat', file_name_1, i);
    fid2=sprintf('/Volumes/My Passport/NICK/Chang Lab 2016/matt/reciprocitycodeanddata/%s %d.mat', file_name_2, i);
%     fid2=sprintf('/Users/matthewpiva/Desktop/Analysis/Reciprocity/Data/Two Way Choice_sp/%s %d.mat', file_name_2, i);
    
    if exist(fid1)==2
        
        data1=load(fid1);
        data2=load(fid2);
        
    end
    
    data_list1=horzcat(data1.condition, data1.choice, data1.start_time, data1.end_time, data1.block_number);
    data_list2=horzcat(data2.condition, data2.choice, data2.start_time, data2.end_time, data2.block_number);
    
    total_1=[0 0 0 0 0 0];
    total_2=[0 0 0 0 0 0];
    
    count_1=[0 0 0 0 0 0];
    count_2=[0 0 0 0 0 0];
    count_3=[0 0 0 0 0 0];
    count_4=[0 0 0 0 0 0];
    
    for j=1:length(data_list1)
        
        for k=0:2
            l=k+1;
            if data_list1(j,5)==k
                if data_list1(j,1)==1
                    if data_list1(j,4)>0 && data_list1(j,2)==1
                        total_1(l)=total_1(l)+1;
                        count_1(l)=count_1(l)+1;
                        individual_choice=[individual_choice; i, k, 1, 1];
                    elseif data_list1(j,4)>0 && data_list1(j,2)==2
                        total_1(l)=total_1(l)+1;
                        count_2(l)=count_2(l)+1;
                        individual_choice=[individual_choice; i, k, 1, 0];
                    end
                end
                if data_list1(j,1)==2
                    if data_list1(j,4)>0 && data_list1(j,2)==1
                        total_1(l)=total_1(l)+1;
                        count_2(l)=count_2(l)+1;
                        individual_choice=[individual_choice; i, k, 1, 0];
                    elseif data_list1(j,4)>0 && data_list1(j,2)==2
                        total_1(l)=total_1(l)+1;
                        count_1(l)=count_1(l)+1;
                        individual_choice=[individual_choice; i, k, 1, 1];
                    end
                end
                if data_list1(j,1)==3
                    if data_list1(j,4)>0 && data_list1(j,2)==1
                        total_2(l)=total_2(l)+1;
                        count_3(l)=count_3(l)+1;
                        individual_choice=[individual_choice; i, k, 1, 1];
                    elseif data_list1(j,4)>0 && data_list1(j,2)==2
                        total_2(l)=total_2(l)+1;
                        count_4(l)=count_4(l)+1;
                        individual_choice=[individual_choice; i, k, 1, 0];
                    end
                end
                if data_list1(j,1)==4
                    if data_list1(j,4)>0 && data_list1(j,2)==1
                        total_2(l)=total_2(l)+1;
                        count_4(l)=count_4(l)+1;
                        individual_choice=[individual_choice; i, k, 1, 0];
                    elseif data_list1(j,4)>0 && data_list1(j,2)==2
                        total_2(l)=total_2(l)+1;
                        count_3(l)=count_3(l)+1;
                        individual_choice=[individual_choice; i, k, 1, 1];
                    end
                end
                if data_list1(j,1)==9
                    if data_list1(j,4)>0 && data_list1(j,2)==5
                        total_1(l)=total_1(l)+1;
                        count_1(l)=count_1(l)+1;
                        individual_choice=[individual_choice; i, k, 1, 1];
                    elseif data_list1(j,4)>0 && data_list1(j,2)==6
                        total_2(l)=total_2(l)+1;
                        count_2(l)=count_2(l)+1;
                        individual_choice=[individual_choice; i, k, 1, 0];
                    end
                end
                if data_list1(j,1)==10
                    if data_list1(j,4)>0 && data_list1(j,2)==6
                        total_1(l)=total_1(l)+1;
                        count_1(l)=count_1(l)+1;
                        individual_choice=[individual_choice; i, k, 1, 1];
                    elseif data_list1(j,4)>0 && data_list1(j,2)==5
                        total_1(l)=total_1(l)+1;
                        count_2(l)=count_2(l)+1;
                        individual_choice=[individual_choice; i, k, 1, 0];
                    end
                end
                if data_list1(j,1)==11
                    if data_list1(j,4)>0 && data_list1(j,2)==7
                        total_1(l)=total_1(l)+1;
                        count_1(l)=count_1(l)+1;
                        individual_choice=[individual_choice; i, k, 1, 1];
                    elseif data_list1(j,4)>0 && data_list1(j,2)==8
                        total_1(l)=total_1(l)+1;
                        count_2(l)=count_2(l)+1;
                        individual_choice=[individual_choice; i, k, 1, 0];
                    end
                end
                if data_list1(j,1)==12
                    if data_list1(j,4)>0 && data_list1(j,2)==8
                        total_1(l)=total_1(l)+1;
                        count_1(l)=count_1(l)+1;
                        individual_choice=[individual_choice; i, k, 1, 1];
                    elseif data_list1(j,4)>0 && data_list1(j,2)==7
                        total_1(l)=total_1(l)+1;
                        count_2(l)=count_2(l)+1;
                        individual_choice=[individual_choice; i, k, 1, 0];
                    end
                end
                if data_list1(j,1)==13
                    if data_list1(j,4)>0 && data_list1(j,2)==9
                        total_1(l)=total_1(l)+1;
                        count_1(l)=count_1(l)+1;
                        individual_choice=[individual_choice; i, k, 1, 1];
                    elseif data_list1(j,4)>0 && data_list1(j,2)==10
                        total_1(l)=total_1(l)+1;
                        count_2(l)=count_2(l)+1;
                        individual_choice=[individual_choice; i, k, 1, 0];
                    end
                end
                if data_list1(j,1)==14
                    if data_list1(j,4)>0 && data_list1(j,2)==10
                        total_1(l)=total_1(l)+1;
                        count_1(l)=count_1(l)+1;
                        individual_choice=[individual_choice; i, k, 1, 1];
                    elseif data_list1(j,4)>0 && data_list1(j,2)==9
                        total_1(l)=total_1(l)+1;
                        count_2(l)=count_2(l)+1;
                        individual_choice=[individual_choice; i, k, 1, 0];
                    end
                end
                if data_list1(j,1)==15
                    if data_list1(j,4)>0 && data_list1(j,2)==5
                        total_1(l)=total_1(l)+1;
                        count_1(l)=count_1(l)+1;
                        individual_choice=[individual_choice; i, k, 1, 1];
                    elseif data_list1(j,4)>0 && data_list1(j,2)==7
                        total_1(l)=total_1(l)+1;
                        count_2(l)=count_2(l)+1;
                        individual_choice=[individual_choice; i, k, 1, 0];
                    end
                end
                if data_list1(j,1)==16
                    if data_list1(j,4)>0 && data_list1(j,2)==7
                        total_1(l)=total_1(l)+1;
                        count_1(l)=count_1(l)+1;
                        individual_choice=[individual_choice; i, k, 1, 1];
                    elseif data_list1(j,4)>0 && data_list1(j,2)==5
                        total_1(l)=total_1(l)+1;
                        count_2(l)=count_2(l)+1;
                        individual_choice=[individual_choice; i, k, 1, 0];
                    end
                end
                if data_list1(j,1)==17
                    if data_list1(j,4)>0 && data_list1(j,2)==6
                        total_1(l)=total_1(l)+1;
                        count_1(l)=count_1(l)+1;
                        individual_choice=[individual_choice; i, k, 1, 1];
                    elseif data_list1(j,4)>0 && data_list1(j,2)==8
                        total_1(l)=total_1(l)+1;
                        count_2(l)=count_2(l)+1;
                        individual_choice=[individual_choice; i, k, 1, 0];
                    end
                end
                if data_list1(j,1)==18
                    if data_list1(j,4)>0 && data_list1(j,2)==8
                        total_1(l)=total_1(l)+1;
                        count_1(l)=count_1(l)+1;
                        individual_choice=[individual_choice; i, k, 1, 1];
                    elseif data_list1(j,4)>0 && data_list1(j,2)==6
                        total_1(l)=total_1(l)+1;
                        count_2(l)=count_2(l)+1;
                        individual_choice=[individual_choice; i, k, 1, 0];
                    end
                end
                if data_list1(j,1)==19
                    if data_list1(j,4)>0 && data_list1(j,2)==5
                        total_1(l)=total_1(l)+1;
                        count_1(l)=count_1(l)+1;
                        individual_choice=[individual_choice; i, k, 1, 1];
                    elseif data_list1(j,4)>0 && data_list1(j,2)==8
                        total_1(l)=total_1(l)+1;
                        count_2(l)=count_2(l)+1;
                        individual_choice=[individual_choice; i, k, 1, 0];
                    end
                end
                if data_list1(j,1)==20
                    if data_list1(j,4)>0 && data_list1(j,2)==8
                        total_1(l)=total_1(l)+1;
                        count_1(l)=count_1(l)+1;
                        individual_choice=[individual_choice; i, k, 1, 1];
                    elseif data_list1(j,4)>0 && data_list1(j,2)==5
                        total_1(l)=total_1(l)+1;
                        count_2(l)=count_2(l)+1;
                        individual_choice=[individual_choice; i, k, 1, 0];
                    end
                end
                if data_list1(j,1)==21
                    if data_list1(j,4)>0 && data_list1(j,2)==7
                        total_1(l)=total_1(l)+1;
                        count_1(l)=count_1(l)+1;
                        individual_choice=[individual_choice; i, k, 1, 1];
                    elseif data_list1(j,4)>0 && data_list1(j,2)==6
                        total_1(l)=total_1(l)+1;
                        count_2(l)=count_2(l)+1;
                        individual_choice=[individual_choice; i, k, 1, 0];
                    end
                end
                if data_list1(j,1)==22
                    if data_list1(j,4)>0 && data_list1(j,2)==6
                        total_1(l)=total_1(l)+1;
                        count_1(l)=count_1(l)+1;
                        individual_choice=[individual_choice; i, k, 1, 1];
                    elseif data_list1(j,4)>0 && data_list1(j,2)==7
                        total_1(l)=total_1(l)+1;
                        count_2(l)=count_2(l)+1;
                        individual_choice=[individual_choice; i, k, 1, 0];
                    end
                end
                if data_list1(j,1)==23
                    if data_list1(j,4)>0 && data_list1(j,2)==5
                        total_2(l)=total_2(l)+1;
                        count_3(l)=count_3(l)+1;
                        individual_choice=[individual_choice; i, k, 1, 1];
                    elseif data_list1(j,4)>0 && data_list1(j,2)==6
                        total_2(l)=total_2(l)+1;
                        count_4(l)=count_4(l)+1;
                        individual_choice=[individual_choice; i, k, 1, 0];
                    end
                end
                if data_list1(j,1)==24
                    if data_list1(j,4)>0 && data_list1(j,2)==6
                        total_2(l)=total_2(l)+1;
                        count_3(l)=count_3(l)+1;
                        individual_choice=[individual_choice; i, k, 1, 1];
                    elseif data_list1(j,4)>0 && data_list1(j,2)==5
                        total_2(l)=total_2(l)+1;
                        count_4(l)=count_4(l)+1;
                        individual_choice=[individual_choice; i, k, 1, 0];
                    end
                end
                if data_list1(j,1)==25
                    if data_list1(j,4)>0 && data_list1(j,2)==7
                        total_2(l)=total_2(l)+1;
                        count_3(l)=count_3(l)+1;
                        individual_choice=[individual_choice; i, k, 1, 1];
                    elseif data_list1(j,4)>0 && data_list1(j,2)==8
                        total_2(l)=total_2(l)+1;
                        count_4(l)=count_4(l)+1;
                        individual_choice=[individual_choice; i, k, 1, 0];
                    end
                end
                if data_list1(j,1)==26
                    if data_list1(j,4)>0 && data_list1(j,2)==8
                        total_2(l)=total_2(l)+1;
                        count_3(l)=count_3(l)+1;
                        individual_choice=[individual_choice; i, k, 1, 1];
                    elseif data_list1(j,4)>0 && data_list1(j,2)==7
                        total_2(l)=total_2(l)+1;
                        count_4(l)=count_4(l)+1;
                        individual_choice=[individual_choice; i, k, 1, 0];
                    end
                end
                if data_list1(j,1)==27
                    if data_list1(j,4)>0 && data_list1(j,2)==9
                        total_2(l)=total_2(l)+1;
                        count_3(l)=count_3(l)+1;
                        individual_choice=[individual_choice; i, k, 1, 1];
                    elseif data_list1(j,4)>0 && data_list1(j,2)==10
                        total_2(l)=total_2(l)+1;
                        count_4(l)=count_4(l)+1;
                        individual_choice=[individual_choice; i, k, 1, 0];
                    end
                end
                if data_list1(j,1)==28
                    if data_list1(j,4)>0 && data_list1(j,2)==10
                        total_2(l)=total_2(l)+1;
                        count_3(l)=count_3(l)+1;
                        individual_choice=[individual_choice; i, k, 1, 1];
                    elseif data_list1(j,4)>0 && data_list1(j,2)==9
                        total_2(l)=total_2(l)+1;
                        count_4(l)=count_4(l)+1;
                        individual_choice=[individual_choice; i, k, 1, 0];
                    end
                end
                if data_list1(j,1)==29
                    if data_list1(j,4)>0 && data_list1(j,2)==5
                        total_2(l)=total_2(l)+1;
                        count_3(l)=count_3(l)+1;
                        individual_choice=[individual_choice; i, k, 1, 1];
                    elseif data_list1(j,4)>0 && data_list1(j,2)==7
                        total_2(l)=total_2(l)+1;
                        count_4(l)=count_4(l)+1;
                        individual_choice=[individual_choice; i, k, 1, 0];
                    end
                end
                if data_list1(j,1)==30
                    if data_list1(j,4)>0 && data_list1(j,2)==7
                        total_2(l)=total_2(l)+1;
                        count_3(l)=count_3(l)+1;
                        individual_choice=[individual_choice; i, k, 1, 1];
                    elseif data_list1(j,4)>0 && data_list1(j,2)==5
                        total_2(l)=total_2(l)+1;
                        count_4(l)=count_4(l)+1;
                        individual_choice=[individual_choice; i, k, 1, 0];
                    end
                end
                if data_list1(j,1)==31
                    if data_list1(j,4)>0 && data_list1(j,2)==6
                        total_2(l)=total_2(l)+1;
                        count_3(l)=count_3(l)+1;
                        individual_choice=[individual_choice; i, k, 1, 1];
                    elseif data_list1(j,4)>0 && data_list1(j,2)==8
                        total_2(l)=total_2(l)+1;
                        count_4(l)=count_4(l)+1;
                        individual_choice=[individual_choice; i, k, 1, 0];
                    end
                end
                if data_list1(j,1)==32
                    if data_list1(j,4)>0 && data_list1(j,2)==8
                        total_2(l)=total_2(l)+1;
                        count_3(l)=count_3(l)+1;
                        individual_choice=[individual_choice; i, k, 1, 1];
                    elseif data_list1(j,4)>0 && data_list1(j,2)==6
                        total_2(l)=total_2(l)+1;
                        count_4(l)=count_4(l)+1;
                        individual_choice=[individual_choice; i, k, 1, 0];
                    end
                end
                if data_list1(j,1)==33
                    if data_list1(j,4)>0 && data_list1(j,2)==5
                        total_2(l)=total_2(l)+1;
                        count_3(l)=count_3(l)+1;
                        individual_choice=[individual_choice; i, k, 1, 1];
                    elseif data_list1(j,4)>0 && data_list1(j,2)==8
                        total_2(l)=total_2(l)+1;
                        count_4(l)=count_4(l)+1;
                        individual_choice=[individual_choice; i, k, 1, 0];
                    end
                end
                if data_list1(j,1)==34
                    if data_list1(j,4)>0 && data_list1(j,2)==8
                        total_2(l)=total_2(l)+1;
                        count_3(l)=count_3(l)+1;
                        individual_choice=[individual_choice; i, k, 1, 1];
                    elseif data_list1(j,4)>0 && data_list1(j,2)==5
                        total_2(l)=total_2(l)+1;
                        count_4(l)=count_4(l)+1;
                        individual_choice=[individual_choice; i, k, 1, 0];
                    end
                end
                if data_list1(j,1)==35
                    if data_list1(j,4)>0 && data_list1(j,2)==7
                        total_2(l)=total_2(l)+1;
                        count_3(l)=count_3(l)+1;
                        individual_choice=[individual_choice; i, k, 1, 1];
                    elseif data_list1(j,4)>0 && data_list1(j,2)==6
                        total_2(l)=total_2(l)+1;
                        count_4(l)=count_4(l)+1;
                        individual_choice=[individual_choice; i, k, 1, 0];
                    end
                end
                if data_list1(j,1)==36
                    if data_list1(j,4)>0 && data_list1(j,2)==6
                        total_2(l)=total_2(l)+1;
                        count_3(l)=count_3(l)+1;
                        individual_choice=[individual_choice; i, k, 1, 1];
                    elseif data_list1(j,4)>0 && data_list1(j,2)==7
                        total_2(l)=total_2(l)+1;
                        count_4(l)=count_4(l)+1;
                        individual_choice=[individual_choice; i, k, 1, 0];
                    end
                end
            end
        end
    end
    
    for j=1:length(data_list2)
        for k=0:2
            l=k+4;
            if data_list2(j,5)==k
                if data_list2(j,1)==1
                    if data_list2(j,4)>0 && data_list2(j,2)==1
                        total_1(l)=total_1(l)+1;
                        count_1(l)=count_1(l)+1;
                        individual_choice=[individual_choice; i, k, 2, 1];
                    elseif data_list2(j,4)>0 && data_list2(j,2)==2
                        total_1(l)=total_1(l)+1;
                        count_2(l)=count_2(l)+1;
                        individual_choice=[individual_choice; i, k, 2, 0];
                    end
                end
                if data_list2(j,1)==2
                    if data_list2(j,4)>0 && data_list2(j,2)==1
                        total_1(l)=total_1(l)+1;
                        count_2(l)=count_2(l)+1;
                        individual_choice=[individual_choice; i, k, 2, 0];
                    elseif data_list2(j,4)>0 && data_list2(j,2)==2
                        total_1(l)=total_1(l)+1;
                        count_1(l)=count_1(l)+1;
                        individual_choice=[individual_choice; i, k, 2, 1];
                    end
                end
                if data_list2(j,1)==3
                    if data_list2(j,4)>0 && data_list2(j,2)==1
                        total_2(l)=total_2(l)+1;
                        count_3(l)=count_3(l)+1;
                        individual_choice=[individual_choice; i, k, 2, 1];
                    elseif data_list2(j,4)>0 && data_list2(j,2)==2
                        total_2(l)=total_2(l)+1;
                        count_4(l)=count_4(l)+1;
                        individual_choice=[individual_choice; i, k, 2, 0];
                    end
                end
                if data_list2(j,1)==4
                    if data_list2(j,4)>0 && data_list2(j,2)==1
                        total_2(l)=total_2(l)+1;
                        count_4(l)=count_4(l)+1;
                        individual_choice=[individual_choice; i, k, 2, 0];
                    elseif data_list2(j,4)>0 && data_list2(j,2)==2
                        total_2(l)=total_2(l)+1;
                        count_3(l)=count_3(l)+1;
                        individual_choice=[individual_choice; i, k, 2, 1];
                    end
                end
                if data_list2(j,1)==9
                    if data_list2(j,4)>0 && data_list2(j,2)==5
                        total_1(l)=total_1(l)+1;
                        count_1(l)=count_1(l)+1;
                        individual_choice=[individual_choice; i, k, 2, 1];
                    elseif data_list2(j,4)>0 && data_list2(j,2)==6
                        total_2(l)=total_2(l)+1;
                        count_2(l)=count_2(l)+1;
                        individual_choice=[individual_choice; i, k, 2, 0];
                    end
                end
                if data_list2(j,1)==10
                    if data_list2(j,4)>0 && data_list2(j,2)==6
                        total_1(l)=total_1(l)+1;
                        count_1(l)=count_1(l)+1;
                        individual_choice=[individual_choice; i, k, 2, 1];
                    elseif data_list2(j,4)>0 && data_list2(j,2)==5
                        total_1(l)=total_1(l)+1;
                        count_2(l)=count_2(l)+1;
                        individual_choice=[individual_choice; i, k, 2, 0];
                    end
                end
                if data_list2(j,1)==11
                    if data_list2(j,4)>0 && data_list2(j,2)==7
                        total_1(l)=total_1(l)+1;
                        count_1(l)=count_1(l)+1;
                        individual_choice=[individual_choice; i, k, 2, 1];
                    elseif data_list2(j,4)>0 && data_list2(j,2)==8
                        total_1(l)=total_1(l)+1;
                        count_2(l)=count_2(l)+1;
                        individual_choice=[individual_choice; i, k, 2, 0];
                    end
                end
                if data_list2(j,1)==12
                    if data_list2(j,4)>0 && data_list2(j,2)==8
                        total_1(l)=total_1(l)+1;
                        count_1(l)=count_1(l)+1;
                        individual_choice=[individual_choice; i, k, 2, 1];
                    elseif data_list2(j,4)>0 && data_list2(j,2)==7
                        total_1(l)=total_1(l)+1;
                        count_2(l)=count_2(l)+1;
                        individual_choice=[individual_choice; i, k, 2, 0];
                    end
                end
                if data_list2(j,1)==13
                    if data_list2(j,4)>0 && data_list2(j,2)==9
                        total_1(l)=total_1(l)+1;
                        count_1(l)=count_1(l)+1;
                        individual_choice=[individual_choice; i, k, 2, 1];
                    elseif data_list2(j,4)>0 && data_list2(j,2)==10
                        total_1(l)=total_1(l)+1;
                        count_2(l)=count_2(l)+1;
                        individual_choice=[individual_choice; i, k, 2, 0];
                    end
                end
                if data_list2(j,1)==14
                    if data_list2(j,4)>0 && data_list2(j,2)==10
                        total_1(l)=total_1(l)+1;
                        count_1(l)=count_1(l)+1;
                        individual_choice=[individual_choice; i, k, 2, 1];
                    elseif data_list2(j,4)>0 && data_list2(j,2)==9
                        total_1(l)=total_1(l)+1;
                        count_2(l)=count_2(l)+1;
                        individual_choice=[individual_choice; i, k, 2, 0];
                    end
                end
                if data_list2(j,1)==15
                    if data_list2(j,4)>0 && data_list2(j,2)==5
                        total_1(l)=total_1(l)+1;
                        count_1(l)=count_1(l)+1;
                        individual_choice=[individual_choice; i, k, 2, 1];
                    elseif data_list2(j,4)>0 && data_list2(j,2)==7
                        total_1(l)=total_1(l)+1;
                        count_2(l)=count_2(l)+1;
                        individual_choice=[individual_choice; i, k, 2, 0];
                    end
                end
                if data_list2(j,1)==16
                    if data_list2(j,4)>0 && data_list2(j,2)==7
                        total_1(l)=total_1(l)+1;
                        count_1(l)=count_1(l)+1;
                        individual_choice=[individual_choice; i, k, 2, 1];
                    elseif data_list2(j,4)>0 && data_list2(j,2)==5
                        total_1(l)=total_1(l)+1;
                        count_2(l)=count_2(l)+1;
                        individual_choice=[individual_choice; i, k, 2, 0];
                    end
                end
                if data_list2(j,1)==17
                    if data_list2(j,4)>0 && data_list2(j,2)==6
                        total_1(l)=total_1(l)+1;
                        count_1(l)=count_1(l)+1;
                        individual_choice=[individual_choice; i, k, 2, 1];
                    elseif data_list2(j,4)>0 && data_list2(j,2)==8
                        total_1(l)=total_1(l)+1;
                        count_2(l)=count_2(l)+1;
                        individual_choice=[individual_choice; i, k, 2, 0];
                    end
                end
                if data_list2(j,1)==18
                    if data_list2(j,4)>0 && data_list2(j,2)==8
                        total_1(l)=total_1(l)+1;
                        count_1(l)=count_1(l)+1;
                        individual_choice=[individual_choice; i, k, 2, 1];
                    elseif data_list2(j,4)>0 && data_list2(j,2)==6
                        total_1(l)=total_1(l)+1;
                        count_2(l)=count_2(l)+1;
                        individual_choice=[individual_choice; i, k, 2, 0];
                    end
                end
                if data_list2(j,1)==19
                    if data_list2(j,4)>0 && data_list2(j,2)==5
                        total_1(l)=total_1(l)+1;
                        count_1(l)=count_1(l)+1;
                        individual_choice=[individual_choice; i, k, 2, 1];
                    elseif data_list2(j,4)>0 && data_list2(j,2)==8
                        total_1(l)=total_1(l)+1;
                        count_2(l)=count_2(l)+1;
                        individual_choice=[individual_choice; i, k, 2, 0];
                    end
                end
                if data_list2(j,1)==20
                    if data_list2(j,4)>0 && data_list2(j,2)==8
                        total_1(l)=total_1(l)+1;
                        count_1(l)=count_1(l)+1;
                        individual_choice=[individual_choice; i, k, 2, 1];
                    elseif data_list2(j,4)>0 && data_list2(j,2)==5
                        total_1(l)=total_1(l)+1;
                        count_2(l)=count_2(l)+1;
                        individual_choice=[individual_choice; i, k, 2, 0];
                    end
                end
                if data_list2(j,1)==21
                    if data_list2(j,4)>0 && data_list2(j,2)==7
                        total_1(l)=total_1(l)+1;
                        count_1(l)=count_1(l)+1;
                        individual_choice=[individual_choice; i, k, 2, 1];
                    elseif data_list2(j,4)>0 && data_list2(j,2)==6
                        total_1(l)=total_1(l)+1;
                        count_2(l)=count_2(l)+1;
                        individual_choice=[individual_choice; i, k, 2, 0];
                    end
                end
                if data_list2(j,1)==22
                    if data_list2(j,4)>0 && data_list2(j,2)==6
                        total_1(l)=total_1(l)+1;
                        count_1(l)=count_1(l)+1;
                        individual_choice=[individual_choice; i, k, 2, 1];
                    elseif data_list2(j,4)>0 && data_list2(j,2)==7
                        total_1(l)=total_1(l)+1;
                        count_2(l)=count_2(l)+1;
                        individual_choice=[individual_choice; i, k, 2, 0];
                    end
                end
                if data_list2(j,1)==23
                    if data_list2(j,4)>0 && data_list2(j,2)==5
                        total_2(l)=total_2(l)+1;
                        count_3(l)=count_3(l)+1;
                        individual_choice=[individual_choice; i, k, 2, 1];
                    elseif data_list2(j,4)>0 && data_list2(j,2)==6
                        total_2(l)=total_2(l)+1;
                        count_4(l)=count_4(l)+1;
                        individual_choice=[individual_choice; i, k, 2, 0];
                    end
                end
                if data_list2(j,1)==24
                    if data_list2(j,4)>0 && data_list2(j,2)==6
                        total_2(l)=total_2(l)+1;
                        count_3(l)=count_3(l)+1;
                        individual_choice=[individual_choice; i, k, 2, 1];
                    elseif data_list2(j,4)>0 && data_list2(j,2)==5
                        total_2(l)=total_2(l)+1;
                        count_4(l)=count_4(l)+1;
                        individual_choice=[individual_choice; i, k, 2, 0];
                    end
                end
                if data_list2(j,1)==25
                    if data_list2(j,4)>0 && data_list2(j,2)==7
                        total_2(l)=total_2(l)+1;
                        count_3(l)=count_3(l)+1;
                        individual_choice=[individual_choice; i, k, 2, 1];
                    elseif data_list2(j,4)>0 && data_list2(j,2)==8
                        total_2(l)=total_2(l)+1;
                        count_4(l)=count_4(l)+1;
                        individual_choice=[individual_choice; i, k, 2, 0];
                    end
                end
                if data_list2(j,1)==26
                    if data_list2(j,4)>0 && data_list2(j,2)==8
                        total_2(l)=total_2(l)+1;
                        count_3(l)=count_3(l)+1;
                        individual_choice=[individual_choice; i, k, 2, 1];
                    elseif data_list2(j,4)>0 && data_list2(j,2)==7
                        total_2(l)=total_2(l)+1;
                        count_4(l)=count_4(l)+1;
                        individual_choice=[individual_choice; i, k, 2, 0];
                    end
                end
                if data_list2(j,1)==27
                    if data_list2(j,4)>0 && data_list2(j,2)==9
                        total_2(l)=total_2(l)+1;
                        count_3(l)=count_3(l)+1;
                        individual_choice=[individual_choice; i, k, 2, 1];
                    elseif data_list2(j,4)>0 && data_list2(j,2)==10
                        total_2(l)=total_2(l)+1;
                        count_4(l)=count_4(l)+1;
                        individual_choice=[individual_choice; i, k, 2, 0];
                    end
                end
                if data_list2(j,1)==28
                    if data_list2(j,4)>0 && data_list2(j,2)==10
                        total_2(l)=total_2(l)+1;
                        count_3(l)=count_3(l)+1;
                        individual_choice=[individual_choice; i, k, 2, 1];
                    elseif data_list2(j,4)>0 && data_list2(j,2)==9
                        total_2(l)=total_2(l)+1;
                        count_4(l)=count_4(l)+1;
                        individual_choice=[individual_choice; i, k, 2, 0];
                    end
                end
                if data_list2(j,1)==29
                    if data_list2(j,4)>0 && data_list2(j,2)==5
                        total_2(l)=total_2(l)+1;
                        count_3(l)=count_3(l)+1;
                        individual_choice=[individual_choice; i, k, 2, 1];
                    elseif data_list2(j,4)>0 && data_list2(j,2)==7
                        total_2(l)=total_2(l)+1;
                        count_4(l)=count_4(l)+1;
                        individual_choice=[individual_choice; i, k, 2, 0];
                    end
                end
                if data_list2(j,1)==30
                    if data_list2(j,4)>0 && data_list2(j,2)==7
                        total_2(l)=total_2(l)+1;
                        count_3(l)=count_3(l)+1;
                        individual_choice=[individual_choice; i, k, 2, 1];
                    elseif data_list2(j,4)>0 && data_list2(j,2)==5
                        total_2(l)=total_2(l)+1;
                        count_4(l)=count_4(l)+1;
                        individual_choice=[individual_choice; i, k, 2, 0];
                    end
                end
                if data_list2(j,1)==31
                    if data_list2(j,4)>0 && data_list2(j,2)==6
                        total_2(l)=total_2(l)+1;
                        count_3(l)=count_3(l)+1;
                        individual_choice=[individual_choice; i, k, 2, 1];
                    elseif data_list2(j,4)>0 && data_list2(j,2)==8
                        total_2(l)=total_2(l)+1;
                        count_4(l)=count_4(l)+1;
                        individual_choice=[individual_choice; i, k, 2, 0];
                    end
                end
                if data_list2(j,1)==32
                    if data_list2(j,4)>0 && data_list2(j,2)==8
                        total_2(l)=total_2(l)+1;
                        count_3(l)=count_3(l)+1;
                        individual_choice=[individual_choice; i, k, 2, 1];
                    elseif data_list2(j,4)>0 && data_list2(j,2)==6
                        total_2(l)=total_2(l)+1;
                        count_4(l)=count_4(l)+1;
                        individual_choice=[individual_choice; i, k, 2, 0];
                    end
                end
                if data_list2(j,1)==33
                    if data_list2(j,4)>0 && data_list2(j,2)==5
                        total_2(l)=total_2(l)+1;
                        count_3(l)=count_3(l)+1;
                        individual_choice=[individual_choice; i, k, 2, 1];
                    elseif data_list2(j,4)>0 && data_list2(j,2)==8
                        total_2(l)=total_2(l)+1;
                        count_4(l)=count_4(l)+1;
                        individual_choice=[individual_choice; i, k, 2, 0];
                    end
                end
                if data_list2(j,1)==34
                    if data_list2(j,4)>0 && data_list2(j,2)==8
                        total_2(l)=total_2(l)+1;
                        count_3(l)=count_3(l)+1;
                        individual_choice=[individual_choice; i, k, 2, 1];
                    elseif data_list2(j,4)>0 && data_list2(j,2)==5
                        total_2(l)=total_2(l)+1;
                        count_4(l)=count_4(l)+1;
                        individual_choice=[individual_choice; i, k, 2, 0];
                    end
                end
                if data_list2(j,1)==35
                    if data_list2(j,4)>0 && data_list2(j,2)==7
                        total_2(l)=total_2(l)+1;
                        count_3(l)=count_3(l)+1;
                        individual_choice=[individual_choice; i, k, 2, 1];
                    elseif data_list2(j,4)>0 && data_list2(j,2)==6
                        total_2(l)=total_2(l)+1;
                        count_4(l)=count_4(l)+1;
                        individual_choice=[individual_choice; i, k, 2, 0];
                    end
                end
                if data_list2(j,1)==36
                    if data_list2(j,4)>0 && data_list2(j,2)==6
                        total_2(l)=total_2(l)+1;
                        count_3(l)=count_3(l)+1;
                        individual_choice=[individual_choice; i, k, 2, 1];
                    elseif data_list2(j,4)>0 && data_list2(j,2)==7
                        total_2(l)=total_2(l)+1;
                        count_4(l)=count_4(l)+1;
                        individual_choice=[individual_choice; i, k, 2, 0];
                    end
                end
            end
        end
    end
    
    y=0;
    
    for n=1:6
        y=[(count_1(n)-count_2(n))/total_1(n), (count_3(n)-count_4(n))/total_2(n)];
        choice_list(n)=mean(y);
    end
    
%     figure(i)
    y=[choice_list(1:3); choice_list(4:6)];
%     bar(y);
    
    choice_temp=horzcat(choice_list(1:3)', choice_list(4:6)');
    
    choice=vertcat(choice, choice_temp);
    
end

