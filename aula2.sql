//Aula 3 

set serveroutput on; -- habilita o servidor de saída de dados
 
set VERIFY off; -- desabilita a verificação da vm


CREATE TABLE ALUNO(
    RA CHAR(2),
    NOME VARCHAR2(50),
    CONSTRAINT ALUNO_PK PRIMARY KEY(RA)
);

insert into aluno (ra, nome) values ('11', 'Lucas Almeida');
insert into aluno (ra, nome) values ('22', 'Victor Cosme');
insert into aluno (ra, nome) values ('33', 'Arthur Pulini');



//PUXANDO ALUNOS EXISTENTES COM SELECT
declare
    v_ra char(9) := '11';
    v_nome varchar2(50);
begin 
    select nome into v_nome from aluno where ra = v_ra;
    dbms_output.put_line(v_nome);
end;


//INSERINDO ALUNO COM INSERT
declare
    v_ra char(2) := '44';
    v_nome varchar2(50):= 'Daniele Torneles';
begin 
    INSERT INTO ALUNO (RA,NOME) VALUES (v_ra, v_nome);
end;


//ATUALIZANDO NOME DE ALUNO PELO RA
declare
    v_ra CHAR(2) := '44';
    v_nome VARCHAR2(50) := 'Antonio Rodrigues';
begin
    update aluno set nome = v_nome where ra = v_ra;
end;


//DELETANDO ALUNO 
declare
    v_ra char(2) := '44';
begin 
    DELETE FROM ALUNO WHERE RA = V_RA;
end;


//EXERCICIO AULA 



CREATE TABLE TB_FACULDADE(
    RM CHAR(2),
    RM_DISC VARCHAR2(20),
    CP1 NUMBER(4,2),
    CP2 NUMBER(4,2),
    CP3 NUMBER(4,2),
    MEDIA NUMBER(4,2),
    SITUACAO VARCHAR2(10),
    CONSTRAINT RM_PK PRIMARY KEY(RM)
)

drop table TB_FACULDADE;


BEGIN 
    INSERT INTO tb_faculdade (RM, RM_DISC, CP1, CP2, CP3) VALUES ('1', 'BD', 10, 10, 10);
    INSERT INTO tb_faculdade (RM, RM_DISC, CP1, CP2, CP3) VALUES ('2', 'IA', 7.6, 8.2, 10);
    INSERT INTO tb_faculdade (RM, RM_DISC, CP1, CP2, CP3) VALUES ('3', 'Front', 4.1, 2.2, 1.4);
    INSERT INTO tb_faculdade (RM, RM_DISC, CP1, CP2, CP3) VALUES ('4', 'Java', 5, 5, 5);
END;



declare
    v_rm char(2) := '4';
    v_cp1 NUMBER(4,2);
    v_cp2 v_cp1%TYPE;
    v_cp3 v_cp1%TYPE;
    v_total v_cp1%TYPE;
    v_media NUMBER(4,2);
begin 
    select cp1,cp2,cp3 into v_cp1,v_cp2,v_cp3 from TB_FACULDADE where rm = v_rm;
    v_total := v_cp1 + v_cp2 + v_cp3;
    v_media := (v_cp1 + v_cp2 + v_cp3)/3;
    
    update tb_faculdade set MEDIA = v_media where rm = v_rm;
    
    if v_media >= 7.0 then
         update tb_faculdade set SITUACAO = 'APROVADO' where rm = v_rm;
    ELSIF v_media >= 5.0 AND v_media <= 6.9 then
        update tb_faculdade set SITUACAO = 'EXAME' where rm = v_rm;
    ELSIF v_media <= 4.9 then
        update tb_faculdade set SITUACAO = 'REP' where rm = v_rm;
    END IF;
end;


//adicionando cargar horario e faltas para reprovação do aluno 
alter table tb_faculdade add carga_horaria number(3);
alter table tb_faculdade add faltas number(3);

begin 
    update tb_faculdade set carga_horaria = 160 where rm = 1;
    update tb_faculdade set carga_horaria = 80 where rm = 2;
    update tb_faculdade set carga_horaria = 160 where rm = 3;
    update tb_faculdade set carga_horaria = 80 where rm = 4;
end;

begin 
    update tb_faculdade set faltas = 10 where rm = 1;
    update tb_faculdade set faltas = 100 where rm = 2;
    update tb_faculdade set faltas = 80 where rm = 3;
    update tb_faculdade set faltas = 20 where rm = 4;
end;

declare
    v_rm char(2) := '1';
    v_cp1 NUMBER(4,2);
    v_cp2 v_cp1%TYPE;
    v_cp3 v_cp1%TYPE;
    v_total v_cp1%TYPE;
    v_media NUMBER(4,2);
    v_calculo_faltas number(3);
begin 
    select cp1,cp2,cp3,faltas,carga_horaria into v_cp1,v_cp2,v_cp3,v_falta,v_carga_horaria from TB_FACULDADE where rm = v_rm;
    v_total := v_cp1 + v_cp2 + v_cp3;
    v_media := (v_cp1 + v_cp2 + v_cp3)/3;
    
    v_calculo_faltas := (faltas / carga_horaria) * 100;
    
    update tb_faculdade set MEDIA = v_media where rm = v_rm;
    if v_calculo_faltas <= 25 then 
        if v_media >= 7.0  then
             update tb_faculdade set SITUACAO = 'APROVADO' where rm = v_rm;
        ELSIF v_media >= 5.0 AND v_media <= 6.9 then
            update tb_faculdade set SITUACAO = 'EXAME' where rm = v_rm;
        ELSIF v_media <= 4.9 then
            update tb_faculdade set SITUACAO = 'REP' where rm = v_rm;
        END IF;
    else 
        update tb_faculdade set SITUACAO = 'REP' where rm = v_rm;
    end if;
end;


select * from tb_faculdade;


