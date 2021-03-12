# An Introduction to Privacy preserving ML

## Why is it important?

- Some ML models require sensible and private training data. 
- For instance, a speech-to-text model might require people to record their voices, a diagnosis tool will require private health data to be sent, or a credit analysis tool might need to have a look at private financial information.
- We need new techniques reconcile privacy and efficiency in ML.


## An overview of privacy preserving ML techniques


- **Homomorphic Encryption (HE)** public key cryptographic scheme. Steps:
    - user creates a pair of secret and public key
    - uses the public one to encrypt her data
    - send encrypted data to a third party which will perform computations on the encrypted data. 
    - the user can get the encrypted result and decode it with her own private key because of the homomorphic properties of the encryption and decryption


- **Secure Multi Party Computation (SMPC)** is a different paradigm which relies more on communication between the participants. 
    - Data can be split, as well as the model
    - each actor only sends a few shares of her data, so that others can not reconstruct the initial data, but can participate, and do some computation on shares of data. 
    - Then once each party has finished, everything can be aggregated and the result of the output is known to each party.

- **Trusted Execution Environments (TEE) or Confidential Computing** enable the development of software thanks to hardware guarantees of privacy. 
    - Example: Intel’s SGX technology provides an implementation of such system. 
    - The enclave technology allows programs to be executed in isolation of other programs. 
    - All data inbound and outbound is encrypted, and computation in clear only happens within the enclave. 
    - The enclave code and integrity can then be checked externally using attestations.

## Differential privacy

- The goal of **differential privacy** is to be able to publicly share information about a dataset by describing the patterns of groups within the dataset while withholding information about individuals in the dataset. 
- The idea is for query results not to be used to infer much about any single individual, and therefore providing privacy. 
- For machine learning models, this means the model should not reveal any private information about a particular individual whether he participated in the training data set or not. The aim is to control the influence of the training data during the training process.
- For the math behind this and a differentially private implementation of SGD algorithm, please refer to the following excellent [medium article](https://medium.com/secure-and-private-ai-writing-challenge/summary-of-deep-learning-with-differential-privacy-d7ffa2033e8f). Basically the idea here is at each step of SGD to take a step in the opposite direction of an average noisy version of the gradient