def carregar_definicao(arquivo):
    with open(arquivo, 'r') as f:
        definicao = f.read()
    return definicao

def gerar_codigo(definicao):
    codigo = []
    for classe in definicao.split('==========================='):
        if not classe.strip():
            continue
        classe_nome = classe.split('\n')[0].strip()
        atributos = classe.split('\n')[1:-2]
        metodos = classe.split('\n')[-2:-1][0].split('+ ')
        codigo.append(f'public class {classe_nome} {{')
        for atributo in atributos:
            tipo, nome = atributo.split(': ')
            codigo.append(f'    private {tipo} {nome};')
        for metodo in metodos:
            codigo.append(f'    public {metodo.strip()}(){{}}')
        codigo.append('}')
    return '\n'.join(codigo)

def salvar_codigo(codigo, arquivo):
    with open(arquivo, 'w') as f:
        f.write(codigo)

if __name__ == '__main__':
    definicao = carregar_definicao('definicao.txt')
    codigo = gerar_codigo(definicao)
    salvar_codigo(codigo, 'codigo_gerado.java')