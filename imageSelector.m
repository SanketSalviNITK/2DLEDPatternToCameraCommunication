function selected=imageSelector(frameRate, txRate)
%frameRate=5;
%txRate=2000;
x1 = rand;
x2 = rand;
    if x1<(100/txRate) & x2<(round(frameRate)/30)
      selected=1;
    else
      selected=0;
    end
end