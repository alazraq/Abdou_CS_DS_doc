# Multi-agent Reinforcement Learning (MARL)

- **Definition of MARL:** Multi-agent reinforcement learning (MARL) addresses the sequential decision making problem of **multiple autonomous agents that operate in a common environment.** Each agent attempts to optimize the long-term return by interacting with the environment and other agents.

- **Types of MARL applications:** MARL applications into fall into three main groups: **cooperative, competitive, or a mixture of both**.
    - In the **cooperative setting**, agents attempt to collaborate to optimize a common long-term goal. 
    - In **competitive settings**, the global reward often sums to zero, since agents can only improve their policy at another agent’s expense. This situation is common in domains that include price bidding (optimize something while spending the least amount of money possible) like advertising. 
    - Finally, the environment may contain **a mixture of the previous two situations**. For example, an advertisement marketplace wants to maximize both global revenue and long-term user engagement, which means that a cooperative model would be optimal, but advertisers want to pay the least amount of money for the highest impact, which adds a competition into the environment.

- **MARL Frameworks:** (see MARL frameworks figure)
    - **Markov Game (MG):** multiple agents operate in parallel, submiting unique actions and receive unique rewards, but the state of the environment is global. This is the most obvious extension to an MDP, in the context of RL. Example: traffic lights.
    - **Extensive-form game (EFG):** agents act sequentially one after the other, and alter the environment through their actions. Chance (initial state), state, and actions are represented as a tree, Example: Poker.

- **Centralized vs Decentralized:** 
    - In **centralised learning**,  experiences are fed back to a single learner and policies are returned for local execution.
    - In a **decentralized model**, both the execution and the learning happen locally. Benefits:
        - Scalability
        - Local learning allows agents to adapt to their local perception of the environment
        - Allows you to use standard single-agent RL algorithms, because you can treat each agent independently.

