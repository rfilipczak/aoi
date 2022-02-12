function results = my_transpose_multiple(varargin)
%MY_TRANSPOSE_MULTIPLE plik wykonujący transpozycję nieokreślonej z góry liczby macierzy
%   w przypadku argumentów zespolonych należy dla każdego z takich argumentów
%   poprosić użytkownika o podanie rodzaju transpozycji.
%
%   funckja zwraca macierz komórkową ztransponowanych macierzy z argumentów

results = {length(varargin)};

for i = 1 : length(varargin)
    current = varargin{i};
    if isreal(current)
        results{i} = current.';
    else
        answer = questdlg(num2str(current), 'Wybierz rodzaj transpozycji', 'Zwykła transpozycja', 'Sprzężenie hermitowskie macierzy', 'Sprzężenie hermitowskie macierzy');
        switch answer
            case 'Zwykła transpozycja'
                results{i} = current.';
            case 'Sprzężenie hermitowskie macierzy'
                results{i} = current';
        end
    end
end
end

