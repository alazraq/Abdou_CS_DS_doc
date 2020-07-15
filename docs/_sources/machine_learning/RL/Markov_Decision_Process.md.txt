 # Markov Decision Process (MDP)

 We introduce Markov Decision processes as a formal way to model sequential decision making to frame our RL problems (where does RL data come from? an MDP). We already defined the notions of Agent - Environment - State - Action and Reward in the introduction, please refer to these definitions if needed.

## Components Of an MDP


There are 4 components in a Markov Decision Process:

1. **S** - set of states
2. **A** - set of actions
3. $R(s,a) : S \times A -> \mathbb{R}$ - the reward function
4. **P(s'/ s, a)** - transition probability which is the probability of transitioning (at time t) from state s to state s' under action a.


In an MDP, we have a decision maker, called an agent, that interacts with the environment it's placed in. 
These interactions occur sequentially over time. 
At each time step, the agent will get some representation of the environment’s state s in S the set of states. 
Given this representation, the agent selects an action to take among a set A of possible actions. 
The environment is then transitioned into a new state according to the transion probabilities, and the agent is given a reward as a consequence of the previous action determined by the reward function.
We call the succession of (state, action, reward) a trajectory.

## MDP Notation