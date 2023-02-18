function [R1, R2] = PageRank(nume, d, eps)
	% Calculeaza indicii PageRank pentru cele 3 cerinte
	% Scrie fisierul de iesire nume.out

    R1 = Iterative(nume, d, eps);
    R2 = Algebraic(nume, d);
    
    fout = fopen(strcat(nume, ".out"), "w");

    fprintf(fout, "%d\n", size(R1, 1));
    fprintf(fout, "%0.6f\n", R1);
    fprintf(fout, "\n");
    fprintf(fout, "%0.6f\n", R2);
    fprintf(fout, "\n");

    f = fopen(nume, "r");
    [~, N, val1, val2] = citire(f);

    AUX = (1:N)';
    R3 = [AUX R2];  % adaug coloana cu numerotarea
    R3 = sortrows(R3, 2, "descend");

    for i = 1:N
        a = Apartenenta(R3(i, 2), val1, val2);
        fprintf(fout, "%d %d %f\n", i, R3(i, 1), a);
        % afiseaza indicele la care a ajuns, pozitia valorii in vector si
        % valoarea returnata de functia u(x)
    end
    
    fclose(fout);
