# Cryptographic Approaches

When a certain ML application requires data from multiple input parties, cryptographic protocols could be utilized to perform ML training/testing on encrypted data.

## Homomorphic Encryption (HE)

- **In short: Homomorphic encryption allows you to make your data unreadable yet still do math on it**
- Homomorphic encryption (HE), as opposed to traditional encryption methods, allows **meaningful calculations to be performed on encrypted data**, where both the input and output are encrypted, with operations such as addition and multiplication that can be used as basis for more complex arbitrary functions.
- **Example:** When using HE data can be encrypted by its owner and sent to the model owner to run computation.For example, it would apply a trained classification model to encrypted patient data, and send back the encrypted result (e.g. a prediction of a disease) back to the patient. PS: the model weights don’t need to be encrypted here as the computation happens on the model owner’s side. 
- **Limitations:** Nonetheless, because of the constraints of HE, such as its inability to evaluate non-polynomial functions or to perform arbitrary matrix multiplication efficiently, only inference of linear models seem usable in practice in the HE paradigm so far.

## Secure Multi Party Computation (SMPC) or Secret Sharing

- **In short: Secure multi-party computation allows multiple parties to collectively perform some computation and receive the resulting output without ever exposing any party’s sensitive input.**
- **Enabler:** It relies on building shares of some value, which, when summed, reconstruct the original value.
- **Limitations:** SMPC is computationally less intensive than HE, but requires a lot of communication between the parties, so bandwidth can be a bottleneck.

## Trusted Execution Environments (TEE) or Confidential Computing / Secure Processors

- **The idea:** having multiple data owners collaborate to perform an ML tass with the computation party running the ML task on an Intel SGX-enabled data center. 
- **The technology behind it: Intel SGX**

> Intel Software Guard Extensions (SGX) is a set of security-related instruction codes that are built into some modern Intel central processing units (CPUs). They allow user-level as well as operating system code to define private regions of memory, called enclaves, whose contents are protected (encryption by the CPU of that portion of memory) and unable to be either read or saved by any process outside the enclave itself, including processes running at higher privilege levels like the OS or the Hypervisor (all are treated as potentially hostile). The processor thus protects the code from being "spied on" or examined by other code.

- Thus an adversary can control all the hardware and software in the data center except for the SGX-processors used for computation.
- **How it works - Data flow:** In this system, each data owner independently establishes a secure channel with the enclave (containing the code and data), authenticates themselves, verifies the integrity of the ML code in the cloud, and securely uploads its private data to the enclave. After all the data is uploaded, the
ML task is run by the secure processor, and the output is sent to the results’ parties over secure
authenticated channels.

## Other cryptographic approaches (not explored here)

- Garbled Circuits (GC)