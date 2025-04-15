set serveroutput on; 
 
set VERIFY off; 


//ex 1 


declare 
    salario number(10,2) := 1500.00;
begin
    dbms_output.put_line('O valor do salário é de: ' || salario * 1.25);
end;

//ex 2 

declare 
    Vreal number (4,2) := 45.00;
    Vdolar Vreal%type := 5.74 ;
begin
    dbms_output.put_line('Valor em Reais: ' || Vreal);
    dbms_output.put_line('Valor em Dolar: ' || Vreal * Vdolar);
end;


// ex 3 

declare 
    valorCompra number(10,2) := &entrada;
begin 
    dbms_output.put_line('O valor de cada parcela com 3% no montante é: ' || (valorCompra * 1.03) / 10);
end;









// ex 4 

declare 
    vEntrada number(10,2) := &entrada;
    vValorFixo vEntrada%type := 10000;
begin
    dbms_output.put_line('Entrada de 20% no valor definido pelo cliente: ' || vEntrada * 0.2);

    
    dbms_output.put_line('Parcelas Entrada Cliente: ');
    dbms_output.put_line('Pagamento em 6x : ' || 'R$ '||(vEntrada * 0.8) * 1.10);
    dbms_output.put_line('Pagamento em 12x : ' ||'R$ '||(vEntrada * 0.8) * 1.15);
    dbms_output.put_line('Pagamento em 18x : ' ||'R$ '||(vEntrada * 0.8) * 1.20);
    
    dbms_output.put_line('Parcelas Entrada FIXA: ');    
    dbms_output.put_line('Pagamento em 6x : ' || 'R$ '||(vValorFixo * 0.8) * 1.10);
    dbms_output.put_line('Pagamento em 12x : ' ||'R$ '||(vValorFixo * 0.8) * 1.15);
    dbms_output.put_line('Pagamento em 18x : ' ||'R$ '||(vValorFixo * 0.8) * 1.20);
    

end;


// EX 5

Declare
    entradaSexo char(1) := lower('&entrada');
begin
    if entradaSexo = 'f' then 
        dbms_output.put_line('Feminino');
    ELSIF entradaSexo = 'm' then
        dbms_output.put_line('Masculino');
    ELSE 
        dbms_output.put_line('Outros');
    end if;
end;

// ex 6

CREATE TABLE ALUNO(
    RA CHAR(2),
    NOME VARCHAR(19),
    IDADE NUMBER (2)
);

delete from aluno where nome = 'Vitoria';
select * from aluno;

INSERT INTO ALUNO VALUES (1, 'Lucas', 22);
INSERT INTO ALUNO VALUES (2, 'Milena', 23);
INSERT INTO ALUNO VALUES (3, 'Vitoria', 19);

declare 
    valorRA char(2) := &ENTRADA;
    nomeAluno varchar(19);
begin 
    select nome INTO nomeAluno from aluno where ra = valorRA;
    dbms_output.put_line('Nome do aluno com o RA informado: ' || nomeAluno);
end;


declare 
    nome varchar(19) := '&entrada';
    idade number(2) := &entrada;
begin
    insert into aluno (ra, nome, idade) values (4, nome, idade);
end;


declare
    v_ra number(2) := &entrada;
    v_nome varchar(19) := '&entrada';
begin 
    update aluno set nome = v_nome where ra = v_ra;
end;








// ex6 
//tabuada

declare 
    numero number(3) := &entrada;
    cont number(2) := 0;
begin 
    loop 
        dbms_output.put_line(numero ||' X '|| cont||' = ' || numero * cont); 
        cont := cont + 1;
        exit when cont > 10;
    end loop;
end;
    
    
    
//while
declare 
    numero number(3) := &entrada;
    cont number(2) := 0;
begin 
    while cont <= 10 loop
        dbms_output.put_line(numero ||' X '|| cont||' = ' || numero * cont);
        cont := cont + 1;
    end loop;
end;

//for 

declare 
    numero number(3) := &entrada;
    cont number(2) := 0;
begin 
    for cont in 1..10 loop
        dbms_output.put_line(numero ||' X '|| cont||' = ' || numero * cont);
    end loop;
end;


//ex 7


//loop
declare 
    numInicial number(4) := &entrada;
    numFinal number(4) := &entrada;
begin 
    loop 
        if mod(numInicial, 2) = 0 then
            dbms_output.put_line(numInicial || ' é par.');
        else 
            dbms_output.put_line(numInicial || ' é impar.');
        end if;
        numInicial := numInicial + 1;
        exit when numInicial = numFinal;
    end loop;
end;


//while 
declare 
    numInicial number(4) := &entrada;
    numFinal number(4) := &entrada;
begin 
    while numInicial < numFinal loop
        if mod(numInicial, 2) = 0 then
                dbms_output.put_line(numInicial || ' é par.');
            else 
                dbms_output.put_line(numInicial || ' é impar.');
            end if;
          numInicial := numInicial + 1;
    end loop;
end;
        
    
//for 

declare 
    numInicial number(4) := &entrada;
    numFinal number(4) := &entrada;
begin 
    for i in numInicial..numFinal loop
        if mod(i, 2) = 0 then
                dbms_output.put_line(i || ' é par.');
            else 
                dbms_output.put_line(i || ' é impar.');
            end if;
    end loop;
end;


//ex 8

declare 
    numInicial number(10) := &entrada;
    numFinal numInicial%type := &entrada;
    contPar numInicial%type := 0;
    contImpar numInicial%type := 0;
    cont numInicial%type := 0;
begin
    while numInicial <= numFinal loop 
        if mod(numInicial , 2) = 0 then
            contPar := contPar + numInicial;
            numInicial := numInicial + 1;
            cont := cont + 1;
        else
            contImpar := contImpar + numInicial;
            numInicial := numInicial + 1;
        end if;
    end loop;
    IF cont > 0 THEN
        dbms_output.put_line('Média dos pares: ' || contPar / cont);
    ELSE
        dbms_output.put_line('Nenhum número par encontrado no intervalo.');
    END IF;
    dbms_output.put_line('Soma dos impares: ' || contImpar);
end;



