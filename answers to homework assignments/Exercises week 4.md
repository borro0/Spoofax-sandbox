Exercises week 4.md

### Map and Filter
The Stratego library provides two strategies filter and map with the following implementation:
```
map(s): []     -> []
map(s): [x|xs] -> [<s> x | <map(s)> xs]

filter(s): []     -> []
filter(s): [x|xs] -> <filter(s)> xs where not (<s> x)
filter(s): [x|xs] -> [<s> x | <filter(s)> xs]
```
1. What is the result of `<filter(inc)> [1, "two", 3]`? Show each step of computation.
```
<filter(inc)> [1, "two", 3]
=> [<inc> 1 | <filter(inc)> ["two", 3]]
=> [2 | <filter(inc)> ["two", 3]]
=> [2 | <filter(inc)> [3]]
=> [2 | <inc> [3]]
=> [2 | 4]
=> [2, 4]
```
2. What is the result of `<map(inc)> [1, "two", 3]`? Show each step of computation.
```
<map(inc)> [1, "two", 3]
=> [<inc> 1 | <map(inc)> ["two", 3]]
=> [2 | <map(inc)> ["two", 3]]
=> [2 | [ <inc> "two" | <map(inc)> [3]]]
=> [2 | [ "two" | <map(inc)> [3]]]
=> [2, "two" | <map(inc)> [3]]
=> [2, "two" | <inc> [3]]
=> [2, "two" | 4]
=> [2, "two", 4]
```
3. Based on the definition of map and filter, explain the differences between both strategies.
Filter(s), will remove elements from the list for which the function s returns false. Map(s), will simply leave those elements and ignore them.

### Inverse
The Stratego library defines a strategy `inverse(|e)` with the following implementation:
```
inverse(|a): []     -> a
inverse(|a): [x|xs] -> <inverse(|[x|a])> xs
```
1. Explain the semantics of `inverse` in English.
Inverse will invert the order of the list it is given.

2. What is the result of applying `inverse(|[])` to the term `[1,2,3]`. Show each step of computation.
```
inverse(|[]) [1,2,3]
=> inverse(|[1]) [2,3]
=> inverse(|[2,1]) [3]
=> inverse(|[3,2,1]) []
=> [3,2,1]
```
3. Based on the definition of `inverse`, explain how an accumulator is used.
The accumulator takes the first element of the list, and prep-ends it to his total.
It basically adds all elements of a list, and the result is the same list but in reverse order.

### Fold
The Stratego library provides a strategy foldr(s1, s2) with the following implementation:
```
foldr(s1, s2): []     -> <s1>
foldr(s1, s2): [x|xs] -> <s2> (x, <foldr(s1, s2)> xs)
```
1. Evaluate the following Stratego code. Show all intermediate steps and results.
```
<foldr(!0, add)> [1,2,3]
=> add (1, <foldr(!0, add)> [2,3])
=> add (1, add (2, <foldr(!0, add)> [3]))
=> add (1, add (2, add (3, <foldr(!0, add)> [])))
=> add (1, add (2, add (3, 0)))
=> 6
```

### Boolean Operators
Consider the following algebraic signature representing the abstract syntax of an expression language in Stratego:
```
signature
  constructors
    Var : String -> E
    Int : Int -> E
    Add : E * E -> E
    Mul : E * E -> E
    And : E * E -> E
    Or  : E * E -> E
    If  : E * E * E -> E
```
In this language integers are used to represent Boolean values, with `Int(0)` representing false and all other integers representing true. The Boolean operators `And` and `Or` are short-circuit operations.
1. Define in Stratego a desugaring transformation to eliminate the `And` and `Or` operators.
```
And (e1, e2) -> If (e1, e2, Int(0))
Or (e1, e2) -> If (e1, e1, e2)
```
2. Give the term resulting from desugaring the term `And(Var("x"), Or(Int(1), Var("y")))`
```
And(Var("x"), Or(Int(1), Var("y")))
=> If (Var("x"), Or(Int(1), Var("y")), Int(0))
=> If (Var("x"), If (Int(1), Int(1), Var("y")), Int(0))
```
3. Define in Stratego a strategy that, given a transformation that maps variables to expressions, applies this transformation to all variables in an expression; use only basic operators.
```
bottomup(s) = all(bottomup(s)); s
```
4. Define in Stratego a constant folding transformation for desugared expressions.
```
s: Plus(Int(i1), Int(i2)) -> Int(i3) where <addS> (i1, i2) => i3
bottomup(try(s))
```

### Function Application
Consider the following algebraic signature representing the abstract syntax of an expression language in Stratego:
```
signature
  constructors
    Var : String -> E
    Fun : List(String) * E -> E // n-ary function literal ('lambda')
    App : E * List(E) -> E      // n-ary function application
```
The language consists of variables (`Var`), n-ary function literals (`Fun`), and n-ary function applications (`App`). For example, the expression
```
    App(Fun(["x", "y"], Var("x")), [Var("a"), Var("b")])
```
is the application of a binary function to two argument expressions.
1. Functions with two or more arguments can be turned into nested functions with just one argument. This is known as currying. Define in Stratego a transformation (rules and strategy) to curry function literals and function applications in the language above. The resulting terms should be well-formed wrt the signature of expressions above. If you use a traversal strategy, provide its definition as well.
```
curry:
    Fun([s1 ,s2 | s3], body) -> Fun([s1], body')
    where
        body' := Fun([s2 | s3], body)

curry: 
    App(Fun([s1], body), [e1 ,e2 | e3]) -> App(App(Fun([s1], body),[e1]), [e2 | e3])  
innermost(curry)
```
2. Give the term resulting from currying the term
```
App(Fun(["x", "y"], Var("x")), [Var("a"), Var("b")])
```
```
App(Fun(["x", "y"], Var("x")), [Var("a"), Var("b")])
=> App(App(Fun(["x", "y"], Var("x")), Var("a")), Var("b"))
=> App(App(Fun("x", Fun("y", Var("x"))), Var("a")), Var("b"))
```
3. A variable in an expression is free if it is not bound by the parameter of a surrounding function literal. Define in Stratego a strategy freevars that produces the free variables of an expression.
TBD
4. Stratego rules are themselves subject to desugaring to a core language of basic transformation operations. Desugar the following Stratego rule:
```
rules

  Beta : App(Fun([x], e1), [e2]) -> <alltd((Var(x) -> e2))>e1
```
```
rules

  Beta : ?App(Fun([x], e1), [e2]); !e1; alltd((Var(x) -> e2))
```

### For
Consider the following algebraic signature representing the abstract syntax of an expression language in Stratego:
```
signature
  constructors
    Var    : ID -> E             // x
    Int    : Int -> E            // i
    Plus   : E * E -> E          // e + e
    Lt     : E * E -> E          // e < e
    Assign : ID * E -> E         // x := e
    Seq    : E * E -> E          // e ; e
    While  : E * E -> E          // while(e) { e }
    For    : ID * E * E * E -> E // for(i := e to e) { e }
```
The concrete syntax in comments shows the mapping to the common programming language constructs.

The `For(x, e_from, e_to, e_body)` construct is a loop that initializes the loop iteration variable `x` to the value of the `e_from` expression and then executes `e_body`, incrementing `x` on each iteration as long as it is smaller than `e_to.`

For example, the following program computes the sum of integers from $0$ to $9$:
```
Seq(
 Assign("sum", Int(0)),
 For("x", Int(0), Int(10),
   Assign("sum", Plus(Var("sum"), Var("x")))
 )
)
```
1. The `For` loop can be expressed as a `While`loop. Give the term resulting from desugaring the sum program above.
```
Seq(
    Assign("sum", Int(0)),
    Seq(
        Assign("x", Int(0)),
        While(Lt(Var("x"), Int(10)),
            Assign("sum", Plus(Var("sum"), Var("x"))))     
    )
)
```
2. Define in Stratego a transformation (rules and strategy) to desugar for loops to while loops in the language above. The resulting terms should be well-formed wrt the signature of expressions above. If you use a traversal strategy, provide its definition as well.
```
s: For(x, e_from, e_to, e_body) -> Seq(Assign(Var(x), e_from), While(Lt(Var(x), e_to), e_body))

topdown(s) = s ; all(topdown(s)) 
strategy: topdown(try(s))
```
3. Stratego rules are themselves subject to desugaring to a core language of basic transformation operations. Desugar the following Stratego rule:
```
rules

  Eval : Plus(Int(i), Int(j)) -> Int(<plus>(i, j))
```
```
rules

  Eval : ?Plus(Int(i), Int(j)); !(Int(<plus>(i, j))
```

### RE to CFG
TBD