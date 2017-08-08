#lang scheme

For generic operations with explicit dispatch (which is the same as the "functional programming approach" described in the wiki link above), adding new operations is easy (i.e. can be done without changing existing code).

For message passing, adding new types can be done without changing existing code, but adding new operations requires changing all the old code.

Data directed programming actually "solves" the Expression problem by allowing new types *and* new operations to be added without changing existing code: To add a new type I just fill out a new column in the table of operations, to add a new operation I fill out a new row. (Note that style used in the book of putting all the operations for e.g. the rectangular representation together makes it seem like adding a new operation to all the representations would be hard, but there's nothing stopping me from having my own define block where I register a 'complex-conjuage method under 'rectangular and 'polar.)

Of course, the amount of code that needs to be written to add a new type or operation is about the same under all three approaches - the only difference is how spread out that code needs to be, and how easy it is to locate all the places where code needs to be changed. Data directed programming seems to optimize for the former at the expense of the latter.