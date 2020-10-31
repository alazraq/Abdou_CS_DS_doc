# ML Interprability

This article is based on a data challenge I did with the Eleven team as part of my master at Ecole Polytechnique and HEC Paris. 

If you want to dive more into interpretability [this book](https://christophm.github.io/interpretable-ml-book/) is a wonderful resource.

## What is explainability or interprability?

Explainablity of an algorithm is the degree to which a human can explain the results of this algorithm.
It involves:
- Input: Understanding what are the most influential and the most important inputs and how they interact with each other.
- Model: Understanding how the model work and how it is learning.
- Output: Understand why a given result has been obtained as the output of the model


## Why an explainable AI?

- Highly-regulated subject (GDPR, etc)
- Improve the dialogue and involvement of the field experts (acceptance)
- Better transparency and trust increase

## Trade-off between performance and explainability 

- We can distinguish explainable models like linear regression and decision trees, and black-box models like neural networks and ensemble methods. Usually the more explainable the model is, the less performant it will be.
- Why are explainable models explainable:
    - Linearity
    - Monotony: increase input, increase output for example
    - Succession of logical rules: decision trees for example
- Usually The more variables, the harder the explainability
- Methods are being developped to better explain black-box models

## Interpretability techniques

We distingish model agnostic techniques that can be applied to any model, and other techniques that are example based.

- **Model-agnostic interpretation methods** are about separating the explanations from the machine learning model:
    - Partial dependence plot (PDP)
    - Individual Conditional Expectation(ICE)
    - Accumulated Local Effets (ALE) Plot
    - Global & Local surrogate (LIME)
    - Shapley values

- **Example-based explanation methods** select particular instances of the dataset to explain the behavior of machine learning models or to explain the underlying data distribution.

In this article we will focus on module agnostic techniques.

## Global and Local explainability


- Global explainability aims to describe the overall behaviour of the model:
    - Identify most important variables
    - Explain the contribution of each variable on the output of the model

- Local interprability allows us to better understand an individual output of the model (why Charles loan got rejected).


### Global methods

- **Feature Importance:** Identify the values whose change has the greatest impact on the model
- **Individual Conditional Expectation:** Consider each observation to understand how the variation of a feature influence the output
- **Partial Dependency Plot:** Understand how the variation of a feature influence the output for the whole model
- **Accumulated Local Effects:** Understand how the variation of a feature influence the output for the whole model while considering correlations between variables

### Local methods

- **Shapley:** Explain how each feature contributes to the gap between the average value and the output value
- **LIME:** Vary the parameter values locally to see their influence on the output value
- **Anchor:** Find the most different observation leading to a similar output

### Skater: Python library used for interpretability

[Skater](https://oracle.github.io/Skater/overview.html) is a framework to enable Model Interpretation for all forms of MLmodels.
I used this library in a data challenge at Ecole Polytechnique and it was good enough for my needs.