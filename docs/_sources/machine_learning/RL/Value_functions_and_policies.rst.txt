Value functions, Policies and optimality
========================================

Policies: How probable is it for an agent to select any action from a given state?
----------------------------------------------------------------------------------

A policy is an agent’s strategy. It is a function that maps a given
state to probabilities of selecting each possible action from that
state. We will use the symbol :math:`\pi` to denote a policy.

Informal example
~~~~~~~~~~~~~~~~

For example, imagine a world where a robot moves across the room and the
task is to get to the target point (x, y), where it gets a reward. Here:

-  A room is an environment

-  Robot’s current position is a state

-  A policy is what an agent does to accomplish this task:

   -  dumb robots just wander around randomly until they accidentally
      end up in the right place (policy #1)
   -  others may, for some reason, learn to go along the walls most of
      the route (policy #2)
   -  smart robots plan the route in their “head” and go straight to the
      goal (policy #3)

Obviously, some policies are better than others, and there are multiple
ways to assess them, namely state-value function and action-value
function. The goal of RL is to learn the best policy.

Formal definition of a policy
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

If :math:`(S, A, R(s,a), P(s'/ s, a), \gamma)` is an MDP, then a policy
:math:`\pi` is a probability distribution over actions given states.
That is :math:`\pi(a/s)` the probability that the agent takes action
:math:`a` when in state :math:`s`.

Alternate definition (CMU)
~~~~~~~~~~~~~~~~~~~~~~~~~~

We can separate stochasticity induced by the transition probabilities of
the environment :math:`P(s_{t+1}/ s_t, a_t)` and the actual policy that
we choose for our agent :math:`\pi` which is then deterministic in which
case at any given state :math:`s` the probability of taking a particular
action :math:`a` under the policy is 1. In that case we denote
:math:`\pi(s) =a`.

The **state trajectory** is
:math:`s_0 \xrightarrow{a_0 = \pi(s_0)} s_1 \xrightarrow{a_1 = \pi(s_1)} s_2 ...`

Value functions: How good is a state, or an action at a given state?
--------------------------------------------------------------------

Value functions are functions of states :math:`V_\pi(s)`, or of
state-action pairs :math:`Q_\pi(s,a)`, that estimate how good it is for
an agent to be in a given state, or how good it is for the agent to
perform a given action in a given state under a certain policy.

We don’t actually have access to those functions (the problem would be
easy then) and the goal of RL algorithms is to estimate the value
function in order to find the optimal policy that maximizes it for any
given state.

State-value function :math:`V_\pi(s)` and the Bellman equations (Value function)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The state-value function for policy :math:`\pi`, denoted as
:math:`V_\pi(s)`, and most commonly referred to as just value function,
tells us how good any given state is for an agent following policy
:math:`\pi`. In other words, it gives us the value of a state under
:math:`\pi`.

Formally, the value of state :math:`s` under policy :math:`\pi` is the
expected infinite-horizon expected discounted reward from starting from
state :math:`s` at time :math:`t` and following policy :math:`\pi`
thereafter. Mathematically we define :math:`V_\pi(s)` as:

.. math:: V_\pi(s) = E_{\pi, P(s'/ s, a)} [R(s_0, a_0) + \gamma R(s_1, a_1) + \gamma^2 R(s_2, a_2) + ... / s_0 = s] 

Ps: the trajectory (succession of states and actions) comes from policy
:math:`\pi` and the tansition probabilities, for example
:math:`a_0 = \pi(s_0=s)` and :math:`s_1 ~ P(./ s_0 =s, a_0=\pi(s))`.

Which after some manipulations gives the following recursive definition
for the state-value function.

.. math:: V_\pi(s) = R(s_0,a_0) + \gamma \sum_{s_1 \in S} P(s_1/ s_0, a_0) V_\pi(s_1) 

This is a system of :math:`|S|` equations and :math:`|S|` variables
called te **Bellman equations**.

Action-value function :math:`Q_\pi(s,a)` (Q-Function)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Similarly, the action-value function for policy :math:`\pi`, denoted as
:math:`Q_\pi(s,a)`, tells us how good it is for the agent to take any
given action from a given state while following policy :math:`\pi`. In
other words, it gives us the value of an action under :math:`\pi`.

Formally, the value of action :math:`a` in state :math:`s` under policy
:math:`\pi` is the expected infinite-horizon expected discounted reward
from starting from state :math:`s` at time :math:`t`, taking action
:math:`a`, and following policy :math:`\pi` thereafter. Mathematically,
we define :math:`Q_\pi(s,a)` as:

.. math:: Q_\pi(s,a) = E_{\pi, P(s'/ s, a)} [R(s_0, a_0) + \gamma R(s_1, a_1) + \gamma^2 R(s_2, a_2) + ... / s_0 = s, a_0 =a] 

Conventionally, the action-value function :math:`Q_\pi(s,a)` is referred
to as the **Q-function**, and the output from the function for any given
state-action pair is called a **Q-value**. The letter “Q” is used to
represent the quality of taking a given action in a given state.

Optimality
----------

Optimal policy
~~~~~~~~~~~~~~

-  A policy :math:`\pi` is considered to be better than or the same as
   policy :math:`\pi'` if the expected return of :math:`\pi` is greater
   than or equal to the expected return of :math:`\pi'` for all states.
   In other words,

   .. math:: \pi \geq \pi' \iff V_\pi(s) \geq V_{\pi'}(s)  \forall s \in S

   \ Remember that :math:`V_\pi(s)` gives the expected return for
   starting in state s and following policy :math:`\pi` thereafter and
   is called the state-value function of s.

-  Using this definition, the optimal policy, denoted :math:`\pi^*` is
   the one which gives better or at least the same state-value
   :math:`V_\pi(s)` for every at :math:`s \in S`.

   .. math:: \pi^* = argmax(V_\pi(s)) \forall s \in S

Optimal state-value function
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The optimal state-value function :math:`V_{\pi^*}` or simply :math:`V_*`
is the one corresponding to the optimal policy :math:`\pi^*` and that
assigns a larger state-value than any other state-value function
:math:`V_{\pi}` to every state :math:`s \in S`. Or in other words
:math:`V_*` gives the largest expected reward achievable by any policy
:math:`\pi` for each state.

.. math:: V_*(s) = max_\pi(V_\pi(s)) \forall s \in S

Optimal action-value function
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Similarly, the optimal policy has an optimal action-value function, or
optimal Q-function, which we denote as :math:`Q_*` and define as

.. math:: Q_*(s, a) = max_\pi(Q_\pi(s,a)) \forall s \in S \: and \: a \in A(s)

In other words, :math:`Q_*(s, a)` gives the largest expected return
achievable by any policy :math:`\pi` for each possible state-action
pair.

The link between the optimal state-value function and the optimal
Q-function is:

.. math:: V_*(s) = max_a Q_*(s, a)
