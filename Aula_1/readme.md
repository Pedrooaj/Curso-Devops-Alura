# 🗂️ Script de Backup Automático em Bash

Este projeto contém um script em **Bash** que realiza o **backup automático** de um diretório.  
O backup é salvo em formato **`.tar.gz`** e possui a **data e hora no nome do arquivo**, garantindo que os arquivos não sejam sobrescritos e fiquem organizados.

---

## ⚙️ Como o script funciona

1. O script define:
   - **Diretório de origem** → a pasta que será copiada (`/home/pedro/devops`).
   - **Diretório de destino** → a pasta onde o backup será salvo (`/home/pedro/backups`).

2. Ele cria automaticamente o diretório de destino caso não exista:
   ```bash
   mkdir -p "$destino_backup"
   ```

3. O nome do arquivo é gerado usando a data e hora do momento da execução:
   ```bash
   nome_arquivo="backup_$(date +%Y%m%d_%H%M%S).tar.gz"
   ```
   - Exemplo: `backup_20251002_141045.tar.gz`

4. Em seguida, o script compacta o diretório de origem usando `tar`:
   ```bash
   tar -czf "$destino_backup/$nome_arquivo" "$diretorio_backup"
   ```

5. Por fim, mostra uma mensagem confirmando o local onde o backup foi salvo:
   ```
   ✅ Backup concluído em: /home/pedro/backups/backup_20251002_141045.tar.gz
   ```

---

## 📂 Estrutura do Script

```bash
#!/bin/bash

# Diretório a ser feito backup
diretorio_backup="/home/pedro/devops"

# Diretório onde o backup será salvo
destino_backup="/home/pedro/backups"

# Cria a pasta de destino se não existir
mkdir -p "$destino_backup"

# Nome do arquivo com data e hora
nome_arquivo="backup_$(date +%Y%m%d_%H%M%S).tar.gz"

# Executa o backup
tar -czf "$destino_backup/$nome_arquivo" "$diretorio_backup"

# Mensagem de conclusão
echo "✅ Backup concluído em: $destino_backup/$nome_arquivo"
```

---

## 🔧 Requisitos

- Sistema operacional Linux
- Bash (já incluso na maioria das distros)
- Comando `tar` (normalmente já instalado)

Para verificar se o `tar` está instalado:
```bash
tar --version
```

---

## 🚀 Instalação e Uso

### 1. Criar o arquivo do script
Crie um arquivo chamado `backup.sh`:
```bash
nano backup.sh
```
Cole o conteúdo do script, salve e saia (`Ctrl + O`, Enter, `Ctrl + X`).

---

### 2. Dar permissão de execução
Antes de rodar, é necessário dar permissão para execução:
```bash
chmod +x backup.sh
```

---

### 3. Executar manualmente
Para rodar o backup manualmente:
```bash
./backup.sh
```

O resultado será parecido com:
```
✅ Backup concluído em: /home/pedro/backups/backup_20251002_141045.tar.gz
```

O arquivo será salvo dentro de:
```
/home/pedro/backups/
```

---

## ⏰ Execução Automática com Cron

Se quiser que o script rode sozinho em horários definidos, use o **cron**.

1. Abra o cron:
   ```bash
   crontab -e
   ```

2. Adicione a linha para rodar todo dia às 23h:
   ```
   0 23 * * * /home/pedro/backup.sh
   ```

3. Salve e pronto ✅

Agora o backup será criado automaticamente todos os dias às 23h.

---

## 📦 Exemplos de Backups Gerados

```
/home/pedro/backups/
├── backup_20251002_141045.tar.gz
├── backup_20251002_230000.tar.gz
├── backup_20251003_230000.tar.gz
```

Cada arquivo tem a data e a hora do momento em que o backup foi feito.

---

## 📝 Observações Importantes

- Certifique-se de que o diretório de origem (`/home/pedro/devops`) existe.
- Ajuste os caminhos `diretorio_backup` e `destino_backup` conforme sua necessidade.
- O script gera **um novo arquivo a cada execução**, sem sobrescrever os anteriores.
- Se rodar pelo cron, use **caminho absoluto** para o script (ex.: `/home/pedro/backup.sh`).

---

## ✅ Resultado Esperado

- Executando manualmente → gera um backup imediato.  
- Executando via cron → backups automáticos em horários programados.  
- Ao final, você terá uma coleção de arquivos `.tar.gz` organizados por data e hora.
