# Scala basics

## Useful resources

- Learning Scala by Jason Swartz: https://www.oreilly.com/library/view/learning-scala/9781449368814/ch09.html

## Importing

- Importing many classes from the same package

import com.typesafe.config.{Config, ConfigFactory}

## Loggers

- **Importation:**

> import org.slf4j.{Logger, LoggerFactory}

where Logger is an interface and LoggerFactory is a utility class producing Loggers for various logging APIs and has a method getLogger

- **Definition:** define inside your object or class:

> val logger: Logger = LoggerFactory.getLogger(classOf[Main])

- **Usage:**

> logger.info("Setting up instance...")

- **Changing logging level: info, debug...**

Change level in logback.xml
    <root level="debug">
        <appender-ref ref="CLOUD" />
        <appender-ref ref="STDOUT" />
    </root>

## Classes, Objects, Case classes, and Traits

### Classes

Classes are the core building block of object-oriented languages, a combination of data structures with functions (“methods”). A class defined with values and variables can be instantiated as many times as needed, each one initialized with its own input data. With inheritance classes can extend other classes, creating a hierarchy of subclasses and superclasses.

### Objects

An object is a type of class that can have no more than one instance, known in object-oriented design as a singleton. Instead of creating an instance with a new keyword, just access the object directly by name.

When is it instanciated?  An object gets automatically instantiated the first time it is accessed in a running JVM, which also means that until it is accessed the first time it won’t get instantiated.

- Syntax object <identifier> [extends <identifier>] [{ fields, methods, and classes }]
- Ex: 
> object Hello { println("in Hello"); def hi = "hi" }
> println(Hello.hi) // initialization occurs when accessed for first time
> println(Hello.hi) // no initialization, same object is used

#### The "factory pattern" and companion objects:
- **Companion object of a class:**
A companion object is an object that shares the same name as a class and is defined together in the same file as the class. Having a companion object for a class is a common pattern in Scala, but there is also a feature from which they can benefit. Companion objects and classes are considered a single unit in terms of access controls, so they can access each other’s private and protected fields and methods.
- **Factory pattern:**
Using the apply method (see below) in a companion object to generate instances of the class instead of writing new.

- Ex:

scala> :paste
// Entering paste mode (ctrl-D to finish)

class Multiplier(val x: Int) { def product(y: Int) = x * y }

object Multiplier { def apply(x: Int) = new Multiplier(x) }

// Exiting paste mode, now interpreting.

defined class Multiplier
defined object Multiplier

scala> val tripler = Multiplier(3)
tripler: Multiplier = Multiplier@5af28b27

scala> val result = tripler.product(13)
result: Int = 39


### apply method

Methods named “apply,” sometimes referred to as a default method or an injector method, can be invoked without the method name. The apply method is essentially a shortcut, providing functionality that can be triggered using parentheses but without a method name.

- Example:

scala> class Multiplier(factor: Int) {
     |   def apply(input: Int) = input * factor
     | }
defined class Multiplier

scala> val tripleMe = new Multiplier(3)
tripleMe: Multiplier = Multiplier@339cde4b

scala> val tripled = tripleMe.apply(10)
tripled: Int = 30

scala> val tripled2 = tripleMe(10)
tripled2: Int = 30

### Case Classes

A case class is an instantiable class that includes several automatically generated methods. It also includes an automatically generated companion object with its own automatically generated methods. All of these methods in the class and in the companion object are based on the class’s parameter list, with the parameters being used to formulate methods like an equals implemention that iteratively compares every field, a toString method that cleanly prints out the class name and all of its field values, an apply factory method to instanciate the case class, a copy method and unapply methos which extracts the instance into a tuple of its fields, making it possible to use case class instances for pattern matching.

- When to use a case class?

    Use case classes for data transfer objects, the kind of classes that are mainly used for storing data, but don't use for inheritance.   

- Syntax:
    case class <identifier> ([var] <identifier>: <type>[, ... ])
                        [extends <identifier>(<input parameters>)]
                        [{ fields and methods }]

- Example:
scala> case class Character(name: String, isThief: Boolean)
defined class Character

scala> val h = Character("Hadrian", true) // use of apply factory method of companion object             
h: Character = Character(Hadrian,true) // clean toString zhen printing the instance                

// Example of use of unapply method
scala> h match {
     |   case Character(x, true) => s"$x is a thief"      
     |   case Character(x, false) => s"$x is not a thief"
     | }
res1: String = Hadrian is a thief  

### Inner classes:
Classes defined inside classes or objects:

Example:

    // Definition
    class Graph {
    class Node {
        var connectedNodes: List[Node] = Nil
        def connectTo(node: Node): Unit = {
        if (!connectedNodes.exists(node.equals)) {
            connectedNodes = node :: connectedNodes
        }
        }
    }
    var nodes: List[Node] = Nil
    def newNode: Node = {
        val res = new Node
        nodes = res :: nodes
        res
    }
    }

    // Usage
    val graph1: Graph = new Graph
    val node1: graph1.Node = graph1.newNode
    val node2: graph1.Node = graph1.newNode
    val node3: graph1.Node = graph1.newNode
    node1.connectTo(node2)
    node3.connectTo(node1)


## Lazy Values
Lazy values, however, are only created the first time they are instantiated. You can create a lazy value by adding the keyword lazy before the val keyword when defining a value.

- Example:

scala> class RandomPoint {
     |   val x = { println("creating x"); util.Random.nextInt }
     |   lazy val y = { println("now y"); util.Random.nextInt }
     | }
defined class RandomPoint

scala> val p = new RandomPoint()
creating x
p: RandomPoint = RandomPoint@6c225adb

scala> println(s"Location is ${p.x}, ${p.y}")
now y
Location is 2019268581, -806862774

scala> println(s"Location is ${p.x}, ${p.y}")
Location is 2019268581, -806862774