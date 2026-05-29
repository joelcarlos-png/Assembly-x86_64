# Assembly x86_64 (Linux Syscalls)

[English version](README.md)

Este repositório foi criado por **Joel Carlos** e é destinado exclusivamente para fins de estudo e treinamento na linguagem **Assembly x86_64** (utilizando chamadas de sistema do Linux).

## 📁 Estrutura de Pastas

- `Scripts/`: Contém todos os arquivos de código fonte em assembly (`.asm`) e um manual de referência (`manualASM.txt`).
  - `helloword.asm`: Um simples programa de "olá mundo".
  - `somar.asm`: Exemplo de operações de soma.
  - `senha.asm`: Exemplo de validação ou leitura de senhas.
  - `loop_*.asm`: Exemplos de como funcionam os loops em assembly.
  - ... e vários outros exemplos de estudo.
- `README.md`: Documentação em Inglês.
- `README_pt-BR.md`: Documentação em Português.

## 🛠️ Requisitos

Para compilar e rodar os exemplos deste repositório, você precisará de um ambiente Linux (ou WSL no Windows) com as seguintes ferramentas instaladas:

- **NASM** (O Netwide Assembler)
- **LD** (GNU Linker - geralmente vem com o pacote `binutils` ou `build-essential`)

Você pode instalá-los no Debian/Ubuntu utilizando:
```bash
sudo apt update
sudo apt install nasm build-essential
```

## 🚀 Como Rodar

Navegue até o diretório `Scripts/` ou execute os comandos apontando para o arquivo desejado. Aqui está o passo a passo para compilar e executar qualquer um dos scripts:

1. **Montar (Assemble) o código**: Converte o arquivo `.asm` em um arquivo objeto (`.o`).
   ```bash
   nasm -f elf64 Scripts/helloword.asm -o helloword.o
   ```

2. **Linkar o arquivo objeto**: Converte o arquivo objeto em um binário executável.
   ```bash
   ld helloword.o -o helloword
   ```

3. **Executar o programa**:
   ```bash
   ./helloword
   ```

## 📝 Licença

Este projeto é destinado para fins educacionais. Fique à vontade para explorar os códigos e aprender com eles!
