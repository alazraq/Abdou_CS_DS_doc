Serialization
#############

Serialization is the process of converting an object into a stream of bytes to store the object (to a hard disk for example) or transmit it over the network. 
Its main purpose is to save the state of an object when transmitting it between services in order to be able to recreate it when received. 
The reverse process is called deserialization.

In this article, I will focus on Protocol Buffers (Protobuf) which is a mechanism of serializing data developped by Google because it is the one I used the most, but other methods exist.

.. toctree::

   Protocol_Buffers