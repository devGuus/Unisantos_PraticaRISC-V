# Unisantos_PráticaRISC

## Dupla
- Gustavo Marcos Xavier  
- Leonardo De Almeida  

## Matéria
Arquitetura de Computadores  

## Professor
Walter

---

## Descrição do Projeto

Este projeto consiste na implementação de uma arquitetura RISC simplificada, desenvolvida como parte das atividades práticas da disciplina de Arquitetura de Computadores.

A estrutura do código está dividida em diversos módulos que representam componentes fundamentais de um processador, como a unidade lógica e aritmética (ALU), o caminho de dados (datapath), os registradores, a unidade de controle, somadores, multiplexadores e memórias.

Cada componente foi desenvolvido separadamente e interligado para simular o funcionamento de uma CPU básica.

---

## Estrutura de Diretórios

- `alu/`: Implementação da Unidade Lógica e Aritmética.
- `controle/`: Módulo de controle responsável pelo gerenciamento de sinais de controle.
- `datapath/`: Caminho de dados principal, interliga os módulos e executa as instruções.
- `imm/`: Módulo responsável pela geração de valores imediatos.
- `memorias/`: Contém os módulos de memória RAM e ROM.
- `muxes/`: Multiplexadores utilizados para seleção de dados.
- `pc/`: Contador de programa (Program Counter).
- `somadores/`: Somadores utilizados em cálculos aritméticos.
- `defs.vh`: Arquivo de definições com constantes e parâmetros usados em todo o projeto.
- `instructions.txt`: Arquivo de entrada com instruções que serão executadas pela CPU simulada.

---

## Funcionamento

O processador simulado executa instruções RISC escritas no formato definido no arquivo `instructions.txt`. As instruções são decodificadas, os dados manipulados pela ALU, e os resultados armazenados nas memórias ou registradores conforme especificado.

---

## Resultados Esperados

[INSERIR AQUI os testes realizados, os resultados esperados ao executar o processador, o que foi observado nas simulações ou ferramentas utilizadas (por exemplo: ModelSim, Vivado, etc.)]

---

## Como Executar

[INSERIR AQUI o passo a passo para compilar e rodar o projeto, incluindo ferramentas necessárias, simulação, compilação, etc.]

---

## Observações

[INSERIR QUAISQUER OBSERVAÇÕES ADICIONAIS RELEVANTES, como dificuldades, aprendizados ou futuras melhorias.]

