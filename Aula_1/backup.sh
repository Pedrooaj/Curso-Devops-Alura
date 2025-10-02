# Backup script
#! /bin/bash
diretorio_backup="/home/pedro/devops"
nome_arquivo="backup_$(date + %Y%m%d_$H%M%S).tar.gz"
tar -czf "$nome_arquivo" "$diretorio_backup"
echo "Backup Concluido em $nome_arquivo"
