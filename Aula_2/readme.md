# 📦 Script de Compactação em Bash

Este projeto contém um script em **Bash** que permite compactar múltiplos arquivos e diretórios em um único arquivo no formato **`.tar.gz`**.  
Ele é útil para criar pacotes de backup ou organizar vários arquivos em um só.

---

## ⚙️ Como o script funciona

1. O script verifica se o usuário passou **ao menos 2 argumentos**:
   - O **nome do arquivo de saída** (`backup.tar.gz`).
   - Um ou mais **arquivos/pastas** a serem compactados.

2. Se os argumentos não forem suficientes, ele exibe uma mensagem de uso e encerra:
   ```bash
   Uso: ./compactar.sh <arquivo_saida.tar.gz> <arquivos...>
   ```

3. Se os argumentos forem válidos:
   - O **primeiro argumento** é o nome do arquivo de saída.
   - Os demais argumentos são os arquivos/pastas a compactar.

4. O comando `tar` cria o arquivo compactado:
   ```bash
   tar -czf "$arquivo_saida" "${arquivos[@]}"
   ```

5. Ao final, exibe uma mensagem de sucesso.

---

## 📂 Estrutura do Script

```bash
#!/bin/bash

if [ "$#" -lt 2 ]; then
    echo "O programa $0 requer nome do arquivo e arquivos a serem compactados"
    exit 1
fi

arquivo_saida="$1"
arquivos=("${@:2}")
tar -czf "$arquivo_saida" "${arquivos[@]}"
echo "✅ Compactado com sucesso em $arquivo_saida"
```

---

## 🔧 Requisitos

- Sistema operacional Linux
- Bash
- Comando `tar` (normalmente já vem instalado)

Verifique se o `tar` está instalado:
```bash
tar --version
```

---

## 🚀 Instalação e Uso

### 1. Criar o arquivo do script
Crie o arquivo `compactar.sh`:
```bash
nano compactar.sh
```
Cole o código do script, salve e saia (`Ctrl + O`, Enter, `Ctrl + X`).

---

### 2. Dar permissão de execução
Antes de usar o script, torne-o executável:
```bash
chmod +x compactar.sh
```

---

### 3. Executar o script
A sintaxe é:
```bash
./compactar.sh <arquivo_saida.tar.gz> <arquivos...>
```

#### Exemplo 1: Compactar pastas e arquivos
```bash
./compactar.sh backup.tar.gz pasta1 arquivo.txt pasta2
```
Resultado:
```
backup.tar.gz
```
contendo `pasta1`, `arquivo.txt` e `pasta2`.

#### Exemplo 2: Compactar apenas arquivos
```bash
./compactar.sh documentos.tar.gz arquivo1.txt arquivo2.pdf arquivo3.jpg
```
Resultado:
```
documentos.tar.gz
```
contendo os 3 arquivos.

---

## 📝 Observações Importantes

- O **primeiro argumento sempre deve ser o nome do arquivo de saída**.
- É obrigatório passar pelo menos **um arquivo ou diretório** para compactar.
- O script sobrescreve o arquivo de saída se ele já existir.
- Você pode usar **caminho absoluto** para salvar em outro local, por exemplo:
  ```bash
  ./compactar.sh /home/usuario/backups/meu_backup.tar.gz pasta1 arquivo.txt
  ```

---

## ✅ Resultado Esperado

- Se você rodar corretamente, verá algo assim:
  ```
  ✅ Compactado com sucesso em backup.tar.gz
  ```

- O arquivo gerado estará pronto para ser descompactado com:
  ```bash
  tar -xzf backup.tar.gz
  ```
