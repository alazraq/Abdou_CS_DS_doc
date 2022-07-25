# Background on PPO

## Quick reminder on the definition of a policy with respect to a MDP

- With formal terminology, we define a policy Π in terms of the Markov Decision Process to which it refers. A **Markov Decision Process is a tuple of the form (S, A, P, R)**, where S is the state space, A is the action space, P is the matrix containing the probabilities of transition to a state given a previous state and an action Pr(s' | s, a) and the fourth element R(s) comprises the reward function for the agent. It takes as input the state of the agent and outputs a real number that corresponds to the agent’s reward.
- A **policy Π(s) comprises the suggested actions that the agent should take for every possible state s ∈ S**. If we simplify slightly the notation, we can indicate a policy as a sequence of actions starting from the state of the agent at s_0 up to a terminal state if any.
- There are many types of policies: 
    - Deterministic policy, usually denoted µ: a_t = µ(s_t)
    - Stochastic policy, usually denoted by Π: a_t ~ Π(. | s_t).
    - Parameterized policy (in deep RL): policies whose outputs are computable functions that depend on a set of parameters (eg the weights and biases of a neural network) which we can adjust to change the behavior via some optimization algorithm. We often denote the parameters of such a policy by \theta or \phi, and then write this as a subscript on the policy symbol to highlight the connection: a_t &= µ_θ(s_t) or a_t ~ Π_θ(. | s_t).

Because the policy is essentially the agent’s brain, it’s not uncommon to substitute the word “policy” for “agent”, eg saying “The policy is trying to maximize reward.”

## Value function estimation methods vs Policy gradient methods in RL

### Value function estimation methods

- Traditional reinforcement learning approaches allow an agent to determine its behavior in an environment by **estimating the long-term expected value of each possible action given a particular state**.
- Algorithms such as **Q-Learning and Sarsa** work by estimating this underlying value function, and choosing actions based on the highest estimated value.
- Sutton et al. (1999) point out some of the **theoretical drawbacks of value function estimation**. Most implementations **lead to deterministic policies even when the optimal policy is stochastic**, meaning that stochastic (probabilistic) policies are ignored even when they would produce superior performance.
