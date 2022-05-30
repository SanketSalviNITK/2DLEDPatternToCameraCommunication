function matrixSet = generateMatrices(s)
matrixSet=zeros(s,s,2^s);
sizeOfSet=2^s;
comDataStream=dec2bin(2^s-1:-1:0)-'0';
dataStream=zeros(1,s);
for y=sizeOfSet:-1:1
    dataStream=comDataStream(y,:);
    matrixSet(1:2,1:2,(sizeOfSet+1)-y)=state(dataStream(1),1);
    if s>1
        matrixSet(1:2,s-1:s,(sizeOfSet+1)-y)=state(dataStream(2),2);
        if s>2
            matrixSet(s-1:s,1:2,(sizeOfSet+1)-y)=state(dataStream(3),3);
            matrixSet(s-1:s,s-1:s,(sizeOfSet+1)-y)=state(dataStream(4),4);
            if s>4
                matrixSet(s/2-1:s/2,s/2-1:s/2,(sizeOfSet+1)-y)=state(dataStream(5),5);
                matrixSet(s/2-1:s/2,s/2+1:s/2+2,(sizeOfSet+1)-y)=state(dataStream(6),6);
                matrixSet(s/2+1:s/2+2,s/2-1:s/2,(sizeOfSet+1)-y)=state(dataStream(7),7);
                matrixSet(s/2+1:s/2+2,s/2+1:s/2+2,(sizeOfSet+1)-y)=state(dataStream(8),8);
            end
        end
    end 
end
end
