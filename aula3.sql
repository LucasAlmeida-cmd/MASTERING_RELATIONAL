//Aula 3


set serveroutput on; 
 
set VERIFY off; 

//Primeiro tipo de laço de repetição
//Loop
//Primeiro sem o loop depois a contição

declare 
    v_contador number(2) := 1;
begin
loop 
    dbms_output.put_line(v_contador);
    v_contador := v_contador + 1;
    exit when v_contador > 20;
end loop;
end; 

//WHILE
//Primeiro vem a condição depois o loop

declare 
v_contador number(2) :=1 ;
begin 
while v_contador <= 20 loop 
    dbms_output.put_line(v_contador);
    v_contador := v_contador + 1;
end loop;
end;

//FOR
//Melhor loop para usar com numeros inteiros;

begin 
for v_contador in 1..20 loop
    dbms_output.put_line(v_contador);
end loop;
end;



//Reverse
begin 
for v_contador in reverse 1..20 loop
    dbms_output.put_line(v_contador);
end loop;
end;


//Exercicio 1 

declare 
    v_numero numeric(3) := &entrada;
begin 
for v_contador in 0..10 loop
    dbms_output.put_line( v_numero || ' X ' || v_contador || ' = ' || v_numero * v_contador);
end loop;
end;
    
    
//Exercicio 2 

declare
    v_primeiro_numero number(2):= &primeiro_numero;
    v_segundo_numero number(2):= &segundo_numero;
    v_contador_par number(3):=0;
    v_contador_impar number(3):=0;
begin
for v_contador in v_primeiro_numero..v_segundo_numero loop
    if mod(v_contador, 2) = 0 then
        v_contador_par := v_contador_par + 1;
    else
        v_contador_impar := v_contador_impar + 1;
    end if;
end loop;
dbms_output.put_line('numero pares '|| v_contador_par);
dbms_output.put_line('numero impares '|| v_contador_impar);
end;






