Exercises week 3.md

### Derivations
Consider the following syntax definition, assuming that ID is defined as alphanumeric identifiers as usual:
```
sorts S E ID
context-free syntax
  S.S   = E
  E.Var = ID
  E.Add = E "+" E
  E.Mul = E "*" E
  E.Par = "(" E ")"
```
1. Give a right-most derivation for the sentence x + (x ∗ x).
```
E
=> E "+" E
=> E "+" (E)
=> E "+" (E "*" E)
=> E "+" (E "*" ID)
=> E "+" (ID "*" ID)
=> ID "+" (ID "*" ID)

```

2. Give two different abstract syntax trees for the sentence x + x ∗ x.
```
E[E[ID] "+" E[E[ID] "*" E[ID]]]
E[E[E[ID] "+" E[ID]] "*" E[ID]]
```

### Derivations
Consider the following syntax definition.
```
sorts S P ID
context-free syntax
  S.S = "f" "(" P ")"
  P.V = ID
  P.C = P "," ID
  P.R = ID "," P
```
1. Describe the language defined by this syntax definition in English.
This language can be used to express function prototypes.
2. Give a left-most derivation for the sentence `f(x, x, x)`.
```
"f" "(" P ")"
=> "f" "(" ID "," P ")"
=> "f" "(" ID "," ID "," P ")"
=> "f" "(" ID "," ID "," ID ")"
```
3. Use `f(x, x)` as an example to explain why the syntax definition is ambiguous.
This can be parsed in two different ways:
```
"f" "(" P ")"                   P
=> "f" "(" ID "," P ")"         P[ID "," P[]]
=> "f" "(" ID "," ID ")"        P[ID "," P[ID]]

```
or
```
"f" "(" P ")"                   P
=> "f" "(" P "," ID ")"         P[P[] "," ID]
=> "f" "(" ID "," ID ")"        P[P[ID] "," ID]
```

### Disambiguation by Rules
Consider the following ambiguous syntax definition in SDF3 for a small expression language. 
```
sorts S E ID
context-free syntax
  S.S   = E
  E.Var = ID
  E.Neg = "-" E
  E.Add = E "+" E
  E.Sub = E "-" E
  E.Div = E "/" E
  E.Mul = E "*" E
  E.Pow = E "^" E
  E.Par = "(" E ")"
```
Use prioritity and associativity rules to disambiguate the syntax definition. Discuss why you chose to disambiguate the operators in the way you have. Illustrate the resulting disambiguation using examples. Did you catch all ambiguities?
```
sorts S E ID
context-free syntax
  S.S   = E
  E.Var = ID
  E.Neg = "-" E
  E.Add = E "+" E   {left}
  E.Sub = E "-" E   {left}
  E.Div = E "/" E   {left}
  E.Mul = E "*" E   {left}
  E.Pow = E "^" E   {left}
  E.Par = "(" E ")"
 
 context-free priorities

  { 
    E.Pow
  } > {
    E.Neg
  } > { left:
    E.Mul
    E.Div
  } > { left:
    E.Add
    E.Sub
  }
```
I've chosen these rules because they correspond to natural mathematics priorities. Par needs no associativity rules, since it doesn't cause disambiguation. Every possible disambiguation is caught because they all hava an associativity and priority.

### Disambiguation by Transformation
Consider the following ambiguous syntax definition in SDF3 for a small expression language.
```
sorts S E N T F ID
context-free syntax
  S.S   = E

  E.Neg = "-" E
  E.Add = E "+" E
  E.Sub = E "-" E
  E.Div = E "/" E
  E.Mul = E "*" E
  E.Pow = E "^" E
  F.Var = ID
  F.Par = "(" E ")"
```
Transform the syntax definition to an unambiguous syntax definition without using disambiguation rules.
```
sorts S E T N P F ID
context-free syntax
  S.S   = E
  E.Add = E "+" T
  E.Sub = E "-" T
  E = T
  T.Div = T "/" N
  T.Mul = T "*" N
  T = N
  N.Neg = "-" N
  N = P
  P.Pow = P "^" F
  P = F
  F.Var = ID  
  F.Par = "(" E ")"
```
### Binary Operators
Consider the following grammar in the grammar formalism introduced in Lecture 4, with `$` representing end of file:
```
grammar
  productions
    E.I = ID
    E.B = E B E
    B.P = "+"
    B.S = "-"
    B.M = "*"
    B.D = "/"
```
1. Demonstrate that this grammar is ambiguous by giving two different abstract syntax terms for the sentence `ID "+" ID "*" ID` and the left-most derivations that give rise to these trees.
```
E
=> B(E, B, E)
=> B(E, B, E)
=> B(I(ID), B, E)
=> B(I(ID), P(), E)
=> B(I(ID), P(), B(E, B, E))
=> B(I(ID), P(), B(I(ID), B, E))
=> B(I(ID), P(), B(I(ID), M(), E))
=> B(I(ID), P(), B(I(ID), M(), I(ID)))
```
or
```
E
=> B(E, B, E)
=> B(B(E, B, E), B, E)
=> B(B(I(ID), B, E), B, E)
=> B(B(I(ID), P(), E), B, E)
=> B(B(I(ID), P(), I(ID)), B, E)
=> B(B(I(ID), P(), I(ID)), M(), E)
=> B(B(I(ID), P(), I(ID)), M(), I(ID))
```
2. Rewrite the grammar in SDF3 notation and use declarative priority and associativity rules to disambiguate it following standard rules. Define a translation from the ASTs of this grammar to the ASTs of the original grammar.
TBD
3. Instead of using separate disambiguation rules, transform the grammar to an unambiguous context-free grammar
TBD

### SLR Parsing
Consider the following grammar in the grammar formalism introduced in Lecture 4, with $ representing end of file:
```
grammar
  start S
  non-terminals S T E
  terminals ID "+"
  productions
    S = E $
    E = T "+" E
    E = T
    T = ID
```

1. Construct the LR(0) automaton for the grammar using the language of item-set states defined in the lecture
```
State 0 {
    [S = . E]
    [E = . T "+" E]
    [E = . T]
    [T = . ID

    shift E to 1
    shift T to 2
    siftt ID to 3  
}


State 1 {
    [S = E .]
 
    accept
}

State 2 {
    [E = T .]
    [E = T . "+" E]
  
    reduce E = T
    shift "+" to 4
}

State 3 {
    [T = ID .]

    reduce T = ID
}

State 4 {
    [E = T "+" . E]

    shift E to 5
}

State 5 {
    [E = T "+" E .]

    reduce E = T "+" E 
}

```