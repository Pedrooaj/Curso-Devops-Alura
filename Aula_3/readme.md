# 🖥️ Script Shell v0.1 – Menu Interativo

Este script em **Bash** oferece um menu interativo com quatro funcionalidades básicas:  

1. Realizar uma cópia de segurança de uma pasta  
2. Criar um diretório  
3. Verificar a existência de um arquivo  
4. Loop de contagem de 1 até 5  

O script é educativo e prático, ideal para quem está aprendendo Shell Script e quer automatizar tarefas simples.

---

## ⚙️ Como o script funciona

- Exibe um menu com quatro opções.  
- Lê a escolha do usuário com `read`.  
- Executa a ação correspondente usando `if`, `elif` e `else`.  
- Opção 1: faz backup de uma pasta usando `cp -r`.  
- Opção 2: cria um diretório com `mkdir -p`.  
- Opção 3: verifica se um arquivo ou diretório existe usando `-e`.  
- Opção 4: faz um loop de 1 até 5 com `for`.  

---

## 📂 Estrutura do Script

```bash
#!/bin/bash

echo "Seja Bem Vindo Ao Meu Script Shell v0.1"
echo "1 - Realizar uma cópia de segurança de uma pasta?"
echo "2 - Criar um diretório?"
echo "3 - Verificar a existência de um arquivo?"
echo "4 - Loop de 1 até 5"

read -p "Digite uma das opções acima: " escolha

if [ "$escolha" -eq 1 ]; then
    read -p "Qual pasta você deseja realizar uma cópia de segurança? " origem
    read -p "Destino da pasta de segurança: " destino
    if [ -e "$origem" ]; then
        mkdir -p "$destino"
        cp -r "$origem" "$destino"
        echo "✅ Cópia de segurança concluída de $origem para $destino"
    else
        echo "❌ A pasta $origem não existe."
    fi

elif [ "$escolha" -eq 2 ]; then
    read -p "Nome do diretório que deseja criar: " diretorio
    mkdir -p "$diretorio"
    echo "✅ Diretório $diretorio criado com sucesso"

elif [ "$escolha" -eq 3 ]; then
    read -p "Digite o caminho do arquivo: " arquivo
    if [ -e "$arquivo" ]; then
        echo "✅ O arquivo $arquivo existe."
    else
        echo "❌ O arquivo $arquivo não existe."
    fi

elif [ "$escolha" -eq 4 ]; then
    for i in {1..5}; do
        echo "Número: $i"
    done

else
    echo "❌ Opção Inválida"
fi
```

---

## 🔧 Requisitos

- Sistema operacional Linux ou Unix-like  
- Bash  
- Permissão para criar arquivos e diretórios no sistema  

---

## 🚀 Instalação e Execução

1. Salve o script como `menu.sh`:
```bash
nano menu.sh
```

2. Dê permissão de execução:
```bash
chmod +x menu.sh
```

3. Execute o script:
```bash
./menu.sh
```

---

## 📝 Observações

- A opção de backup copia **recursivamente** todo o conteúdo da pasta de origem.  
- A criação de diretório (`mkdir -p`) não dá erro se o diretório já existir.  
- A verificação de arquivos usa `-e`, que funciona para arquivos e pastas.  
- A contagem no loop de 1 a 5 é apenas ilustrativa.  

---

## ✅ Resultado Esperado

- O menu é exibido e solicita uma escolha.  
- Cada opção executa a ação correspondente, com mensagens de sucesso ou erro.  
- É possível testar todas as funcionalidades em um terminal Bash.
