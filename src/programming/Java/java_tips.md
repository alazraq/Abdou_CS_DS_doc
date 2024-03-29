# Programming in Java tips:

- Varargs: Let you pass any numberof arguments of a specific type to a method. Ex: public EndingThread(Closeable... toClose)
- JVM Shutdown Hook in Java: Shutdown Hooks are a special construct that allow developers to plug in a piece of code to be executed when the JVM is shutting down. Ex:

  ```java
  public class ShutDownHook 
  { 
    public static void main(String[] args) 
    { 
    
      Runtime.getRuntime().addShutdownHook(new Thread() 
      { 
        public void run() 
        { 
          System.out.println("Shutdown Hook is running !"); 
        } 
      }); 
      System.out.println("Application Terminating ..."); 
    } 
  } 
  ```

Output:

  ```
  Application Terminating ...
  Shutdown Hook is running !
  ```
- Volatile variables: Variables that are going to be modified by different threads

- thread.start(); -> the JVM calls the run method of the Thread
  thread.isAlive(); -> true if the Thread has been started and hasn't died yet

- Deque in Java: The Java Deque interface, java.util.Deque , represents a double ended queue, meaning a queue where you can add and remove elements from both ends of the queue.

- Java 2D Geometry library: JTS Topology Suite is an open-source Java software library that provides an object model for Euclidean planar linear geometry together with a set of fundamental geometric functions. JTS is primarily intended to be used as a core component of vector-based geomatics software such as geographical information systems.