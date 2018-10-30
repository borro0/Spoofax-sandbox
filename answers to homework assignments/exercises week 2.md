Exercises week 2

### Syntax trees
1. Why do we need syntax trees when constructing compilers?
It is a format which the compiler can work with, simple plain will not suffice.
2. What are the fundamental differences between parse trees and abstract syntax trees?
Parse trees are a direct reprensentation of the input text. It retains all information.
Where abstract syntax trees are an abstract representation of the input in which certain information is left out such as parenthesis and whitespaces.
3. How can we represent trees as terms? Illustrate your explanation with an example.
```
If(
 Lt(Var("n"), Int("1"))
, Int("1")
, Times(
  Var("n")
   , Call("fact", [Minus(Var("n"), Int("1"))])
 )
)
```

### Testing syntax definitions
1. Why does testing a syntax definition require more than a collection of example programs?
You don't only want to test for the happy case. You also want to test for erronous example programs, because else your syntax definition may be too liberal.
2. What is the use of a domain-specific testing language for syntax definition (e.g. compared to a programmatic unit testing framework)?
In this way you detect errors in an early stage. This also requires less effort than programmatic unit testing.
3. What does it mean that SPT is language parametric?
It means that it is not specific for a certain language, it can be used for any language designed in spoofax.
4. You can write some test cases, write small portion of your desired language and test if it works. Then you can continue this iterative / interactive process.

### Abstract Syntax from Concrete Syntax
1. Given the following syntax definition, define the algebraic signature defining its abstract syntax.
```
Signature
  sorts Value NameValue
  constructors
  Num:      Number -> Value
  Object:   List(NameValue) -> Value
  Array:    List(Value) -> Value
  True:     Value
  False:    Value
  Null:     Value

  NV:       String * Value -> NameValue
```
2. What is the abstract syntax term for the following program in this language
```
Object
([
    NV
    (
        String("x"),
        Number(42)
    ),
    NV
    (
        String("y"),
        Number(0)
    ),
    NV
    (
        String("name"),
        String("point")
    ),
    NV
    (
        String("color"),
        Array
        ([
            Number(3.2),
            Number(5.6),
            Null
        ])
    ),
    NV
    (
        String("visible"),
        False
    )
])
```

### Templates
Consider SDF3 template productions as discussed in Lecture 3.

1. Enumerate the syntactic differences between pure context-free grammar productions and SDF3 template productions
SDF3 template functions also records the layout in which you define your grammar.
2. Discuss the purpose of these features
- Can be used for code generation; pretty-printing generated AST
- Syntactic completions
- Formatting

### Syntactic Completion
Read the paper “Principled syntactic code completion using placeholders” and summarize its approach to syntactic code completion.

1. What mechanisms are used to realize code completion?
Make incompleteness explicit, part of the structure
2. What properties are guaranteed by the approach?
When a certain statement is not complete, the program will infer a placeholder. In this way the program will remain correct, but incomplete.
3. How does this compare to code completion in IDEs such as Eclipse?
It gives more precice suggestions, it is derived from the language definition it self. Not manually written.
4. What features does and does it not support?
- Generating proposals
- Pretty-printing proposals