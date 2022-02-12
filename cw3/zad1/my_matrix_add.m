function [result] = my_matrix_add(a,b)
%my_matrix_add Adds two matrixes or a matrix and scalar together
%   If they have incompatible sizes or b is not a scalar an exception is thrown
if all(size(a) == size(b)) || length(b) == 1
    result = zeros(size(a));
    rows = size(a, 1);
    cols = size(a, 2);
    if (length(b) == 1)
        for row=1 : rows
            for col=1 : cols
                result(row,col) = a(row,col) + b;
            end
        end
    else
        for row=1 : rows
            for col=1 : cols
                result(row,col) = a(row,col) + b(row,col);
            end
        end
    end
else
    throw(MException('My:IncompatibleMatrixes', 'Niekompatybilne wymiary macierzy'));
end
end

