% Base de dados de livros
% Cada livro é categorizado por gênero e associado a um tópico de interesse

% Definicao dos livros com genero e interesses
livro('1984', ficcao, politica, 'Um romance distopico que explora temas de totalitarismo e vigilancia.').
livro('Sapiens', historia, ciencia, 'Uma narrativa fascinante sobre a historia da humanidade, desde a pre-historia ate os dias atuais.').
livro('O Pequeno Principe', ficcao, filosofia, 'Uma obra classica que aborda temas universais como amizade, amor e perda.').
livro('Como Fazer Amigos e Influenciar Pessoas', autoajuda, relacoes, 'Um guia pratico para melhorar habilidades sociais e construir relacionamentos.').
livro('A Origem das Especies', ciencia, evolucao, 'A obra fundamental de Charles Darwin que introduziu a teoria da evolucao por selecao natural.').

% Regras para recomendar livros com base no genero e interesse
recomendar(Titulo, Genero, Interesse) :-
    livro(Titulo, Genero, Interesse, Sinopse),
    write('Recomendamos o seguinte livro: '), nl,
    write('Titulo: '), write(Titulo), nl,
    write('Genero: '), write(Genero), nl,
    write('Interesse: '), write(Interesse), nl,
    write('Sinopse: '), write(Sinopse), nl.

% Perguntas ao usuario sobre generos e interesses
perguntar_genero(Genero) :-
    write('Qual genero de livro voce prefere? (ficcao/historia/ciencia/autoajuda)'), nl,
    read(Genero).

perguntar_interesse(Interesse) :-
    write('Qual e o seu topico de interesse? (politica/ciencia/filosofia/relacoes/evolucao)'), nl,
    read(Interesse).

% Diagnostico baseado nas respostas do usuario
diagnosticar :-
    write('Bem-vindo ao sistema de recomendacao de livros!'), nl,
    perguntar_genero(Genero),
    perguntar_interesse(Interesse),
    (   recomendar(_, Genero, Interesse) ->
        true;
        write('Nao encontramos livros para a combinacao de genero e interesse fornecidos.'), nl,
        write('Tente novamente com outras preferencias.'), nl
    ).

% Iniciar o sistema
:- diagnosticar.
