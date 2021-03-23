Privacy-Preserving Machine Learning
###################################

Traditionally, training a model would require transferring this data to a central server, but this raises numerous concerns about the privacy and security of the data.

**Privacy-Preserving Machine Learning (or PPML for short)** refers to the  privacy-enhancing techniques concentrated on allowing multiple input parties to collaboratively train ML models without releasing their private data in its original form. In other words, PPML consists of allowing models to be trained without having direct access to the private data in its original form.

In these articles, we focus on the foundations of cryptographic protection of data processing, and steadily build-up to advanced PPML techniques. I wrote this blog as part of my personal project at HEC Paris in March 2021.

References:
- Openmined Privacy-Preserving Data Science, Explained series: https://arxiv.org/ftp/arxiv/papers/1804/1804.11238.pdf
- Privacy Preserving Machine Learning: Threats and Solutions paper by Al-Rubaie and Chang: https://blog.openmined.org/private-machine-learning-explained/

.. toctree::
   :caption: Contents:
   :glob:

   privacy_preserving_ML_intro
   threats
   cryptographic_approaches
   perturbation_approaches