% Base de treinos e exercícios
% Cada treino é associado a um objetivo, nível de experiência e disponibilidade de tempo
treino('Hipertrofia', ['Supino Reto - 4x10', 'Agachamento Livre - 4x12', 'Rosca Direta - 3x10']) :-
    objetivo(ganhar_massa), experiencia(intermediario), disponibilidade(tempo_disponivel).
treino('Perda de Peso', ['Burpees - 3x20', 'Corrida na Esteira - 20 minutos', 'Abdominais - 4x15']) :-
    objetivo(emagrecer), experiencia(basico), disponibilidade(tempo_limitado).
treino('Condicionamento Físico', ['Circuito Funcional - 3 rodadas', 'Pular Corda - 10 minutos', 'Prancha Isométrica - 3x1 minuto']) :-
    objetivo(condicionamento), experiencia(intermediario), disponibilidade(tempo_moderado).

% Perguntas ao usuário sobre o objetivo, experiência e disponibilidade
perguntar_objetivo(Objetivo) :-
    write('Qual o seu objetivo? (ganhar_massa/emagrecer/condicionamento)'), nl,
    read(Objetivo),
    assert(objetivo(Objetivo)).

perguntar_experiencia(Experiencia) :-
    write('Qual o seu nivel de experiencia na academia? (basico/intermediario/avancado)'), nl,
    read(Experiencia),
    assert(experiencia(Experiencia)).

perguntar_disponibilidade(Tempo) :-
    write('Quanto tempo voce tem disponivel por dia? (tempo_limitado/tempo_moderado/tempo_disponivel)'), nl,
    read(Tempo),
    assert(disponibilidade(Tempo)).

% Recomendação de treino com base nas respostas
recomendar :-
    write('Bem-vindo ao sistema de recomendacao de treinos!'), nl,
    perguntar_objetivo(Objetivo),
    perguntar_experiencia(Experiencia),
    perguntar_disponibilidade(Tempo),
    (   treino(Treino, Exercicios) ->
        write('Recomendamos o seguinte treino: '), nl,
        write('Treino: '), write(Treino), nl,
        write('Exercicios: '), nl,
        listar_exercicios(Exercicios);
        write('Nao foi possivel encontrar um treino que atenda aos criterios fornecidos. Tente novamente com outras informacoes.'), nl
    ).

% Função auxiliar para listar os exercícios do treino
listar_exercicios([]).
listar_exercicios([Exercicio | Resto]) :-
    write('- '), write(Exercicio), nl,
    listar_exercicios(Resto).

% Iniciar o sistema
:- recomendar.
