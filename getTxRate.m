function [TxRate,c_msg]=getTxRate()
TxRate=-1;
c_msg="";
if ~isempty(instrfind)
    fclose(instrfind);
    delete(instrfind);
end
a = serial('COM3','BaudRate',9600);
a.ReadAsyncMode = 'continuous';
fopen(a);

while 1
    c=fscanf(a);
    disp(c);
    if c~=""
        if contains(c,"#T")
            c_str = extractBetween(c,"#T:","#");
            c_num=str2double(c_str);
            TxRate=c_num;
            disp("TxRate:"+c_num);
        end
        if contains(c,"#M")
            c_msg = extractBetween(c,"#M:","#");
            disp("MSG:"+c_msg);
        end
        c="";
    end
    if TxRate~=-1 & c_msg~=""
        break;
    end
    pause(0.1);
end
fclose(a);
end