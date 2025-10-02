#! /bin/bash   # Define que o script será interpretado pelo Bash

# Verifica se o número de argumentos passados é menor que 2
if [ "$#" -lt 2 ]; then
    echo echo "Uso: $0 <arquivo_saida.tar.gz> <arquivos...>"
    exit 1
fi

# Primeiro argumento = nome do arquivo de saída
arquivo_saida="$1"

# Demais argumentos (a partir do 2º) = arquivos/pastas a compactar
arquivos=("${@:2}")

# Cria o arquivo tar.gz compactado com os arquivos informados
tar -czf "$arquivo_saida" "${arquivos[@]}"

# Mensagem final de sucesso
echo "Compactado com sucesso em $arquivo_saida"
