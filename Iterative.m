function R = Iterative(nume, d, eps)
	% Functia care calculeaza matricea R folosind algoritmul iterativ.
	% Intrari:
	%	-> nume: numele fisierului din care se citeste;
	%	-> d: coeficentul d, adica probabilitatea ca un anumit navigator sa continue navigarea (0.85 in cele mai multe cazuri)
	%	-> eps: eroarea care apare in algoritm.
	% Iesiri:
	%	-> R: vectorul de PageRank-uri acordat pentru fiecare pagina.

    f = fopen(nume, "r");
    [A, N] = citire(f);
    
    K = zeros(N, N);  % matricea diagonala care contine suma pe linii
    % din matricea de adiacenta
    for i = 1:N
        K(i, i) = sum(A(i, :));  % face suma pe linii
    end

    M = (PR_Inv(K) * A)';

    AUX = zeros(N, 1);  % R de la momentul t
    R = zeros(N, 1) + 1/N;  % R de la momentul (t + 1)
    while norm(R - AUX) > eps
        AUX = R;
        R = d * M * AUX + ((1 - d)/N) * ones(N, 1);
    end
    R = AUX;

    fclose(f);
end