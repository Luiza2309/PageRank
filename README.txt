FUNCTIA citire.m

- citeste marimea matricei
- intr-o bucla repetitiva citeste linie cu linie din fisier, sarind peste:
	- valoarea nodului (aceasta este egala cu i, deci nu am nevoie de ea)
	- numarul de noduri care urmeaza (cunosc deja numarul deoarece stochez nodurile intr-un vector si parcurg vectorul)
- nodurile care vor fi legate cu nodul curent sunt stocate intr-un vector
- parcurg vectorul, iar daca nodul curent este diferit de nodul din vector se adauga 1 (se evita astfel link de la o pagina catre ea insasi)
- se citesc val1 si val2 si se convertesc in numere


FUNCTIA Iterative.m

- se deschide fisierul si se stocheaza in A si N matricea de adiacenta, respectiv marimea matricei
- se implementeaza algoritmul descris la https://en.wikipedia.org/wiki/PageRank#Iterative
- se creeaza matricea diagonala => K(i, i) = suma de pe linia i din matricea de adiacenta; in rest 0
- M este transpusa matricei obtinuta din produsul dintre inversa lui K si matricea de adiacenta
- intr-o bucla repetitiva se calculeaza PageRank-ul curent, actualizandu-se PageRank-ul anterior
- bucla se opreste atunci cand norma diferentei dintre PageRank-ul curent si PageRank-ul anterior este mai mica sau egala cu eroarea data


FUNCTIA Algebraic.m

- se implementeaza algoritmul descris la https://en.wikipedia.org/wiki/PageRank#Damping_factor
- se calculeaza matricea L unde L(i, j) reprezinta raportul dintre nr de linkuri de la pagina i la pagina j si nr total de linkuri existente pe pagina i
- se calculeaza PageRank-ul folosind formula R = x + d * L * R
	- R - d * L * R = x
	- (In - d * L) * R = x
	- R = (In - d * L) * x


FUNCTIA Apartenenta.m

- ls(val1) = 0; ld(val1) = a * val1 + b
- ls(val2) = a * val2 + b; ld(val2) = 1
- functia u(x) este continua => ls(val1) = ld(val1); ls(val2) = ld(val2)
- se rezolva sistemul si rezulta a si b
- y ia valorile indicate de functia u(x) si de conditia ca x apartine sau nu intervalului


FUNCTIA PR_Inv.m

- este implementat algoritmul Gram-Schmidt descris in laboratorul 3
- se obtine astfel descompunerea matricei A in QR
- inversa se obtine prin rezolarea sistemului triunghiular R * A^(-1) = Q'
- exemplu pentru matrice de 3x3:

r11  r12  r13     a  b  c     q11  q12  q13
 0   r22  r23  *  d  e  f  =  q21  q22  q23
 0    0   r33     g  h  i     q31  q32  q33

unde rij sunt elementele din R; a,..., i sunt elementele inversei; qij sunt elementele din Q

Se vor forma sisteme, incepand de jos in sus. Astfel, primul sistem este:
r33 * g = q31
r33 * h = q32
r33 * i = q33

S-au aflat astfel valorile de pe ultima linie a inversei.
Pentru urmatoarele n-1 linii se inmultesc matricele R si A^(-1), obtinandu-se sisteme in care se cunosc rij, qij si elementele anterioare din A^(-1).


FUNCTIA PageRank.m

- se deschide fisierul de output si se scrie in el:
	- marimea matricei
	- vectorul R1 calculat prin metoda iterativa
	- vectorul R2 calculat prin metoda algebrica

- in matricea R3 se adauga o coloana care contine numarul liniei si vectorul R2 pe a doua coloana
- se sorteaza matricea R3
- intr-o bucla repetitiva:
	- se calculeaza "a" care reprezinta valoarea functiei u(x) pentru fiecare valoare din R2
	- se afiseaza: "i" care este numarul liniei; R3(i, 1) care reprezinta pozitia in vectorul R2 si a