# Gerador de Código via Descrições UML

Geração de código a partir de definições UML.

Com base em uma descrição textual o *software* tem como objetivo gerar as classes do sistema. Suponha que o exemplo a seguir esteja salvo no arquivo *definicao.txt*:

```
Cidade
===========================
- id: Integer
- nome: String
===========================
+ inserir(): boolean
+ selecionar(): boolean
===========================

Pessoa
===========================
- id: Integer
- nome: String
- telefone: String
- sexo: char
- cidade: Cidade
===========================
+ inserir(): boolean
+ alterar(): boolean
+ excluir(): boolean
===========================
```

Com base nessa entrada e o comando a seguir:

```shell
$ ./gerador definicao.txt
```

O gerador produz o seguinte resultado:

```java
public class Cidade {
    private Integer id;

    private String nome;

    public boolean inserir(){}

    public boolean selecionar(){}
}

public class Pessoa {
    private Integer id;

    private String nome;

    private String telefone;

    private char sexo;

    private Cidade cidade;

    public boolean inserir(){}

    public boolean alterar(){}

    public boolean excluir(){}
}
```