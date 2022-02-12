function [result] = my_element_wise_power(a,b)
%MY_ELEMENT_WISE_POWER Raises each element of a to the power of
%coresponding element of b
%   Matrixes must have compatible sizes or b needs to be a scalar; 
%   if not then an exception is thrown
if all((size(a) == size(b))) || (length(b) == 1)
    rows = size(a, 1);
    cols = size(a, 2);
    result = zeros(size(a));
    if length(b) == 1
        % b is a scalar
        for row = 1 : rows
            for col = 1 : cols
                result(row, col) = a(row, col)^b;
            end
        end
    else
        for row = 1 : rows
            for col = 1 : cols
                result(row, col) = a(row, col)^b(row, col);
            end
        end
    end
else
    throw(MException('My:IncompatibleMatrixes', 'Niekompatybilne wymiary macierzy'));
end

