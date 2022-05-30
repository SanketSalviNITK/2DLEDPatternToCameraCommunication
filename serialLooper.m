function l=serialLooper()
if ~isempty(instrfind)
    fclose(instrfind);
    delete(instrfind);
end
a = serial('COM3','BaudRate',9600);
a.ReadAsyncMode = 'continuous';
fopen(a);
fprintf(a,'200');
for x=1:50
c=fscanf(a);
disp(c);
if(c=="#START#")
    fprintf(a,'500');
end
if(c=="#END#")
  fprintf(a,'100');
end
end
fclose(a);
end