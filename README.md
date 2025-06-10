# RISC-V de Ciclo Único
> Atividade Prática feita na Universidade Católica de Santos

### **Dupla** 🤝🏼
*- Gustavo Marcos Xavier*  
*- Leonardo De Almeida*  

### **Matéria**📖
*Arquitetura de Computadores*  

### **Professor** 👨🏻‍🏫
*Walter*

---

## Descrição do Projeto 🧾

Este projeto consiste na implementação de uma arquitetura RISC simplificada, desenvolvida como parte das atividades práticas da disciplina de Arquitetura de Computadores.

A estrutura do código está dividida em diversos módulos que representam componentes fundamentais de um processador, como a unidade lógica e aritmética (ALU), o caminho de dados (datapath), os registradores, a unidade de controle, somadores, multiplexadores e memórias.

Cada componente foi desenvolvido separadamente e interligado para simular o funcionamento de uma CPU básica.

---

## Estrutura de Diretórios 📂

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

## Funcionamento ⚙️

O processador simulado executa instruções RISC escritas no formato definido no arquivo `instructions.txt`. As instruções são decodificadas, os dados manipulados pela ALU, e os resultados armazenados nas memórias ou registradores conforme especificado.

---

## Resultados Esperados ✅

O projeto cumpriu seu objetivo de construir uma CPU baseada na arquitetura RISC-V de ciclo único, capaz de executar corretamente instruções fundamentais. Todos os testes foram validados com sucesso via simulação, garantindo integridade nos sinais de controle e no fluxo de dados entre os módulos.

---

## Como Executar

Antes de iniciar, certifique-se de ter as seguintes ferramentas instaladas em seu ambiente:

* Icarus Verilog – para compilação e simulação de código Verilog

* GTKWave – para visualização das ondas geradas pela simulação

* Editor de texto ou IDE (ex: VS Code) – para editar os arquivos .v e .vh

---

1. Abra o terminal na pasta raiz do projeto.
2. Compile os arquivos Verilog com o Icarus Verilog:

```bash
iverilog -o simulacao.out testbench.v
```
> Certifique-se de que testbench.v inclua (via include) todos os módulos necessários e arquivos auxiliares como defs.vh.
3. Execute a simulação e gere o arquivo de ondas (VCD):

```bash
vvp simulacao.out
```

4. Abra o GTKWave para analisar os sinais:

```bash
gtkwave dump.vcd
```
> O nome do arquivo VCD pode variar (por padrão: dump.vcd, conforme definido no testbench). Verifique isso no seu testbench.v.

---

## Observações

Durante a simulação, você pode observar sinais como alu_result, pc, write_data, mem_data e RegWrite para verificar o comportamento correto da execução das instruções.

