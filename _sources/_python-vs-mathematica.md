# Python vs Mathematica

Porque os alunos de LMAC aprendem Python, esta página existe para tentar estabelecer uma comparação direta entre Python e Mathematica.

Esta tabela contém código em Python e um equivalente semântico em Mathematica. Por favor, note-se que a tradução direta de código Python para código Mathematica é, em geral, um desperdício de funcionalidades porque o Mathematica tem vários mecanismos muito poderosos que Python não tem. Ainda assim, se o código funciona... bestial.

## Tipos de dados

### Números

````{panels}
*Python*

```py
1
1.0
3 + 2j
```

---

*Mathematica*

```mma
1
1.0
3 + 2I
```
````

### Valores lógicos

````{panels}
*Python*

```py
True
False
```

---

*Mathematica*

```mma
True
False
```
````

### Texto

````{panels}
*Python*

```py
"string"
```

---

*Mathematica*

```mma
"string"
```
````

### Listas

````{panels}
*Python*

```py
[1, 2, "inside a list"]
```

---

*Mathematica*

```mma
{1, 2, "inside a list"}
```
````

### Dicionários

````{panels}
*Python*

```py
d = {
    1: 1,
    "texto": 2,
    2: 4
}
```

---

*Mathematica*

```mma
d = Association[
    1 -> 1,
    "texto" -> 2,
    2 -> 4
]
```
````

### Tuplos

Afaik, Mathematica não tem nenhuma estrutura de dados para tuplos.


## Comentários

````{panels}
*Python*

```py
# inline comment

"""
Multiline
comment
"""
```

---

*Mathematica*

```mma
(* Multiline
comment *)
```
````

## Funções

### Convenções

Em Python, os nomes das funções seguem a convenção `lowercase_with_underscores` enquanto o Mathematica usa `CamelCase`.

Em Mathematica, *quase* tudo é uma função. Algumas funções podem ser usadas de forma mais breve com outros símbolos. Por exemplo, em vez de se usar a função `Plus`, pode usar-se o símbolo `+`.

### Definição

````{panels}
*Python*

```py
def f(arg1, arg2):
    return arg2
```

Em Python a definição começa com a palavra reservada `def`, seguida do nome da função e da lista de argumentos dentro de `()`. De seguida, usa-se `:` para indicar que o que se segue é o corpo da função.

O valor devolvido é o resultado da expressão à direita da palavra reservada `return`.

---

*Mathematica*

```mma
f = Function[{arg1, arg2}, arg2]
```

Em Mathematica, para definir uma função temos de usar a função `Function`. A função `Function` recebe primeiro a lista de argumentos da função que estamos a definir e de seguida o corpo da função, separados por `,` porque estas duas coisas são, por sua vez, argumentos da função `Function`.

O valor devolvido é o resultado da última instrução dentro do corpo da função.
````

**Exemplo completo**, implementação de uma função que resolve uma equação quadrática, dados os coeficientes.

````{tabbed} Python
```py
def quadratic_formula(a, b, c):
    delta = b**2 - 4*a*c
    x1 = ((-b) + delta**0.5) / 2
    x2 = ((-b) - delta**0.5) / 2
    return x1, x2
```
````

````{tabbed} Mathematica
```mma
QuadraticFormula = Function[{a, b, c}, Module[{delta, x1, x2},
    delta = b^2 - 4*a*c;
    x1 = ((-b) + delta^0.5) / 2;
    x2 = ((-b) - delta^0.5) / 2;
    {x1, x2}
]]
```
````

Dentro de uma função, as variáveis criadas são automaticamente locais à função. Este não é o caso no Mathematica, pelo que é necessário usar a função `Module` para impedir o Mathematica de criar variáveis globais que não o deviam ser.

### Aplicação de funções

````{panels}
*Python*

O nome da função é seguido de parêntesis curvos `()`, dentro dos quais está a lista de argumentos.

```py
f(arg1, arg2)
```

---

*Mathematica*

O nome da função é seguido de parêntesis retos `[]`, dentro dos quais está a lista de argumentos.

```mma
F[arg1, arg2]
```
````

## Separação de instruções

`````{panels}
*Python*

Em Python, as instruções estão separadas quando estão em linhas diferentes.

```py
print(1)    # expression 1
print(2)    # expression 2
```

---

*Mathematica*

Em Mathematica, as instruções só estão separadas quando têm um `;` entre elas. Mudar de linha é recomendado mas não é necessário.

````{tabbed} Recomendado
```mma
Print[1];    (* expression 1 *)
Print[2]    (* expression 2 *)
```
````
````{tabbed} Alternativa
```mma
Print[1]; Print[2]
````
`````