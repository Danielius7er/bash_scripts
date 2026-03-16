#!/bin/bash

echo "--- RELATÓRIO DE SAÚDE DO SISTEMA (Windows/Git Bash) ---"
echo "Data: $(date '+%d/%m/%Y %H:%M:%S')"
echo "------------------------------------------------------"

# 1. Verificação de Espaço em Disco
# No Windows/Git Bash, o comando df -h funciona, mas a saída é um pouco diferente.
echo "Espaço em Disco (Disco C:):"
df -h /c | awk 'NR==2 {print "Total: " $2 " | Usado: " $3 " | Disponível: " $4}'

# 2. Verificação de Memória RAM
# Como o comando 'free' não existe no Windows, vamos chamar o 'wmic' (do próprio Windows)
echo -e "\nUso de Memória RAM (Aproximado):"
total_ram=$(wmic computersystem get totalphysicalmemory | grep -o '[0-9]\+')
free_ram=$(wmic os get freephysicalmemory | grep -o '[0-9]\+')

# Convertendo de Bytes/KB para GB para ficar legível
total_gb=$((total_ram / 1024 / 1024 / 1024))
free_gb=$((free_ram / 1024 / 1024)) # O wmic retorna free em KB
echo "Total: ${total_gb}GB | Disponível: ${free_gb}GB"

# 3. Tempo de Atividade (Uptime)
# Usando o comando 'net statistics' do Windows para descobrir quando o sistema iniciou
echo -e "\nSistema ligado desde:"
net statistics workstation | grep "Statistics since" | cut -d " " -f 3-

echo "------------------------------------------------------"
