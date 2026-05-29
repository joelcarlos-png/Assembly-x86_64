# Assembly x86_64 (Linux Syscalls)

[Versão em Português](README_pt-BR.md)

This repository was created by **Joel Carlos** and is intended solely for study and training purposes in the **Assembly x86_64** language (using Linux syscalls).

## 📁 Folder Structure

- `Scripts/`: Contains all the assembly source code files (`.asm`) and a reference manual (`manualASM.txt`).
  - `helloword.asm`: A simple hello world program.
  - `somar.asm`: An example of addition operations.
  - `senha.asm`: An example of reading hidden inputs or password validation.
  - `loop_*.asm`: Examples showing how loops work in assembly.
  - ... and several other study examples.
- `README.md`: Documentation in English.
- `README_pt-BR.md`: Documentation in Portuguese.

## 🛠️ Requirements

To compile and run the examples in this repository, you will need a Linux environment (or WSL on Windows) with the following tools installed:

- **NASM** (The Netwide Assembler)
- **LD** (GNU Linker - usually comes with `binutils` or `build-essential`)

You can install them on Debian/Ubuntu using:
```bash
sudo apt update
sudo apt install nasm build-essential
```

## 🚀 How to Run

Navigate to the `Scripts/` directory or run the commands pointing to the desired file. Here is the step-by-step process to compile and execute any of the scripts:

1. **Assemble the code**: Convert the `.asm` file into an object file (`.o`).
   ```bash
   nasm -f elf64 Scripts/helloword.asm -o helloword.o
   ```

2. **Link the object file**: Convert the object file into an executable binary.
   ```bash
   ld helloword.o -o helloword
   ```

3. **Run the executable**:
   ```bash
   ./helloword
   ```

## 📝 License

This project is for educational purposes. Feel free to explore the codes and learn from them!
