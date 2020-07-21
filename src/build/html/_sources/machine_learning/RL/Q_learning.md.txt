# Q Learning

## Motivation

What id we don't know the rewards function $R(s,a)$ or the transition probabilities $P(s'/s,a)$ exhaustively? (we can query the environment by taking an action and receiving a reward and observing the next state, but we don't have access to the reward function or the probability distribution) Then the Value Iteration and Policy Iteration won't work, Q-Learning is the solution.

### Bellman optimality equation for Q*

$$Q_*(s, a) = R(s,a) + \gamma sum_{s'} p(s'/s,a) V_*(s')$$

and by applying $V_*(s') = max_{a'} Q_*(s',a')$ we get:

$$Q_*(s, a) = R(s,a) + \gamma sum_{s'} p(s'/s,a) max_{a'} Q_*(s',a')$$

which is called the Bellman equation for $Q_*$, which is a recursive definition of $Q_*$.

PS: In a deterministic environment (transitions are not stochastic) the Bellman optimality equation for $Q_*$ becomes:
$$Q_*(s, a) = R(s,a) + \gamma max_{a'} Q_*(\delta(s,a) = s',a')$$

### Finding the optimal policy from $Q_*$

Once we have our optimal Q-function $Q_*$ we can determine the optimal policy by finding the action that maximizes  $Q_*$ for each state:
$$\pi^*(s) = argmax_a Q_*(s,a)$$

So if we can learn $Q_*(s,a)$, we can define the optimal policy $\pi^*$ without the need for $R(s,a)$ or $P(s'/s,a)$. In other words $Q_*(s,a)$ defines all we need to know about the optimal behaviour of the system.

