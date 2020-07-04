# Analysis of users requirements

Requirements Analysis is the process of defining the expectations of the users for an application that is to be built or modified. 
It is at the intersection of *Business* and *Software Development* since the requirement modeling should be high level to make sense to stakeholders, but should also be simple, specific and clear enough for the developers to be able to implement them. 

The requirements analysis process involves eliciting, analyzing, modeling and then reviewing the requirements. 
Here we only focus on the modeling part and leave the rest for the Business expertise section.

## User stories

This section is a summary of what I learned in the analysis of users requirements part of the ``Database design and development`` course (67262) at Carnegie Mellon University and Mike Cohn's book ``User Stories Applied``.

### What are user stories?

User stories are the preferred format for modeling the requirements in the Agile methodology. They describe a desired functionality to achieve the user’s goal. 

User stories usually follow the following structure:

- As a ``type of user`` 
- I want ``goal``
- So that ``business value``

### Components of a user story

There are three parts to a user story:
- A **card** used for planning and as a reminder, traditionally written but can be digital.
- A **conversation** with the product owner to flesh out details of the story that can then be turned into:
- Acceptance **tests** that can be used to determine when the story was coded correctly. 

### Writing good stories: INVEST criteria

A good user story should be:

- I ndependent
- N egotiable
- V aluable
- E stimable
- S mall / appropriately sized
- T estable

Let's now discuss these quickly in more details:

- **Independent** means stories should be written so that they can be developed in any order whenever possible.
- **Negotiable** means that the details of a story are negotiated between the user and the developers.
- **Valuable** means that stories should be written so that their value to users or the customer (the company for which you are implementing the software) is clear. Having the customer write the user stories is best.
- **Estimable** means that 
- **Small** means that if they are too big, compound and complex stories may be split into multi- ple smaller stories.
- **Testable** means that we should be able to assess when the coding of a story is complete, and providing the test cases prior to the implementation of that user story is best.

### Examples of good user stories

These are from Construction Junction company:

- We would like online users to be able to add specific categories to a wish list so that they can receive notifications whenever those types of items are received at Construction Junction.
- We would like online purchases to be held in a queue so that Construction Junction staff can confirm that the item is available before the customer credit card gets debited.

