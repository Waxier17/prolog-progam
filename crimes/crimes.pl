% Base de fatos dinâmicos
:- dynamic impressao_digital/1.
:- dynamic motivo/1.
:- dynamic testemunha/1.
:- dynamic confirmada/1.
:- dynamic alibi_confirmado/1.
:- dynamic posse/1.
:- dynamic relacao/2.
:- dynamic ameaca_previa/1.
:- dynamic objeto_roubado/1.

% Regras de suspeitos e teorias
suspeito(jose) :- impressao_digital(lugar_crime), motivo(financeiro).
suspeito(maria) :- testemunha(vista_no_local), relacao(intima, vitima).
suspeito(carlos) :- motivo(revanche), posse(arma_do_crime).

teoria(crime_passional) :- relacao(intima, vitima), testemunha(visto_discutindo).
teoria(roubo) :- motivo(financeiro), objeto_roubado(valor_alto).
teoria(revanche_pessoal) :- motivo(revanche), ameaca_previa(denunciada).

recomendar(verificar_alibi, Suspeito) :- suspeito(Suspeito), \+ alibi_confirmado(Suspeito).
recomendar(investigar_evidencia, Evidencia) :- \+ confirmada(Evidencia).

% Perguntas ao usuário
perguntar_evidencia(Evidencia) :-
    write('A seguinte evidencia foi encontrada? '), write(Evidencia), write('? (sim/nao)'), nl,
    read(Resposta),
    (Resposta == sim -> assert(confirmada(Evidencia)), assert(Evidencia) ; true).

perguntar_testemunha(Testemunha) :-
    write('Uma testemunha relatou o seguinte: '), write(Testemunha), write('? (sim/nao)'), nl,
    read(Resposta),
    (Resposta == sim -> assert(testemunha(Testemunha)) ; true).

perguntar_motivo(Suspeito, Motivo) :-
    write('O suspeito '), write(Suspeito), write(' tem o seguinte motivo? '), write(Motivo), write('? (sim/nao)'), nl,
    read(Resposta),
    (Resposta == sim -> assert(motivo(Motivo)) ; true).

% Análise do caso
analisar :-
    write('Bem-vindo ao sistema de investigacao criminal!'), nl,
    write('Por favor, forneca as seguintes informacoes:'), nl,

    % Coleta de evidências
    perguntar_evidencia(impressao_digital(lugar_crime)),
    perguntar_evidencia(arma_do_crime),
    perguntar_evidencia(objeto_roubado(valor_alto)),

    % Coleta de testemunhos
    perguntar_testemunha(visto_discutindo),
    perguntar_testemunha(vista_no_local),

    % Análise de suspeitos
    (suspeito(Suspeito) ->
        write('Suspeito identificado: '), write(Suspeito), nl,
        (recomendar(verificar_alibi, Suspeito) ->
            write('Recomendamos verificar o alibi do suspeito: '), write(Suspeito), nl
        ;   true
        );
        write('Nao foi possivel identificar suspeitos com base nas evidencias fornecidas.'), nl
    ),

    % Análise de teorias
    (teoria(Teoria) ->
        write('Teoria mais provavel para o crime: '), write(Teoria), nl
    ;   write('Nao foi possivel determinar uma teoria clara para o crime.'), nl
    ),

    % Recomendações gerais
    (recomendar(investigar_evidencia, Evidencia) ->
        write('Recomendamos investigar a seguinte evidencia nao confirmada: '), write(Evidencia), nl
    ;   write('Todas as evidencias disponiveis foram analisadas.'), nl
    ).

% Iniciar o sistema
:- analisar.
