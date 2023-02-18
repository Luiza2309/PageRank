function B = PR_Inv(A)
	% Functia care calculeaza inversa matricii A folosind factorizari Gram-Schmidt
	% Se afla descompunerea QR a matricei A folosind algoritmul
    % Gram-Schmidt modificat (laboratorul 3)
    % Pentru inversa: A * A^(-1) = In; A = Q * R
    % => R * A^(-1) = Q' (deoarece Q ortogonala => inversa lui Q e
    % transpusa lui)
    % se rezolva sistemul triunghiular R * A^(-1) = Q'

    [m, n] = size(A);
    Q = zeros(m, n);
    R = zeros(n);

    for i = 1:n
        R(i, i) = norm(A(:, i));
        Q(:, i) = A(:, i) ./ R(i, i);
        for j = (i + 1):n
            R(i,j) = Q(:,i)' * A(:,j);
            A(:, j) = A(:, j) - Q(:, i) * R(i, j);
        end  
    end
    disp(Q);
    disp(R);

    T = Q';
    B(n, :) = T(n, :) ./ R(n, n);  % valorile de pe ultimul rand din inversa sunt 
    % valorile de pe ultimul rand din Q transpus impartite la ultima valoare din R
    
    % se parcurg matricele in ordine inversa, afland valorile din B de la
    % stanga la dreapta, de jos in sus
    for i = (n - 1) : -1 : 1
        s = 0;
        for j = (i + 1) : n
            s = s + R(i, j) * B(j, :);
        end
        B(i, :) = (T(i, :) - s) / R(i, i);
    end
end
    