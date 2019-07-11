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

通常用在 [https://en.wikipedia.org/wiki/Relational_model](https://en.wikipedia.org/wiki/Relational_model "https://en.wikipedia.org/wiki/Relational_model") 上

1. SELECT parent table FOR SHARE 
2. 依賴上一條指令的成功與否(存在與否)決定執行結果

當你需要新增 child 資料時，parent 有可能已經被刪除了

那這條指令就必須回傳失敗

所以必須先對 parent table SELECT FOR SHARE

要是失敗整個 transaction rollback

## `[SELECT ... FOR UPDATE](https://dev.mysql.com/doc/refman/8.0/en/select.html "13.2.10 SELECT Syntax")`

通常用在避免兩個 session 存取同一個資料

1. SELECT account FOR UPDATE
2. Check account date and decide do something
3. UPDATE account

如果用 SELECT FOR SHARE 來做會怎樣呢

session1 1. -> 2.

session2 1. -> 2.

session1 3.

session2 3.

最後資料就會產生 

# Reference

* [https://dev.mysql.com/doc/refman/8.0/en/innodb-locking-reads.html](https://dev.mysql.com/doc/refman/8.0/en/innodb-locking-reads.html "https://dev.mysql.com/doc/refman/8.0/en/innodb-locking-reads.html")