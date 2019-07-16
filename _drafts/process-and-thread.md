---
date: 2019-07-12 14:11:08 +0000
title: process and thread
tags: []
categories:
- computer science

---
主要是和同學討論到面試常常會問到 process 和 thread 有甚麼差別

[https://www.kernel.org/doc/ols/2002/ols2002-pages-330-337.pdf](https://www.kernel.org/doc/ols/2002/ols2002-pages-330-337.pdf "https://www.kernel.org/doc/ols/2002/ols2002-pages-330-337.pdf")

# Definations

## process

> Traditionally a UNIX® process corresponded to an instance of a running program. More precisely it was an address space and a group of resources all dedicated to running that program. This definition is formalized in POSIX

## thread

> The term thread comes from the concept of a single thread of execution, ie a linear path through the code. POSIX defines a thread to be the resources necessary to represent that single thread of execution. A process contains one or more threads

## task

> In Linux, the basic unit is a task. In a program that only calls fork() and/or exec(), a Linux task is identical to a POSIX process. The difference arises when a task uses the clone() system call to implement multithreading. The program then becomes a cooperating set of tasks which share some resources.

kernel 的 tgid 指的是 process id

kernel 的 pid 指的是 thread id

# Thread Model

![](https://www.geeksforgeeks.org/wp-content/uploads/gq/2015/07/many_to_many3.jpg)

# References:

* [https://www.geeksforgeeks.org/multi-threading-model/](https://www.geeksforgeeks.org/multi-threading-model/ "https://www.geeksforgeeks.org/multi-threading-model/")