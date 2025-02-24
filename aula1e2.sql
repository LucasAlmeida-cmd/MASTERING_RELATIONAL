//OBRIGATORIO PARA FUNCIONAMENTO

set serveroutput on; -- habilita o servidor de saída de dados
 
set VERIFY off; -- desabilita a verificação da vm


//Aula 1 - 

declare
	vl_reais numeric(10,2) := 45;
	vl_dolar vl_reais%type := 5.80;
begin
	dbms_output.put_line('Dólar: ' || vl_reais * vl_dolar);

end;
	


declare
	valorDeCompra numeric(20,5) := &entrada;
begin
	dbms_output.put_line('Valor a pagar por mês: ' || (valorDeCompra * 1.03) / 10);
end;
	


declare
	valorDeCompra numeric(20,5) := &entrada;
begin
	dbms_output.put_line('Valor a pagar por mês em 6 : ' || (valorDeCompra * 1.10) / 6);
	dbms_output.put_line('Valor a pagar por mês em 12: ' || (valorDeCompra * 1.15) / 10);
	dbms_output.put_line('Valor a pagar por mês em 18: ' || (valorDeCompra * 1.20) / 18);
end;

//Aula 2

DECLARE
    V_N NUMBER(2):= &ENTRADA;
BEGIN 
    IF MOD(V_N, 2 ) = 0 THEN 
    dbms_output.put_line('O número: ' || V_N || ' é PAR');
    else
    dbms_output.put_line('O número: ' || V_N || ' é IMPAR');
    END IF;
END;
    
    
DECLARE 
    V_SEXO CHAR(1) := '&ENTRADA';
BEGIN 
    IF V_SEXO = 'F' or V_SEXO = 'f' THEN
        dbms_output.put_line('Feminio');
    ELSIF V_SEXO = 'M' or V_SEXO = 'm' then 
        dbms_output.put_line('Masculino');
    else 
         dbms_output.put_line('Não encontrado');
    end if;
end;


DECLARE 
    V_SEXO CHAR(1) := upper('&ENTRADA');
BEGIN 
    IF V_SEXO = 'F'  THEN
        dbms_output.put_line('Feminio');
    ELSIF V_SEXO = 'M' then 
        dbms_output.put_line('Masculino');
    else 
         dbms_output.put_line('Não encontrado');
    end if;
end;


declare
	valorDeCompra numeric(20,5) := &entrada;
    parcelarDeCompra numeric(2) := &entrada2;
begin
    valorDeCompra := valorDeCompra * 0.8;
    if parcelardecompra = 6 then
        dbms_output.put_line('Valor a pagar por mês em 6 : ' || (valorDeCompra * 1.10) / 6);
	ELSIF parcelardecompra = 12 then
        dbms_output.put_line('Valor a pagar por mês em 12: ' || (valorDeCompra * 1.15) / 10);
    elsif parcelardecompra = 18 then
        dbms_output.put_line('Valor a pagar por mês em 18: ' || (valorDeCompra * 1.20) / 18);
    else 
        dbms_output.put_line('Valor invalido.');
    end if;
end;



declare
	notaAluno numeric(2) := &entrada;
begin 
    if notaAluno >= 9 and notaAluno <= 10 then 
        dbms_output.put_line('Aprovado com Distinção');
    elsif notaAluno >= 7 and notaAluno < 9 then 
        dbms_output.put_line('Aprovado');
    elsif notaAluno >= 5 and notaAluno < 7 then 
        dbms_output.put_line('Recuperação');
    elsif notaAluno < 5 then 
        dbms_output.put_line('Reprovado');
    end if;
end;