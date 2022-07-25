# Recurring concepts in computer science

- **API:** An application programming interface (API) is a computing interface to a software component or a system, that defines how other components or systems can use it. It defines the kinds of calls or requests that can be made, how to make them, the data formats that should be used, the conventions to follow, etc.

Remarks:

    - An API can be entirely custom, specific to a component, or it can be designed based on an industry standard to ensure interoperability.
    - Some APIs have to be documented, others are designed so that they can be "interrogated" to determine supported functionality. 
    - Since other components/systems rely only on the API, the system that provides the API can (ideally) change its internal details "behind" that API without affecting its users.

- **Bootstraping (booting):** In general, bootstrapping usually refers to a self-starting process that is supposed to proceed without external input. In computer technology the term (usually shortened to booting) usually refers to the process of loading the basic software into the memory of a computer after power-on or general reset, especially the operating system which will then take care of loading other software as needed.

- **Regular expression (regex):** A regular expression, regex or regexp is a sequence of characters that define a search pattern. Usually such patterns are used by string searching algorithms for "find" or "find and replace" operations on strings, or for input validation.

- **Stateless vs Stateful applications:** A Stateless app is an application program that does not store data on the host; it does not save client data generated in one session for use in the next session with that client. A Stateful application saves data about each client session and uses that data the next time the client makes a request, so it requires some kind of storage on the host who serves the requests.
Please note that not all applications that store some data are stateful.
For example, a microservice (scheduler) that stores data on a DB for future use of that data for the same instance of that microservice later on is NOT stateful.
On the other hand, a microservice (coordinator) that stores critical data on a DB so that if the instance fails, a new instance of the microservice can fetch that data and work with it is stateful. 