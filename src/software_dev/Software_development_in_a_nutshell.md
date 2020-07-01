# Software development in a nutshell

Let me start by describing the different steps of the software development process in a very informal way adapted from a StackExchange comment that can be found [here](https://softwareengineering.stackexchange.com/questions/308338/what-does-packaging-refer-to-in-the-software-deployment-process).

First, you **plan** your project. What does it need to do? How will it do it? Who will it make it? And when?

Then you **design** the system. Lots of diagrams. And documentation!

Then you **implement** it. It's coding time, batman.

Now you can **build** it. In some languages/paradigms, that means compiling and linking. In others, this actually may be an empty step. For example, you may wish to deploy a Python script as-is.

Next, you take the distributables/executables/documentation/resources out of your build directory/staging area, and put them into whatever entity you're going to actually send to your users. Be that an archive file (ex: jar), or a Docker container, or a Red Hat RPM, or a strand of specially-sequenced DNA spliced onto the genome of an unfortunate carrier pigeon, or… whatever. This is **packaging**. Again, this may be an empty step, if you only have a single executable, and you just need to get it to someone as-is.

Your packaged product is then **deployed**, either by digitally transmitting it, or by sending it in the post on floppy disks, or by sending it on a USB stick with your own engineer to perform a free on-site installation, or by deploying on the cloud using Kubernetes.