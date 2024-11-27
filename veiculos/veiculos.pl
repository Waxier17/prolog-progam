% Base de sintomas e problemas
% Definicao de sintomas comuns em veiculos
sintoma(motor_nao_liga).
sintoma(luzes_fracas).
sintoma(barulho_ao_frear).
sintoma(pedal_freio_macio).
sintoma(vazamento_oleo).
sintoma(fumaca_no_motor).

% Regras para diagnosticar problemas com base nos sintomas
problema(bateria_fraca) :- motor_nao_liga, luzes_fracas.
problema(freio_desgastado) :- barulho_ao_frear, pedal_freio_macio.
problema(vazamento_motor) :- vazamento_oleo, fumaca_no_motor.
problema(falta_oleo) :- vazamento_oleo.

% Regras de seguranca
grave(vazamento_motor).
grave(freio_desgastado).

% Perguntas ao usuario para verificar sintomas
perguntar(Sintoma) :-
    write('O veiculo apresenta o seguinte problema: '), write(Sintoma), write('? (sim/nao) '),
    read(Resposta),
    Resposta == sim.

% Diagnostico baseado nos sintomas fornecidos
diagnosticar :-
    write('Bem-vindo ao sistema de analise de problemas de veiculos!'), nl,
    write('Responda as perguntas a seguir com sim ou nao:'), nl,
    (   (perguntar(motor_nao_liga), assert(motor_nao_liga) ; true),
        (perguntar(luzes_fracas), assert(luzes_fracas) ; true),
        (perguntar(barulho_ao_frear), assert(barulho_ao_frear) ; true),
        (perguntar(pedal_freio_macio), assert(pedal_freio_macio) ; true),
        (perguntar(vazamento_oleo), assert(vazamento_oleo) ; true),
        (perguntar(fumaca_no_motor), assert(fumaca_no_motor) ; true)
    ),
    (   problema(Problema) ->
        write('O problema identificado e: '), write(Problema), nl,
        (   grave(Problema) ->
            write('Este e um problema grave. Recomendamos levar o veiculo a um mecanico imediatamente.'), nl;
            write('Recomendacoes: Verifique o problema e, se necessario, leve o veiculo a um mecanico.'), nl
        );
        write('Nao foi possivel identificar o problema com base nos sintomas fornecidos.'), nl,
        write('Sugerimos levar o veiculo a um mecanico para uma analise detalhada.'), nl
    ).

% Iniciar o sistema
:- diagnosticar.
