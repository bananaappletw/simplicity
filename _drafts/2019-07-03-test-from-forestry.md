---
date: 2019-07-03T02:35:06.000+00:00
title: official website review
tags: []
categories:
- computer science

---
# 釐清需求

這次官網的目的是要做出一個靜態的網站

然後提供非技術人員能夠寫稿然後發表(包含上傳圖片還有一些比較客製化的樣式)

這種東西比較精確的名詞是 Static Site Generators

可以參考 [https://www.staticgen.com/](https://www.staticgen.com/ "https://www.staticgen.com/") 看看每個框架的 star, issue, fork 數量

看看這些數值的變動來決定使用什麼框架

# i18n

主要是參考這篇文章 [https://forestry.io/blog/creating-a-multilingual-blog-with-jekyll/](https://forestry.io/blog/creating-a-multilingual-blog-with-jekyll/ "https://forestry.io/blog/creating-a-multilingual-blog-with-jekyll/")

`index.html`

    ---
    	permalink: /
    	i18n_prefix: index
        lang: en
    ---
    
    {% t title %}
    	title: hello

`zh/index.html`

    ---
    	permalink: /zh
    	i18n_prefix: index
        lang: en
    ---
    
    {% t title %}
    	title: hello

`_data/en.yml`

    index:
    	title: hello

`_data/zh.yml`

    index:
    	title: hello

`_plugin/i18n_plugin`

    Jekyll::

# CSS Naming

## [OOCSS(Object Oriented CSS)](https://www.keycdn.com/blog/oocss "OOCSS")

### HTML

    <button class="btn btn-small btn-primary"></button>

## [SMACSS](http://smacss.com/)

### HTML

    <ul class="nav">
      <li class="nav-item">
        <a class="nav-link active" href="#">Active</a>
      </li>
    </ul>

## [BEM](http://getbem.com/naming/)

> There are only two hard problems in Computer Science: cache invalidation and naming things — _Phil Karlton_

### Block

#### HTML

    <div class="block">
          ...
          <span class="block__elem"></span>
     </div>

#### CSS

    .block { color: #042; }

### Element

#### HTML

    <div class="block">
    	  ...
    	  <span class="block__elem"></span>
     </div>

#### CSS

##### Good

    .block__elem { color: #042; }

##### Bad

    .block .block__elem { color: #042; }
        div.block__elem { color: #042; }

### Modifier

#### HTML

##### Good

    <div class="block block--mod">...</div>
        <div class="block block--size-big
            block--shadow-yes">...</div>

##### Bad

    <div class="block--mod">...</div>

#### CSS

##### Use modifier class name as selector:

    .block--hidden { }

##### To alter elements based on a block-level modifier:

    .block--mod .block__elem { }

##### Element modifier:

    .block__elem--mod { }

### Example

#### HTML

    <form class="form form--theme-xmas form--simple">
      <input class="form__input" type="text" />
      <input
        class="form__submit form__submit--disabled"
        type="submit" />
    </form>

#### CSS

    .form { }
    .form--theme-xmas { }
    .form--simple { }
    .form__input { }
    .form__submit { }
    .form__submit--disabled { }

### Youtube

詳細可以參考這篇文章 [https://codeburst.io/understanding-css-bem-naming-convention-a8cca116d252](https://codeburst.io/understanding-css-bem-naming-convention-a8cca116d252 "https://codeburst.io/understanding-css-bem-naming-convention-a8cca116d252")

![](/uploads/1_Qnp9OzN6VV7e2IY32wsBbQ.png)

#### HTML

    <header class="youtube-header">
      <img class="youtube-header__logo"/>
      <div class="youtube-header__search"></div>
      <ul class="youtube-header__list">
        <li class="youtube-header__item></li>
        <li class="youtube-header__item></li>
     </ul>
    </header>

#### SASS

    .youtube-header {
      // rules
      &__logo {
        // rules
      }
      &__search {
        // rules
      }
      &__list {
        // rules
      }
      &__item {
        // rules
      }
    }

### 手好癢好想寫 nested element

可以先看完這篇 [https://en.bem.info/methodology/quick-start/#nesting-1](https://en.bem.info/methodology/quick-start/#nesting-1 "https://en.bem.info/methodology/quick-start/#nesting-1")

要遵守三點:

* Elements can be nested inside each other.
* You can have any number of nesting levels.
* An element is always part of a block, not another element. This means that element names can't define a hierarchy such as `block__elem1__elem2`.

#### Example

    <form class="search-form">
        <div class="search-form__content">
            <input class="search-form__input">
    
            <button class="search-form__button">Search</button>
        </div>
    </form>

# References

* [https://cythilya.github.io/2018/06/05/css-methodologies/](https://cythilya.github.io/2018/06/05/css-methodologies/ "https://cythilya.github.io/2018/06/05/css-methodologies/")
* [https://codeburst.io/understanding-css-bem-naming-convention-a8cca116d252](https://codeburst.io/understanding-css-bem-naming-convention-a8cca116d252 "https://codeburst.io/understanding-css-bem-naming-convention-a8cca116d252")
* [https://css-tricks.com/lets-define-exactly-atomic-css/](https://css-tricks.com/lets-define-exactly-atomic-css/ "https://css-tricks.com/lets-define-exactly-atomic-css/")
* [https://en.bem.info/methodology/quick-start/#guidelines-for-using-elements](https://en.bem.info/methodology/quick-start/#guidelines-for-using-elements "https://en.bem.info/methodology/quick-start/#guidelines-for-using-elements")