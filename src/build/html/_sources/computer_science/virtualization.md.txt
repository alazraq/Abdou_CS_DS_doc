# Virtualization

- Virtualization is nothing but abstracting operating system, application, storage or network away from the true underlying hardware or software. It creates the illusion of physical hardware to achieve the goal of operating system isolation.

- A **virtual machine (VM)** is a computer file, typically called an image, that behaves like an actual computer. In other words, creating a computer within a computer. 

- It **runs in a window**, much like any other program, giving the end user the same experience on a virtual machine as they would have on the host operating system itself.

- The virtual machine is **sandboxed** from the rest of the system, meaning that the software inside a virtual machine can’t escape or tamper with the computer itself.

- Multiple virtual machines can **run simultaneously on the same physical computer**. 
    - For servers, the multiple operating systems run side-by-side with a piece of software called a **hypervisor** to manage them, the hypervisor separates the machine’s resources from the hardware and provisions them appropriately so they can be used by the VM. 
    - For desktop computers, they typically **employ one operating system** to run the other operating systems within its program windows.

- Each virtual machine provides its own **virtual hardware**, including CPUs, memory, hard drives, network interfaces, and other devices. The virtual hardware is then mapped to the real hardware on the physical machine which saves costs by reducing the need for physical hardware systems.

- We distinguish two types of virtual machines:
    - **System virtual machines** (also termed full virtualization VMs) provide a substitute for a real machine. They provide functionality needed to execute entire operating systems. A hypervisor uses native execution to share and manage hardware, allowing for multiple environments which are isolated from one another, yet exist on the same physical machine.
    - **Process virtual machines** are designed to execute computer programs in a platform-independent environment.
    - Please refer to this articles for more details on the different types of virtualization.