function [result, time] = my_timeit(fncHandle, nArgs, varargin)
%MY_TIMEIT Times exec time of a function.
%   Result = result of a fun; time = time of exec in s

if nArgs == 1
    start = tic;
    result = fncHandle(varargin{1});
    time = toc(start);
elseif nArgs == 2
    start = tic;
    result = fncHandle(varargin{1}, varargin{2});
    time = toc(start);
else
    throw(MException('My:InvalidNargs', "Nieprawidlowa ilosc argumentów"));
end

end

