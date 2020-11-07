# Python vs Mathematica

Porque os alunos de LMAC aprendem Python, esta página existe para tentar estabelecer uma comparação direta entre Python e Mathematica.

Esta página contém código em Python à esquerda e um equivalente **semântico** em Mathematica à direita.

A ênfase em "semântico" reside no facto de Python e Mathematica terem algumas diferenças fundamentais, nomeadamente o valor do primeiro índice de uma lista.
Python é indexado a começar no 0 e Mathematica a começar no 1. Nesse sentido, quando o código em Python lida com índices, o código equivalente em Mathematica terá
em conta essa diferença.

Por favor, note-se que a tradução direta de código Python para código Mathematica é, em geral, um desperdício de funcionalidades
porque o Mathematica tem vários mecanismos muito poderosos que Python não tem.
Ainda assim, se o código funciona... bestial.

## Sintaxe

````{panels}
```py
# comment
"""multiline
comment"""
```
---
```mma
(* multiline
comment *)
```
````

---

````{panels}
```py
var = 1
other_variable = 0
var1, var2 = 2, 3
del var
```
---
```mma
var = 1   (* Set[var1, 1] *)
otherVariable = 0
{var1, var2} = {2, 3}
Clear[var]
```
````

---

````{panels}
```py
function(arg1, arg2)
```
---
```mma
Function[arg1, arg2]
```
````

---

````{panels}
```py
None
```
---
```mma
Null
```
````

---

````{panels}
```py
a == b
a != b
```
---
```mma
a == b   (* Equal[a, b]   *)
a != b   (* Unequal[a, b] *)
```
````

## Números

````{panels}
```py
1 + 2
1 - 2
2 * 3
1 / 2
3**2
```
---
```mma
1 + 2   (* Plus[1, 2]     *)
1 - 2   (* Subtract[1, 2] *)
2 * 3   (* Times[1, 2]    *)
1 / 2   (* Divide[1, 2]   *)
3^2     (* Power[3, 2]    *)
```
````

---

````{panels}
```py
15 % 4
15 // 4
divmod(15, 4)
```
---
```mma
Mod[15, 4]
Quotient[15, 4]
QuotientRemainder[15, 4]
```
````

---

````{panels}
```py
z = 4 + 2j
z.real
z.imag
abs(z)
```
---
```mma
z = 4 + 2I
Re[z]
Im[z]
Abs[z]
```
````

---

````{panels}
```py
4 >  3
3 <  4
5 >= 6
7 <= 2
```
---
```mma
4 >  3   (* Greater[4, 3]      *)
3 <  4   (* Less[3, 4]         *)
5 >= 6   (* GreaterEqual[5, 6] *)
7 <= 2   (* LessEqual[7, 2]    *)
```
````

---

## Valores lógicos

````{panels}
```py
True
False
```
---
```mma
True;
False
```
````

---

````{panels}
```py
True or False
True and False
not True
```
---
```mma
True || False   (* Or[True, False] *)
True && False   (* And[True, False] *)
!True           (* Not[True] *)
```
````

---

````{panels}
```py
all(boolean_list)
any(boolean_list)
```
---
```mma
And @@ booleanList
Or  @@ booleanList
```
````

## Texto

````{panels}
```py
"Hello," + " world!"
```
---
```mma
"Hello," <> " world!"
```
````

---

````{panels}
```py
s.upper()
s.lower()
s.capitalize()
```
---
```mma
ToUpperCase[s]
ToLowerCase[s]
Capitalize[s]
```
````

## Listas

````{panels}
```py
l = [1, 2, 3]
len(l)
```
---
```mma
l = {1, 2, 3}
Len[l]
```
````

---

````{panels}
```py
l[0]
l[-1]
l[a:b]
l[::-1]
```
---
```mma
l[[0]]
l[[-1]]
Take[l, {a, b}]
Reverse[l]
```
````

---

````{panels}
```py
l = [1, 2, 3]
l.append(4)
l.pop()
l.insert(pos, obj)
```
---
```mma
l = {1, 2, 3}
AppendTo[l, 4]
l = Drop[l, -1]
l = Insert[l, obj, pos]
```
````

---

````{panels}
```py
[0, 1, 2] + [3]
[0] + [1, 2, 3]
[0, 1] + [2, 3]
```
---
```mma
Append[{0, 1, 2}, 3]
Prepend[{1, 2, 3}, 0]
Join[{0, 1}, {2, 3}]
```
````

---

````{panels}
```py
range(n)
```
---
```mma
Array[#&, n]       (* first `n` indices          *)
Array[#&, n] - 1   (* integers from `0` to `n-1` *)
```
`````

---

````{panels}
```py
range(a, b)
```
---
```mma
Array[#&, b-a, a]   (* integers from `a` to `b-1` *)
```
````

---

````{panels}
```py
range(a, b, step)
```
---
```mma
a + step*Array[#&, Quotient[b-a, step], 0]   (* integers `a`, `a+step`, ... below `b` *)
```
````

---

````{panels}
```py
[c for _ in range(n)]
```
---
```mma
ConstantArray[c, n]
```
````

---

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

---

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
    otherStatements
]
```
````

---

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

---

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

---

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

---

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

---

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

---

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

---

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

---

````{panels}
```py
lambda x: 2*x
```
---
```mma
(2*#)&
```
````

---

````{panels}
```py
lambda x, y: x + y
```
---
```mma
(#1 + #2)&
```
````

---

````{panels}
```py
lambda *args: print(len(args))
```
---
```mma
Print[Length[##]]&
```
````

## Exemplos completos

Esta secção contém alguns programas completos nas duas linguagens, para uma comparação mais geral.

### Fatorial recursivo

````{panels}
```py
def factorial(n):
    if n <= 1:
        return 1
    else:
        return n * factorial(n-1)
```
---
```mma
Fact = Function[{n},
    If[n <= 1,
        1,
        n * Factorial[n-1]
    ]
]
```
````

### Fatorial imperativo

````{panels}
```py
def factorial(n):
    fact = 1
    for i in range(1, n+1):
        fact *= i
    return fact
```
---
```mma
Fact = Function[{n}, Module[{i, fact = 1},
    For[i = 1, i <= n, i++,
        fact *= i
    ];
    fact
]]
```
````

### Fatorial funcional

````{panels}
```py
from functools import reduce
def factorial(n):
    return reduce(int.__mul__, range(1, n+1))
```
---
```mma
Fact = Function[{n},
    Times @@ Array[#&, n]
]
```
````

### Resolução de uma equação quadrática

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

Claro que, em Mathematica, existem várias funções dedicadas à resolução de equações, por exemplo a função `Solve`.