function result = my_transpose(arg)
%MY_TRANSPOSE Transposes the matrix
result = zeros(size(arg, 2), size(arg, 1));
for row = 1 : size(result, 1)
    for col = 1 : size(result, 2)
        result(row, col) = arg(col, row);
    end
end
end

