# Programming paradigms
## Definition
A **programming paradigm** is a style of building the structure and elements of computer programs.

## List of programming paradigms

See https://en.wikipedia.org/wiki/Programming_paradigm and https://en.wikipedia.org/wiki/Comparison_of_multi-paradigm_programming_languages for further info
- Action
- Agent-oriented
- Array-oriented
- Automata-based
- Concurrent computing
    - Relativistic programming
- Data-driven
- Declarative (contrast: Imperative)
    - Functional
        - Functional logic
        - Purely functional
    - Logic
        - Abductive logic
        - Answer set
        - Concurrent logic
        - Functional logic
        - Inductive logic
    - Constraint
        - Constraint logic
            - Concurrent constraint logic
    - Dataflow
        - Flow-based
        - Reactive
    - Ontology
- Differentiable
- Dynamic/scripting
- Event-driven
- Function-level (contrast: Value-level)
    - Point-free style
        - Concatenative
- Generic
- Imperative (contrast: Declarative)
    - Procedural
    - Object-oriented
        - Polymorphic
- Intentional
- Language-oriented
    - Domain-specific
- Literate
- Natural-language programming
- Metaprogramming
    - Automatic
        - Inductive programming
    - Reflective
        - Attribute-oriented
    - Macro
    - Template
- Non-structured (contrast: Structured)
    - Array
- Nondeterministic
- Parallel computing
    - Process-oriented
- Probabilistic
- Quantum
- Set-theoretic
- Stack-based
- Structured (contrast: Non-structured)
    - Block-structured
        - Structured concurrency
    - Object-oriented
        - Actor-based
        - Class-based
        - Concurrent
        - Prototype-based
        - By separation of concerns:
            - Aspect-oriented
            - Role-oriented
            - Subject-oriented
        - Recursive
- Symbolic
- Value-level (contrast: Function-level)

## Description of the most important paradigms:
### Declarative vs Imperative
- **Imperative programming:** programming paradigm that uses statements (ex: assignment, call, loops) that change a program's state (remembered information from receding events or user interactions). An imperative program consists of commands for the computer to perform just like the imperative mood in languages. Imperative programming focuses on describing how a program operates.
- **Declarative programming:** programming paradigm that expresses the logic of a computation without describing its control flow. Many languages that apply this style attempt to minimize or eliminate side effects (change of state) by describing what the program must accomplish in terms of the problem domain (expressions and declarations), rather than describe how to accomplish it as a sequence of statements (the how being left up to the language's implementation). This is in contrast with imperative programming, which implements algorithms in explicit steps. Declarative programming may greatly simplify writing parallel programs. Common declarative languages include those of database query languages (e.g., SQL), regular expressions, logic programming and functional programming.
### Important declarative programming paradigms:
- **Functional Programming**
A declarative programming paradigm that treats computation as the evaluation of mathematical functions and avoids changing-state and mutable data. Programming is done with expressions or declarations instead of statements. In functional code, the output value of a function depends only on its arguments, and not on the global program state unlke imperative programming. (In FunProg, same input to fct -> same result) Eliminating side effects, that is, changes in state that do not depend on the function inputs, can make understanding a program easier, which is one of the key motivations for the development of functional programming. Functional programming has its origins in lambda calculus, and many functional programming languages can be viewed as elaborations on the lambda calculus.
- **Logic Programming**
    - Logic programming is a declarative programming paradigm largely based on formal logic. 
    - Any program written in a logic programming language is a set of sentences in logical form, expressing facts and rules about some problem domain.
        - Rules: "H :- B1, …, Bn." meaning H if B1 and … and Bn. H is called the head of the rule and B1, ..., Bn is called the body. 
        - Facts: "H." rules that have no body.
    - Major logic programming language families include Prolog, answer set programming (ASP) and Datalog.
### Object-oriented proramming:
Object-oriented programming (OOP) is a programming paradigm based on the concept of "objects", which can contain data, in the form of fields (often known as attributes or properties), and code, in the form of procedures (often known as methods). A feature of objects is an object's procedures that can access and often modify the data fields of the object with which they are associated (objects have a notion of "this" or "self"). In OOP, computer programs are designed by making them out of objects that interact with one another.[1][2] OOP languages are diverse, but the most popular ones are class-based, meaning that objects are instances of classes, which also determine their types. Many of the most widely used programming languages (such as C++, Java, Python, etc.) are multi-paradigm and they support object-oriented programming to a greater or lesser degree