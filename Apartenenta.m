function y = Apartenenta(x, val1, val2)
	% Functia care primeste ca parametrii x, val1, val2 si care calculeaza valoarea functiei membru in punctul x.
	% Stim ca 0 <= x <= 1

    % ls(val1) = 0; ld(val1) = a * val1 + b
    % ls(val2) = a * val2 + b; ld(val2) = 1
    % functia este continua => ls(val1) = ld(val1); ls(val2) = ld(val2)
    
    a = 1 / (val2 - val1);
    b = val1 / (val1 - val2);

    if x < val1
        y = 0;
    end

    if all(x >= val1 & x <= val2)
        y = x * a + b;
    end

    if x > val2
        y = 1;
    end
