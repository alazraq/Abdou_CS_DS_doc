# RLlib Training APIs

At a high level, RLlib provides an Trainer class which holds a policy for environment interaction. 
Through the trainer interface, the policy can be trained, checkpointed, or an action computed. 
In multi-agent training, the trainer manages the querying and optimization of multiple policies at once.

