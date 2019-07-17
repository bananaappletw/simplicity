---
date: 2019-07-03T02:35:06.000+00:00
title: official website review
tags: []
categories:
- computer science

---
這次官網的目的是要做出一個靜態的網站

然後提供非技術人員能夠寫稿然後發布

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

# References

* [https://cythilya.github.io/2018/06/05/css-methodologies/](https://cythilya.github.io/2018/06/05/css-methodologies/ "https://cythilya.github.io/2018/06/05/css-methodologies/")