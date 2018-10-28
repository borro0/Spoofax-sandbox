Week6

1. What are types?
```
Static classification of expressions which approximate the runtime value they may produce
```
2. Where do they play a role in the compiler?
```
Check that a program is well-typed.
Resolve names, and check or compute types.
Report usefull error messages.
Provide a representation of name and type information
```
3. How do types related to earlier and later steps in the compiler pipeline?
```
In erlier steps, types are used for typechecking. In later steps, types are used for optimization, code generation and error reporting.
```
4. what is the importance of a rich – more expressive – type system?
```
Richer types approximate runtime behavior better. Richer types may encode correctness properties beyond runtime crashes.
```
5. Explain the main aspects of type checking with constraints. Discuss how the different parts of your answer are related to the object language the checker is for.
```
Type check with constraints contain two phases: the first phase is constrain generation. This phase is language dependent (name resolution, type equality). The second phase is contrain resolution. This phase is language independent.
```