Q Learning
==========

Motivation
----------

What id we don’t know the rewards function :math:`R(s,a)` or the
transition probabilities :math:`P(s'/s,a)` exhaustively? (we can query
the environment by taking an action and receiving a reward and observing
the next state, but we don’t have access to the reward function or the
probability distribution) Then the Value Iteration and Policy Iteration
won’t work, Q-Learning is the solution.

Bellman optimality equation for Q\*
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. math:: Q_*(s, a) = R(s,a) + \gamma sum_{s'} p(s'/s,a) V_*(s')

and by applying :math:`V_*(s') = max_{a'} Q_*(s',a')` we get:

.. math:: Q_*(s, a) = R(s,a) + \gamma sum_{s'} p(s'/s,a) max_{a'} Q_*(s',a')

which is called the Bellman equation for :math:`Q_*`, which is a
recursive definition of :math:`Q_*`.

PS: In a deterministic environment (transitions are not stochastic) the
Bellman optimality equation for :math:`Q_*` becomes:

.. math:: Q_*(s, a) = R(s,a) + \gamma max_{a'} Q_*(\delta(s,a) = s',a')

Finding the optimal policy from :math:`Q_*`
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Once we have our optimal Q-function :math:`Q_*` we can determine the
optimal policy by finding the action that maximizes :math:`Q_*` for each
state:

.. math:: \pi^*(s) = argmax_a Q_*(s,a)

So if we can learn :math:`Q_*(s,a)`, we can define the optimal policy
:math:`\pi^*` without the need for :math:`R(s,a)` or :math:`P(s'/s,a)`.
In other words :math:`Q_*(s,a)` defines all we need to know about the
optimal behaviour of the system.
