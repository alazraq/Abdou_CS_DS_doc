# Scala unit testing

This is a quick guide to get you started with unit testing in Scala using the ``Scalatest`` library.
For more details, please refer to the [Scalatest library user guide](http://www.scalatest.org/user_guide/).

## Writing your first test using Scalatest

In ScalaTest, you define tests inside classes that extend a style class such as ``AnyFlatSpec`` (you could also implement and extend your own base style class):

```Scala
import org.scalatest.flatspec.AnyFlatSpec

class FirstSpec extends AnyFlatSpec {
  // tests go here...
}
```

Each test in a AnyFlatSpec is composed of two things: 
- A sentence that specifies a bit of required behavior and 
- A block of code that tests it. 

The sentence needs a subject, such as "A Stack"; a verb, either should, must, or can; and the rest of the sentence. Here's an example: ``"A Stack" should "pop values in last-in-first-out order"``

If you have multiple tests about the same subject, you can use the keyword ``it`` to refer to the previous subject: ``it should "throw NoSuchElementException if an empty stack is popped"``
After the sentence you put the word in followed by the body of the test in curly braces. Here's a complete example:

```Scala
import collection.mutable.Stack
import org.scalatest.flatspec.AnyFlatSpec

class StackSpec extends AnyFlatSpec {

    "A Stack" should "pop values in last-in-first-out order" in {
        val stack = new Stack[Int]
        stack.push(1)
        stack.push(2)
        assert(stack.pop() === 2)
        assert(stack.pop() === 1)
    }

    it should "throw NoSuchElementException if an empty stack is popped" in {
        val emptyStack = new Stack[String]
        assertThrows[NoSuchElementException] {
            emptyStack.pop()
        }
    }
}
```

If you are using Inlellij Idea, you can then launch the test, the code gets compiled and you will be to see the results in a dedicated pane.

If you wish to compile the test and run it yourself from command line, please refer to the user guide linked in the beginning of this short article.