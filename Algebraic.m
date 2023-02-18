function R = Algebraic(nume, d)
	% Functia care calculeaza vectorul PageRank folosind varianta algebrica de calcul.
	% Intrari: 
	%	-> nume: numele fisierului in care se scrie;
	%	-> d: probabilitatea ca un anumit utilizator sa continue navigarea la o pagina urmatoare.
	% Iesiri:
	%	-> R: vectorul de PageRank-uri acordat pentru fiecare pagina.

    f = fopen(nume, "r");
    [A, N] = citire(f);
    
    x = zeros(N, 1) + (1 - d)/N;  % vectorul coloana
    L = zeros(N);  % matricea unde l(i, j) reprezinta raportul dintre 
    % nr de linkuri de la pagina i la pagina j si 
    % nr total de linkuri existente pe pagina i
    for i = 1:N
        for j = 1:N
            L(i, j) = A(i, j) / sum(A(i, :));
        end
    end

    R = PR_Inv(eye(N) - d * L') * x;
end