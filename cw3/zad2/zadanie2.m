clc
addpath(genpath('../zad1/'))

msg = "Wybierz operacje";

opts = [
    "+ - dodanie dwóch macierzy (lub macierzy i skalara)"
    "* - mnożenie dwóch macierzy (lub macierzy i skalara)"
    "' - transpozycja(zespolone) macierzy" 
    ".' - transpozycja macierzy" 
    "^ - podniesienie macierzy do skalara" 
    ".^ - podniesienie elementów macierzy do opowiadających potęg w drugiej macierzy bądz do skalara"
];

choice = menu(msg,opts);

title = 'Kalkulator';
prompts = {'Podaj pierwszy argument:', 'Podaj drugi argument:'};
dims = [1 35];

args = {[],[]};

switch choice
    case {1, 2, 5, 6}
        args = inputdlg(prompts, title, dims);
    case {3, 4}
        args = inputdlg(prompts{1}, title, dims);
        args{2} = "";
    otherwise
        fprintf('Error: nieprawidlowy wybor');
        return;
end

a = str2num(args{1});
b = str2num(args{2});

expected = [];

execution_times = {0,0};

try
    switch choice
        case 1
            [got, execution_times{1}] = my_timeit(@my_matrix_add, 2, a, b);
            start = tic;
            expected = a + b;
            execution_times{2} = toc(start);
        case 2
            [got, execution_times{1}] = my_timeit(@my_matrix_mul, 2, a, b);
            start = tic;
            expected = a * b;
            execution_times{2} = toc(start);
        case 3
            [got, execution_times{1}] = my_timeit(@my_complex_conj_transpose, 1, a);
            start = tic;
            expected = a';
            execution_times{2} = toc(start);
        case 4
            [got, execution_times{1}] = my_timeit(@my_transpose, 1, a);
            start = tic;
            expected = a.';
            execution_times{2} = toc(start);
        case 5
            [got, execution_times{1}] = my_timeit(@my_matrix_power, 2, a, b);
            start = tic;
            expected = a^b;
            execution_times{2} = toc(start);
        case 6
            [got, execution_times{1}] = my_timeit(@my_element_wise_power, 2, a, b);
            start = tic;
            expected = a.^b;
            execution_times{2} = toc(start);
    end
catch ME
    fprintf("Blad: " + ME.message + "\n");
    return;
end

fprintf("Wynik mojej funkcji:\n");
disp(got);
fprintf("Wynik operatora wbudowanego:\n");
disp(expected);

if all(got == expected)
    fprintf("Wyniki się zgadzają\n");

    fprintf("Mojej funkcji obliczenia zajeły: %f s\nOperatorowi wbudowanemu: %f s\n", execution_times{1}, execution_times{2});
    if execution_times{1} > execution_times{2}
        fprintf("Operator wbudowany okazał się szybszy o %f s\n", execution_times{1} - execution_times{2});
    elseif execution_times{1} == execution_times{2}
        fprintf("Moja funckja i operator wbudowany miały ten sam czas\n");
    else
        fprintf("Moja funckja okazała się szybsza od operatora wbudowanego o %f s\n", execution_times{2} - execution_times{1});
    end
else
    fprintf("Wyniki się niestety różnią\n");
end

