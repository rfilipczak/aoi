function result = my_complex_conj_transpose(arg)
%MY_COMPLEX_CONJ_TRANSPOSE Transposes the matrix and negates imaginary part
result = complex(zeros(size(arg, 2), size(arg, 1)));
for row = 1 : size(result, 1)
    for col = 1 : size(result, 2)
        result(row, col) = complex(real(arg(col, row)), (-1) * imag(arg(col, row)));
    end
end
end

