Introduction to RL
******************

Goal
----

In a setting of **sequential decision making** where an agent interacts
with the world (an environment) by performing consecutive actions and receiving an observation and a
reward back everytime an action is performed, the goal of reinforcement learning is to **learn how to select actions** in order to maximize the **total cumulative expected future reward**.

In more specific terms (see concepts below), the precise goal of RL is to find
a policy that maximizes the value function (total expected future
reward).

Using a game as an example of an environment, reinforcement learning is concerned with how the player of the game (the agent) can take actions, like making a move in a certain direction, in order to maximize its total expected future reward, which in a game setting, might be points by the end of the game.

What is special about RL?
-------------------------

Reiforcement learning involves:

-  **Optimization:** find optimal way to make decisions, yielding best
   outcomes, or at least a very good strategy. Maximizing a numerical
   reward over time.
-  **Delayed consequences:** decisions can impact things much later.
   Balancing of immediate and long-term rewards may be required and a
   strategic behaviour might need to be adopted.
-  **Exploration:** An RL agent learns about the environment by
   trial-and-error (Not entirely supervised, but interactive).
-  **Generalization:** We can’t just preprogram a policy because the set
   of possibles states is usually extremely big. This is why RL is a
   multi-stage decision making process (often **Markovian**: The future
   is independent of the past given the present or :math:`P(X_{n+1}=x \
    X_{0},X_{1},X_{2},… ,X_{n})=P(X_{n+1}=x \ X_{n}`).

Concepts - Elements of RL:
--------------------------

-  **Agent:** The decision maker.
-  **Environment:** The world with wich the agent interacts.
-  **State:** At each time step, the agent will get some representation of the environment’s state.
-  **Set of states:** S The set of all possible states of the environment (might be infinite).
-  **Action:** Given the state of the environment, the agent selects an action to take. 
-  **Set of actions:** A The set of all possible actions the agent can take at any given state.
-  **Policy:** mapping from state space to action space, may be stochastic (see transition probabilities in MDP)
-  **Reward function:** mapping from each state action pair, to a real number, called reward.
-  **Value function:** a mapping from a state or state action pair to the total expected future reward (we don't have access to this function).

How to achieve this Goal?
-------------------------

There are two main approaches to the solve the problem of learning a policy telling an agent what action to take under what circumstances.

- Approach 1: Value Iteration and Policy Iteration
   
   Essentially, both approaches are **dynamic programming**, breaking down a complicated problem into simpler ones in a recursive manner.


- Approach 2: Q-Learning and its variants.

   A more recent approach to the problem, and a temporal difference learning method. Deep Q-Learning is a variant of Q_learning making use of convolutional neural networks.


Deep Q-Learning:


RL in Python
------------

Gym library
~~~~~~~~~~~

Gym is a toolkit for developing and comparing reinforcement learning algorithms.

The gym library is a collection of test problems — environments — that you can use to work out your reinforcement learning algorithms. These environments have a shared interface, allowing you to write general algorithms.


