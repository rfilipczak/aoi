clc

GOAL = inputdlg('Podaj ilość węzłów (4, 9, 16, 25, ...)');
GOAL = str2double(GOAL{1});

if ceil(sqrt(GOAL)) ~= sqrt(GOAL)
    fprintf('Nieodpowiednia liczba węzłów\n');
    return;
end

TOP = 500;
LEFT = 300;
RIGHT = 150;
BOTTOM = 0;

ROWS = sqrt(GOAL)+2;
COLS = sqrt(GOAL)+2;

INIT = 100;
EPS = 0.0001;

V = zeros(ROWS,COLS)+INIT;

for col=1 : COLS
    V(1,col) = TOP;
    V(ROWS,col) = BOTTOM;
end
for row=2 : ROWS-1
    V(row,1) = LEFT;
    V(row,COLS) = RIGHT;
end

Vprev = V;

done = false;
counter = 0;
loopGuard = GOAL * 10;
okprev = 0;

while ~done && counter < loopGuard
    ok = 0;
    for i = 2 : ROWS - 1
        for j = 2 : COLS - 1
            V(i, j) = (V(i, j-1)+V(i-1,j)+Vprev(i+1,j)+Vprev(i,j+1))/4;
            ok = ok + (abs(V(i,j) - Vprev(i,j)) <= EPS);
        end
    end
    if ok == GOAL
        done = true;
    end
    Vprev = V;
    okprev = ok;
    counter = counter + 1;
end


disp(V);
disp(counter);
contourf(flip(V));
