function state=state(b,i)
state0=[1 1;
       1 1];
state1=[1 1;
       1 0];
state2=[1 1;
       0 1];
state3=[1 0;
       1 1];
state4=[0 1;
       1 1];
if isa(b,'char')
    b=str2num(b);
end
if b==0
    state=state0;
else 
    switch mod(i,4)
        case 1
            state=state1;
        case 2
            state=state2;
        case 3
            state=state3;
        case 0
            state=state4;
    end
            
end