---
title: Review of bamboofox platform
layout: post
categories:
- computer science
tags:
- ruby on rails
---

記錄一下寫 bamboofox 平台的心得

其實當初這個平台是為了 migrate 以前的課程所建置的

當初的課程平台只能容納一個課程

所以主要的設計是要能容納多個課程為主

為了註冊方便就寫了 OAuth 登入

大部分的時間都是在 survey OAuth 是個怎麼樣的東西

還有網站要怎麼架起來之類的

比較麻煩的點是想要一個帳號能夠 link 多個 OAuth provider

像是原本用 facebook 註冊登入後

又想要 link 別的 social media (ex: github, google)

主要是參考這篇文章 https://sourcey.com/rails-4-omniauth-using-devise-with-twitter-facebook-and-linkedin/

把和 OAuth 有關的欄位移出 `User` table 建立一個新的 table `Identity`

每個 `user` has_many `identities`

主要的邏輯是使用者登入可以 link 其他 OAuth

如果登入 OAuth 成功就新增 identity 給那個 user

下次登入的時候就會靠 identity 來找到同一個 user 了

主要架設平台的搭配是 nginx + passenger + rvm

migrate 的方式我是直接先架一個 phpmyadmin 起來

先新增新網站的 schema

然後慢慢把舊網站的資料改成新網站的形式

最後再直接 import 到新網站的資料庫