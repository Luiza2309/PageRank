function [A, N, val1, val2] = citire(f)
    % functia care citeste din fisier si creeaza matricea de adiacenta
    
    N = fscanf(f, "%d", 1);
    fscanf(f, "%c", 1);  % sare peste \n
    A = zeros(N);
    i = 1;

    while i <= N
        fscanf(f, "%d", 1);  % sare peste primul nod; i contine deja nr nodului
        fscanf(f, "%d", 1);  % sare peste numarul de noduri cu care va fi legat
        nod = fgetl(f);  % citeste nodurile cu care va fi legat primul nod
                         % si le pune intr-un vector
        vecini = str2num(nod);  % converteste vectorul in numere
        for j = vecini  % parcurge vectorul
            if(i ~= j)  % daca indicii nu sunt egali pune 1
                A(i, j) = 1;
            end
        end

        i = i + 1;
    end

    val1 = fgetl(f);
    val1 = str2num(val1);
    val2 = fgetl(f);
    val2 = str2num(val2);
end