import sys

def main():
    if len(sys.argv) != 2:
        print("Uso: python gerador.py arquivo_de_definicao.txt")
        return

    arquivo = sys.argv[1]

    with open(arquivo, 'r') as f:
        linhas = f.readlines()

    codigo = ''
    for linha in linhas:
        if linha.startswith('+'):
            codigo += '    public {} {{\n    }}\n\n'.format(linha.strip())
        elif linha.startswith('-'):
            codigo += '    private {};\n'.format(linha.strip().replace('-', ''))
        elif linha.startswith('='):
            if not linha.startswith('==========================='):
                codigo += '\n}\n\npublic class {{\n'.format(linha.strip().replace('=', ''))

    with open('codigo_gerado.java', 'w') as f:
        f.write(codigo)

    print("Código gerado com sucesso!")

if __name__ == "__main__":
    main()