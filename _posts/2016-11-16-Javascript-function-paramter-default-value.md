---
title: Javascript function paramter default  value
author: bananaapple
tags:
- javascript
categories:
- computer science
date: 2016-11-16T22:56:00.000+00:00

---
    function f(s)
    {
    	var a = (s == undefined) ? 'qq' : s;
    }

Can be rewrited as following code

    function f(s)
    {
    	var a = s || 'qq';
    }

First statement will evaluate value of s is true or not.

If true, s is assigned to a.

Else, statement will find next value a.k.a. 'qq'.

'qq' will be assigned to a.

For further, you could directly write code like this in ES6.

    function f(s = 'qq')
    {
    }