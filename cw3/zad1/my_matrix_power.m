function [result] = my_matrix_power(matrix, scalar)
%MY_MATRIX_POWER Returns matrix to the scalar
%   Matrix must be a square matrix and scalar must be a positive integer
%   otherwise it throws and exception
if size(matrix,1) == size(matrix,2)
    if length(scalar) == 1
        if scalar >= 1
            result = matrix;
            for i = 1 : scalar-1
                result = my_matrix_mul(result, matrix);
            end
        else
            throw(MException('My:InvalidScalar','Skalar musi być dodatni'));
        end
    else
        throw(MException('My:NotAScalar', 'Drugi argument musi być skalarem'));
    end
else
    throw(MException('My:MatrixNotSquare','Macierz musi być kwadratowa'));
end
end

