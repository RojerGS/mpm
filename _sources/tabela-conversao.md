# Tabela de conversão Python - Mathematica

Porque os alunos de LMAC aprendem Python, esta página existe para tentar estabelecer uma comparação direta entre Python e Mathematica.

Esta tabela contém código em Python e um equivalente semântico em Mathematica. Por favor, note-se que a tradução direta de código Python para código Mathematica é, em geral, um desperdício de funcionalidades porque o Mathematica tem vários mecanismos muito poderosos que Python não tem. Ainda assim, se o código funciona... bestial.

## Sintaxe básica

### Tipos de dados

````{panels}
*Python*

```py
1
1.0
3 + 2j
true
false
"string"
[1, 3, "inside a list"]
```

---

*Mathematica*

```mma
1
1.0
3 + 2I
True
False
"string"
{1, 3, "inside a list"}
```
````

````{tabbed} Python
```py
1
1.0
3 + 2j
true
false
"string"
[1, 3, "inside a list"]
```
````

````{tabbed} Mathematica
```mma
1
1.0
3 + 2I
True
False
"string"
{1, 3, "inside a list"}
```
````

### Comentários

````{tabbed} Python
```py
# This is line comment.

"""
This
is a multi-
line comment.
"""
```
````

````{tabbed} Mathematica
```mma
(* This is
a multiline
comment *)
```
````
