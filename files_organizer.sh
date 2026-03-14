# Definição do diretório de trabalho
DIRETORIO_ALVO="$HOME/Downloads"

# Navega até a pasta ou encerra se houver erro
cd "$DIRETORIO_ALVO" || exit

# Loop que percorre todos os ficheiros no diretório
for ficheiro in *; do
    # Verifica se é um ficheiro comum (ignora pastas)
    if [ -f "$ficheiro" ]; then
        # Extrai a extensão do ficheiro (ex: jpg, pdf)
        extensao="${ficheiro##*.}"

        # Define o nome da pasta de destino baseado na extensão
        pasta_destino="Arquivos_${extensao^^}" # ^^ converte para maiúsculas

        # Cria a pasta se ela ainda não existir
        mkdir -p "$pasta_destino"

        # Move o ficheiro para a pasta correspondente
        mv "$ficheiro" "$pasta_destino/"
        echo "Movido: $ficheiro -> $pasta_destino"
    fi
done
