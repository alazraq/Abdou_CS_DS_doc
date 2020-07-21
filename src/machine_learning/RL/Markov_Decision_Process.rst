Markov Decision Process (MDP)
=============================

:math:`\newcommand{\R}{\mathbb{R}}`

We introduce Markov Decision processes as a formal way to model
sequential decision making to frame our RL problems (where does RL data
come from? an MDP). We already defined the notions of Agent -
Environment - State - Action and Reward in the introduction, please
refer to these definitions if needed.

Components Of an MDP in mathematical notations
----------------------------------------------

There are 4 components in a Markov Decision Process:

1. :math:`S` - set of states
2. :math:`A` - set of actions
3. :math:`R(s,a) : S \times A -> \mathbb{R}` - the reward function
4. :math:`P(s'/ s, a)` - transition probabilities which are the
   probabilities of transitioning (at time t) from state s to state s’
   under action a.

A fifth component could be the discount factor :math:`\gamma`.

MDP model
---------

So here is the setup for an MDP:

-  In an MDP, we have a decision maker, called an agent, that interacts
   with the environment it’s placed in. These interactions occur
   sequentially over time.
-  At each time step, the agent will get some representation of the
   environment’s state s in S the set of states.
-  Given this representation, the agent selects an action to take among
   a set A of possible actions.
-  The environment is then transitioned into a new state according to
   the transion probabilities, and the agent is given a reward as a
   consequence of the previous action determined by the reward function.
   The deterministic case is when the transition always go as excpected:
   if action a is taken at state s then transition to s’ with
   probability 1. The bobdeterministic case is when this probability is
   not equal to 1 (like a robot can slip when taking the action and fall
   in another state than the one intended).
-  We call the succession of (state, action, reward) a trajectory.

So using our mathematical notations:

-  The agent starts at state :math:`s_0`
-  At each time :math:`t`, agent:

   -  observes state :math:`s_t \in S`
   -  then chooses an action :math:`a_t \in A`
   -  then receives reward :math:`r_t \in \R` from the environment where
      :math:`r_t = R(s_t , a_t)`
   -  and finally transitions to state :math:`s_{t+1} \in S` sampled
      from the transition probability :math:`s_{t+1} ~ P(./ s_t, a_t)`

-  The total payoff is
   :math:`(r_0 + \gamma r_1 + \gamma^2 r_2 + \gamma^3 r_3 + ...)` where
   :math:`\gamma` is the discount factor (:math:`0< \gamma <1`)

MDP Goal
--------

-  **Definition:** We execute policy :math:`\pi : S \to A` by taking
   action :math:`a = \pi(s)` when the agent is in state :math:`s`
-  The goal is to learn a policy :math:`\pi : S \to A` - for choosing an
   action when in any state - that maximizes the **infinite-horizon
   expected discounted reward**
   :math:`E[r_0 + \gamma r_1 + \gamma^2 r_2 + \gamma^3 r_3 + ...] = \sum_{t=0}^{\infty} \gamma^t E[r_t]`

Exploration vs Exploitation Trade-off
-------------------------------------

-  **Exploitation:** Exploiting the knowledge that you have of the
   system (ex: constantly going to slot machine 1 if it yielded the best
   results previously)
-  **Exploration:** Exploring something new even if previously observed
   results do not look promising (ex: trying slot machines 2 and 3 even
   if we lost some money in them before - or in the maze setting we
   might never reach +1000 if we keep going to +1 and don’t take any
   risk)
