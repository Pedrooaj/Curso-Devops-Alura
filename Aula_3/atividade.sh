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
