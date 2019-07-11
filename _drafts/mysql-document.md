---
date: 2019-07-11 15:09:39 +0000
title: MySQL document
tags: []
categories:
- computer science

---
# Locking reads

## `[SELECT ... FOR SHARE](https://dev.mysql.com/doc/refman/8.0/en/select.html "13.2.10 SELECT Syntax")`

共享鎖，主要用來保證資料的完整性

比如說 session1 改了資料還沒 commit

session2 用 select for share 去讀資料必須等到 session1 commit 後才能讀取

通常用在 [https://en.wikipedia.org/wiki/Relational_model](https://en.wikipedia.org/wiki/Relational_model "https://en.wikipedia.org/wiki/Relational_model")

## `[SELECT ... FOR UPDATE](https://dev.mysql.com/doc/refman/8.0/en/select.html "13.2.10 SELECT Syntax")`

# Reference

* [https://dev.mysql.com/doc/refman/8.0/en/innodb-locking-reads.html](https://dev.mysql.com/doc/refman/8.0/en/innodb-locking-reads.html "https://dev.mysql.com/doc/refman/8.0/en/innodb-locking-reads.html")