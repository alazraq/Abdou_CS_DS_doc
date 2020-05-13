# Reinforcement Learning (RL)

## Goal

In a setting of **sequential decision making** where an agent interacts with the world by performing actions and receiving an observation and a reward back, learn how to select actions to maximize total expected future reward.

In more specific terms (see concepts below), the precise goal is to find a policy that maximizes the value function  (total expected future reward).

## What is special about RL?

Reiforcement learning involves:

- **Optimization:** find optimal way to make decisions, yielding best outcomes, or at least a very good strategy. Maximizing a numerical reward over time.
- **Delayed consequences:** decisions can impact things much later. Balancing of immediate and long-turm reward may be required and a strategic behaviour might need to be adopted.
- **Exploration:** An RL agent learns about the environment by trial-and-error (Not entirely supervised, but interactive).
- **Generalization:** We can't just preprogram a policy because the set of possibles states is usually extremely big. This is why RL is a multi-stage decision making process (often **Markovian**: The future is independent of the past given the present or P(X_{n+1}=x \ X_{0},X_{1},X_{2},... ,X_{n})=P(X_{n+1}=x \ X_{n}$).


## Concepts - Elements of RL:

- **Policy:** mapping from state space to action space, may be stochastic
- **Reward function:** mapping from each state or state action pair, to a real number, called reward.
- **Value function:** a mapping from a state or state action pair to the total expected future reward.


## How to achieve this Goal?

### Approach 1: Value Iteration and policy iteration

