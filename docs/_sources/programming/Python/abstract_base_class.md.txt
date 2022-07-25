# Abstract base class (ABC)

For a comprehensive tutorial on Abstract Base Class in Python, please refer to this (link)[https://www.geeksforgeeks.org/abstract-base-class-abc-in-python/].

## Goals of an ABC 

The abstract base class (ABC) allows for three things:
- Provide a standardized way to test whether an object adheres to a given specification (using ``isinstance`` and ``issubclass``).
- Prevent any attempt to instantiate a subclass that doesn’t override a particular method in the superclass. 
- And finally, using an abstract class, a class can derive identity from another class without any object inheritance.

## Declaring an ABC

Python has a module called abc (abstract base class) that offers the necessary tools for crafting an abstract base class. 

Example:

```python
from abc import ABC, abstractmethod

class Agent(ABC):
    """
    Abstract class for an agent.
    """

    def __init__(self, name):
        self.name = name

    @abstractmethod
    def compute_action(self, observation: dict):
        """
        Computes an action for the given observation. The agent must have been loaded before.
        """
        pass
```


## ABC vs plain inheritance

- **Difference 1 - good-faith agreement (ABC) vs explicit contract (inheritance):** In the case of an ABC, the "good-faith agreement" is that the child object will follow the intention of the parent. The actual implementation of this agreement is left up to the developer, which is why it's a good-faith agreement, and not an explicit contract (you can technically register a class with an ABC while still not implementing the interface it lays out)
- **Difference 2 - not overriding all abstract methods:** If you try to instantiate a subclass of an abstract base class without overriding all abstract methods/properties, your program will fail loudly. However, if you use plain inheritance with NotImplementedError, your code won't fail until you actually invoke the method/property in question.
