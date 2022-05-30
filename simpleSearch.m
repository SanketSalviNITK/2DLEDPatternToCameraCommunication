function sSearch=simpleSearch(set,key)
[~,~,s]=size(set);
sSearch=-1;
for x=1:s
    if key(:,:)==set(:,:,x)
        sSearch=x;
        break
    end
end
end