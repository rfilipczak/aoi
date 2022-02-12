function [result, discarded] = my_add_mul_multiple(op, varargin)
%FUNKCJA1 plik obliczający sumę lub iloczyn dowolnej liczby argumentów
%   jako
%   pierwszy parametr wejściowy należy uwzględnić możliwość podawania (w postaci
%   odpowiedniego symbolu) rodzaju wymaganej operacji
%   ([+], [*], [.*])
%   Program powinien sprawdzać rozmiary wprowadzanych argumentów, odrzucając
%   te, które nie spełniają odpowiednich wymagań,
%
%   Funkcja zwraca wynik pod result oraz liczbę odrzuconych argumentów pod
%   discarded
%

discarded = 0;
result = varargin{1};

switch op
    case '+'
        ref_size = size(varargin{1});
        for i = 2 : length(varargin)
            next = varargin{i};
            if all(size(next) == ref_size) || length(next) == 1
                result = result + next;
            else
                discarded = discarded + 1;
            end
        end
    case '*'
        for i = 2 : length(varargin)
            next = varargin{i};
            if all(size(next, 1) == size(result, 2)) || length(next) == 1 || length(result) == 1
                result = result * next;
            else
                discarded = discarded + 1;
            end
        end
    case '.*'
        for i = 2 : length(varargin)
            next = varargin{i};
            try
                result = result .* next;
            catch ME
                switch ME.identifier
                    case 'MATLAB:sizeDimensionsMustMatch'
                        discarded = discarded + 1;
                    otherwise
                        rethrow(ME);
                end
            end
        end
    otherwise
        fprintf("Nieprawidlowy operator: %c. Dopuszczalne operatory: +,*,.*\n", op);
end
end
