:-dynamic(fornecido/1), [interpretador].

% a)
se comp_portatil e sexo_masc entao tecnologico:0.75.
se sexo_femi e sem_filhos entao romantico:1.
se natal e tit_codigo ou tit_vinci entao policial:0.8.
se natal ou sexo_femi entao poema:0.2.
se romantico ou poema entao literario:0.9.

% b)
fornecido(natal:1).
fornecido(comp_portatil:1.0).
fornecido(sem_filhos:1.0).
fornecido(sexo_masc:0.5).
fornecido(sexo_femi:0.5).

% c) certeza(literario, R).