# Python vs Mathematica

Porque os alunos de LMAC aprendem Python, esta página existe para tentar estabelecer uma comparação direta entre Python e Mathematica.

Esta página contém código em Python à esquerda e um equivalente **semântico** em Mathematica à direita.

A ênfase em "semântico" reside no facto de Python e Mathematica terem algumas diferenças fundamentais, nomeadamente o valor do primeiro índice de uma lista.
Python é indexado a começar no 0 e Mathematica a começar no 1. Nesse sentido, quando o código em Python lida com índices, o código equivalente em Mathematica terá
em conta essa diferença.

Por favor, note-se que a tradução direta de código Python para código Mathematica é, em geral, um desperdício de funcionalidades
porque o Mathematica tem vários mecanismos muito poderosos que Python não tem.
Ainda assim, se o código funciona... bestial.

## Básico

````{panels}
```py
1 + 2
```
---
```mma
1 + 2   (* Plus[1, 2] *)
```
````

````{panels}
```py
1 - 2
```
---
```mma
1 - 2   (* Subtract[1, 2] *)
```
````

````{panels}
```py
2 * 3
```
---
```mma
2 * 3   (* Times[1, 2] *)
```
````

````{panels}
```py
1 / 2
```
---
```mma
1 / 2   (* Divide[1, 2] *)
```
````

````{panels}
```py
3**2
```
---
```mma
3^2   (* Power[3, 2] *)
```
````

````{panels}
```py
15 % 4
```
---
```mma
Mod[15, 4]
```
````

````{panels}
```py
15 // 4
```
---
```mma
Quotient[15, 4]
```
````

````{panels}
```py
True or False
```
---
```mma
True || False   (* Or[True, False] *)
```
````

````{panels}
```py
True and False
```
---
```mma
True && False   (* And[True, False] *)
```
````

````{panels}
```py
not True
```
---
```mma
!True   (* Not[True] *)
```
````

````{panels}
```py
statement1
statement2
statement3
```
---
```mma
statement1;
statement2;
statement3
```
````

## Listas

````{panels}
```py
[1, 2, 3]
```
---
```mma
{1, 2, 3}
```
````

````{panels}
```py
range(n)
```
---


```mma
Array[#&, n]       (* first `n` indices          *)
Array[#&, n] - 1   (* integers from `0` to `n-1` *)
```
```

`````

````{panels}
```py
range(a, b)
```
---
```mma
Array[#&, b-a, a]   (* integers from `a` to `b-1` *)
```
````

````{panels}
```py
range(a, b, step)
```
---
```mma
a + step*Array[#&, Quotient[b-a, step], 0]   (* integers `a`, `a+step`, ... below `b` *)
```
````

````{panels}
```py
[c for _ in range(n)]
```
---
```mma
ConstantArray[c, n]
```
````

````{panels}
```py
[f(i) for i in range(n)]
```
---
```mma
Table[F[i], {n}]
```
````

## Dicionários



## Controlo da execução de um programa

````{panels}
```py
if condition:
    statements
```
---
```mma
If[condition,
    statements
]
```
````

````{panels}
```py
if condition:
    statements
else:
    other_statements
```
---
```mma
If[condition,
    statements,
    other_statements
]
```
````

````{panels}
```py
if cond1:
    stats1
elif cond2:
    stats2
elif cond3:
    stats3
```
---
```mma
Which[
    cond1, stats1,
    cond2, stats2,
    cond3, stats3
]
```
````

````{panels}
```py
if cond1:
    stats1
elif cond2:
    stats2
else:
    stats3
```
---
```mma
Which[
    cond1, stats1,
    cond2, stats2,
    True, stats3
]
```
````

````{panels}
```py
while condition:
    statements
```
---
```mma
While[condition,
    statements
]
```
````

````{panels}
```py
for i in range(n):
    statements
```
---
```mma
For[i = 0, i < n, i++,
    statements
]
```
````

````{panels}
```py
for elem in iterable:
    statements
```
---
```mma
For[i = 1, i <= Length[iterable], i++,
    elem = iterable[[i]];
    statements
]
```
````

````{panels}
```py
for i, elem in enumerate(iterable):
    statements
```
---
```mma
For[i = 1, i <= Length[iterable], i++,
    elem = iterable[[i]];
    statements
]
```
````

## Funções

````{panels}
```py
def f(arg1, arg2):
    statements
    return expr
```
---
```mma
f = Function[{arg1, arg2},
    statements;
    expr
]
```
````

````{panels}
```py
def f():
    var = 3
    return var
```
---
```mma
f = Function[{}, Module[{var},
    var = 3;
    var
]]
```
````

````{panels}
```py
def quadratic_formula(a, b, c):
    delta = b**2 - 4*a*c
    x1 = ((-b) + delta**0.5) / 2
    x2 = ((-b) - delta**0.5) / 2
    return x1, x2
```
----
```mma
QuadraticFormula = Function[{a, b, c}, Module[{delta, x1, x2},
    delta = b^2 - 4*a*c;
    x1 = ((-b) + delta^0.5) / 2;
    x2 = ((-b) - delta^0.5) / 2;
    {x1, x2}
]]
```
````

````{panels}
```py
lambda x: 2*x
```
---
```mma
(2*#)&
```
````

````{panels}
```py
lambda x, y: x + y
```
---
```mma
(#1 + #2)&
```
````

````{panels}
```py
lambda *args: print(len(args))
```
---
```mma
Print[Length[##]]&
```
````