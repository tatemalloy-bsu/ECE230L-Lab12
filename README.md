# Number Theory: Addition

In this lab, you’ve learned about One Hot and Binary state machines and how to build them.

## Rubric

| Item | Description | Value |
| ---- | ----------- | ----- |
| Summary Answers | Your writings about what you learned in this lab. | 25% |
| Question 1 | Your answers to the question | 25% |
| Question 2 | Your answers to the question | 25% |
| Question 3 | Your answers to the question | 25% |

## Name

Tate Malloy, Peter Kjaer, Hayden Nyugen

## Summary

In this lab, we built a 5-state Moore machine using two methods. One-hot and binary. Then we ran both on the board at once. One-hot equations came straight from the state diagram but binary needed K-Maps for each bit.

## Lab Questions

### Compare and contrast One Hot and Binary encodings

One-hot uses one flip-flop per state with simple logic. While, binary packs the state into fewer flip-flops (3 instead of 5) but needs way more complicated logic.

### Which method did your team find easier, and why?

Binary made more sense at first but the K-Maps took so long and it got confusing. One Hot went much faster due to no K-Maps and being more brute-force straightforward. 

### In what conditions would you have to use one over the other? Think about resource utilization on the FPGA.

We would use Binary when there are lots of states or if our flip-flops are limited. In all other cases I would always use one-hot. FPGAs have lots of flip-flops and I would suspect the simpler logic on one-hot to run faster and be written faster.  
