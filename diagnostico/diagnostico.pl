% Base de sintomas e doenças
% Cada doença é definida por sintomas específicos

% Definição de fatos (sintomas)
sintoma(febre).
sintoma(tosse).
sintoma(cansaco).
sintoma(dor_de_garganta).
sintoma(dor_muscular).
sintoma(dor_de_cabeca).

% Regras para determinar doenças
doenca(gripe) :- febre, tosse, cansaco.
doenca(infeccao_viral) :- febre, dor_de_garganta, dor_muscular.
doenca(enxaqueca) :- dor_de_cabeca, sensibilidade_a_luz, nauseas.

% Perguntas ao usuário sobre sintomas
% Este predicado será usado para interagir com o usuário
perguntar(Sintoma) :- 
    write('Voce esta sentindo '), write(Sintoma), write('? (sim/nao) '), 
    read(Resposta),
    Resposta == sim.

% Diagnóstico baseado nos sintomas fornecidos
diagnosticar :-
    write('Bem-vindo ao sistema de diagnostico medico!'), nl,
    write('Por favor, responda as perguntas a seguir com sim ou nao:'), nl,
    (   (perguntar(febre), assert(febre) ; true),
        (perguntar(tosse), assert(tosse) ; true),
        (perguntar(cansaco), assert(cansaco) ; true),
        (perguntar(dor_de_garganta), assert(dor_de_garganta) ; true),
        (perguntar(dor_muscular), assert(dor_muscular) ; true),
        (perguntar(dor_de_cabeca), assert(dor_de_cabeca) ; true),
        (perguntar(sensibilidade_a_luz), assert(sensibilidade_a_luz) ; true),
        (perguntar(nauseas), assert(nauseas) ; true)
    ),
    (   doenca(Doenca) -> 
        write('Com base nos sintomas informados, o diagnostico mais provavel e: '), 
        write(Doenca), nl;
        write('Nao foi possivel identificar uma condicao especifica.'), nl,
        write('Recomendamos consultar um medico para uma avaliacao mais detalhada.'), nl
    ).

% Iniciar o sistema
:- diagnosticar.
