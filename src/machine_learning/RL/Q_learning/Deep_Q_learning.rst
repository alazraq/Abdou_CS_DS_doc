Deep Q-Learning
===============

Motivation
----------

What if the state space is too big to be able to represent the optimal
Q-values for each state-action pair with a table?

Key Idea
--------

-  Approximate :math:`Q_*(s,a)` using a neural network
   :math:`Q(s,a;\theta)` where theta are the parameters of the neural
   net
