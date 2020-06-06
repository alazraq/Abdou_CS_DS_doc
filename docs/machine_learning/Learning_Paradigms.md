# Learning Paradigms:

1. **Supervised:** we have labelled data D = {(x_i, y_i) for i in 1 to N}
    - Regression: y_i in R
    - Classification: y_i in 1 to K (Binary classification when y_i in {-1,+1})
    - Structured Prediction: y_i is a vector

2. **Unsupervized:** we have unlabelled data D = {x_i for i in 1 to N}
3. **Semi-supervized:** we have a small number N1 of labelled data and the rest is unlabelled.
    Ex: Image recognition with few labelled images and a lot of unlabelled images.
4. **Online learning:** Examples coming as a stream of data not with a fixed number D = {(x_1, y_1), (x_2, y_2), ...}
5. **Active learning:** We have unlabelled data but we can query aour oracle function y_i = c*(.) at some cost
6. **Imitation learning:** data consists of a stream of state action pairs D = {(s_1, a_1), (s_2, a_2), ...}
    Ex: collect examples of what an ideal robot would do on a particular state.
7. **Reiforcement learning:** data consists of a stream of tuples (state, action, reward) D = {(s_1, a_1, r_1), (s_2, a_2, r_2), ...}.
    Ex: robot interacting with an environment, initially in a state, taking an action and getting a reward and transition to another state.