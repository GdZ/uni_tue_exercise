function [list] = read_fixation_list(path_to_txt_file)

    
    file=fopen(path_to_txt_file,'r');
    list=zeros(1000,3);
    list_idx=0;
    
    if ~feof(file)
        fgetl(file);%skip header
    
        while ~feof(file)
            data = textscan(file, '%n %n %n ', 1);
            data=cell2mat(data);

            list_idx=list_idx+1;
            list(list_idx,1:3)=data(1:3);
        
            fgetl(file);
        end
    
        if list_idx>0
            list=list(1:list_idx,1:3);
        end
    end
    fclose(file);
end