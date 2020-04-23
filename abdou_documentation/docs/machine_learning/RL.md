# Reinforcement Learning

## Goal

Learn to make good sequences of decisions.

## What is special about RL?

Reiforcement learning involves:

- **Optimization:** find optimal way to make decisions, yielding best outcomes, or at least a very good strategy. Maximizing a numerical reward over time.
- **Delayed consequences:** decisions can impact things much later.
- **Exploration:** An RL agent learns about the environment by trial-and-error (Not entirely supervised, but interactive).
- **Generalization:** We can't just preprogram a policy because the set of possibles states is usually extremely big. This is why RL is a multi-stage decision-making process (often Markovian: P(X_{n+1}=x \ X_{0},X_{1},X_{2},... ,X_{n})=P(X_{n+1}=x \ X_{n}).


## Concepts:

- **Policy:** mapping from state space to action space, may be stochastic
- **Reward function:** 
