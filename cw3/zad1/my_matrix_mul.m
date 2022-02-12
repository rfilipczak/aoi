function [result] = my_matrix_mul(a,b)
%MY_MATRIX_MUL Multiples two matrixes or a matrix and a scalar
%   If they have incompatible sizes exception is thrown
if all(size(a, 2) == size(b, 1)) || length(b) == 1
    if length(b) == 1
        result = zeros(size(a));
        rows = size(a, 1);
        cols = size(a, 2);
        for row = 1 : rows
            for col = 1 : cols
                result(row, col) = a(row, col) * b;
            end
        end
    else
        result = zeros(size(a, 1), size(b, 2));
        rows = size(a, 1);
        cols = size(b, 2);
        a_cols = size(a, 2);
        for row = 1 : rows
            for col = 1 : cols
                sum = 0;
                for i = 1 : a_cols
                    sum = sum + a(row, i) * b(i, col);
                end
                result(row,col) = sum;
            end
        end
    end
else
    throw(MException('My:IncompatibleMatrixes', 'Niekompatybilne wymiary macierzy'));
end
end

