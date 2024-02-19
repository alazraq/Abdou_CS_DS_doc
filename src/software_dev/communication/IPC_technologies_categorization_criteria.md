# IPC technologies categorization criteria

Different IPC technologies have been developped to accomodate for different software requirements, such as performance, modularity, and system circumstances such as network bandwidth and latency.

We can categorize IPC technologies according to different criteria, the most important of which would be:
## Synchronous or asynchronous 

### Synchronous, Request/Response IPC

#### REST

- **Cautionary note:** REST is meant for text and communication over HTTP. Moreover HTTP is an application layer protocol. We definitely don't need an Application Layer protocol to have Inter Node Communication (aka Inter Process Communication in the context of the domain). So some might consider REST no to be an IPC because it operates in th Application Layer, as opposed to the Network layer.

#### Thrift

### Asynchronous, Message‑Based Communication


- Point-to-point or multipoint
- Message formats