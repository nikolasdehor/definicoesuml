import sys

def main():
    # Verifica se a quantidade de argumentos é exatamente 2 (nome do script + arquivo de definição)
    if len(sys.argv) != 2:
        print("Uso: python gerador.py arquivo_de_definicao.txt")
        return

    # Armazena o nome do arquivo de definição passado como argumento
    arquivo = sys.argv[1]

    # Abre o arquivo de definição e lê todas as suas linhas
    with open(arquivo, 'r') as f:
        linhas = f.readlines()

    # Inicializa a variável que conterá o código Java gerado
    codigo = ''
    
    # Processa cada linha do arquivo de definição
    for linha in linhas:
        # Para linhas que começam com '+', gera um método público vazio
        if linha.startswith('+'):
            codigo += '    public {} {{\n    }}\n\n'.format(linha.strip())
        # Para linhas que começam com '-', gera um atributo privado
        elif linha.startswith('-'):
            codigo += '    private {};\n'.format(linha.strip().replace('-', ''))
        # Para linhas que começam com '=', inicia uma nova classe, exceto se for apenas uma linha de separação
        elif linha.startswith('='):
            if not linha.startswith('==========================='):
                codigo += '\n}\n\npublic class {{\n'.format(linha.strip().replace('=', ''))

    # Escreve o código Java gerado em um arquivo
    with open('codigo_gerado.java', 'w') as f:
        f.write(codigo)

    # Imprime uma mensagem indicando que o código foi gerado com sucesso
    print("Código gerado com sucesso!")

# Verifica se o script está sendo executado diretamente
if __name__ == "__main__":
    main()