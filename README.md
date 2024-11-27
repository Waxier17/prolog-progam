Este guia descreve os passos para executar os sistemas especialistas desenvolvidos em Prolog, incluindo seus requisitos, instruções de configuração e exemplos de execução.

Desenvolvedor: Guilherme Andersen Correa

## Pré-requisitos

1.Instale o SWI-Prolog:
   - Baixe e instale o SWI-Prolog para seu sistema operacional no site oficial: [https://www.swi-prolog.org/Download.html](https://www.swi-prolog.org/Download.html).

2.Crie os Arquivos Prolog:
   - Salve cada sistema em um arquivo `.pl` separado com os respectivos nomes sugeridos:
     - Sistema 1: `diagnostico_medico.pl`
     - Sistema 2: `problemas_veiculo.pl`
     - Sistema 3: `recomendacao_livros.pl`
     - Sistema 4: `treinos_academia.pl`
     - Sistema 5: `investigacao_criminal.pl`

3.Abra o Terminal do SWI-Prolog:
   - Execute o SWI-Prolog no terminal (ou prompt de comando).
   - Navegue até o diretório onde os arquivos estão salvos utilizando o comando `cd('caminho/para/o/diretorio')`.


## Passos para Executar

### 1. Sistema de Diagnóstico Médico (`diagnostico_medico.pl`)

Descrição: Sugere diagnósticos médicos com base em sintomas fornecidos pelo usuário.

Como executar:
1. Carregue o arquivo no Prolog com o comando `[diagnostico_medico].`.
2. Inicie o sistema chamando o predicado `diagnostico.`.
3. Responda às perguntas sobre os sintomas com `sim` ou `nao`.

Exemplo de saída:

Você está com febre? (sim/nao)
|: sim
Você tem tosse? (sim/nao)
|: sim
Diagnóstico sugerido: gripe.


### 2. Sistema de Problemas em Veículos (`problemas_veiculo.pl`)

Descrição: Identifica problemas comuns em veículos com base nos sintomas relatados.

Como executar:
1. Carregue o arquivo no Prolog com o comando `[problemas_veiculo].`.
2. Inicie o sistema chamando o predicado `diagnosticar.`.
3. Responda às perguntas sobre o comportamento do veículo.

Exemplo de saída:

O motor não está ligando? (sim/nao)
|: sim
As luzes estão fracas? (sim/nao)
|: sim
Problema identificado: bateria fraca.


### 3. Sistema de Recomendações de Livros (`recomendacao_livros.pl`)

Descrição: Sugere livros com base em gêneros e interesses fornecidos pelo usuário.

Como executar:
1. Carregue o arquivo no Prolog com o comando `[recomendacao_livros].`.
2. Inicie o sistema chamando o predicado `recomendar_livro.`.
3. Responda às perguntas sobre seus gêneros e interesses.

Exemplo de saída:

Você gosta de ficção? (sim/nao)
|: sim
Você se interessa por política? (sim/nao)
|: sim
Livro recomendado: '1984' - Um clássico distópico que explora o autoritarismo.




### 4. Sistema de Recomendação de Treinos de Academia (`treinos_academia.pl`)

Descrição: Sugere treinos personalizados com base nos objetivos do usuário.

Como executar:
1. Carregue o arquivo no Prolog com o comando `[treinos_academia].`.
2. Inicie o sistema chamando o predicado `recomendar_treino.`.
3. Responda às perguntas sobre seu objetivo, experiência e disponibilidade.

Exemplo de saída:

Qual é o seu objetivo? (emagrecer/ganhar_massa/condicionamento)
|: ganhar_massa
Você é iniciante na academia? (sim/nao)
|: nao
Recomendação de treino: Treino de hipertrofia - 3 séries de 10 repetições de supino.


### 5. Sistema de Investigação Criminal (`investigacao_criminal.pl`)

**Descrição**: Auxilia na análise de casos criminais com base em evidências e testemunhos fornecidos.

Como executar:
1. Carregue o arquivo no Prolog com o comando `[investigacao_criminal].`.
2. Inicie o sistema chamando o predicado `analisar.`.
3. Responda às perguntas sobre evidências e testemunhos.

Exemplo de saída:
A seguinte evidência foi encontrada? impressao_digital(lugar_crime)? (sim/nao)
|: sim
Uma testemunha relatou o seguinte: visto_discutindo? (sim/nao)
|: sim
Suspeito identificado: jose.
Teoria mais provável: crime passional.

## Resolução de Problemas

- Erro de Procedimento Desconhecido:
  - Verifique se o predicado foi declarado como dinâmico (`:- dynamic`).
  - Certifique-se de que os fatos necessários foram definidos ou registrados dinamicamente.

- Arquivo Não Encontrado:
  - Confirme o caminho correto do arquivo.
  - Use o comando `cd('caminho')` no terminal do SWI-Prolog.

- Comportamento Inesperado:
  - Verifique se você respondeu corretamente às perguntas do sistema.
  - Certifique-se de que o arquivo carregado está atualizado.



## Observações

- Documente suas interações com prints ou logs das execuções para submissão.
- Caso precise de assistência ou ajustes no código, sinta-se à vontade para entrar em contato!
