---
date: 2019-07-03T02:35:06.000+00:00
title: official website review
tags: []
categories:
- computer science

---
[http://smacss.com/](http://smacss.com/ "http://smacss.com/")

[http://stylecoder.tw/ni-yi-wei-de-csszui-jia-xie-fa-shi-cuo-de-/](http://stylecoder.tw/ni-yi-wei-de-csszui-jia-xie-fa-shi-cuo-de-/ "http://stylecoder.tw/ni-yi-wei-de-csszui-jia-xie-fa-shi-cuo-de-/")

# CSS Naming

# [BEM](http://getbem.com/naming/)

> There are only two hard problems in Computer Science: cache invalidation and naming things — _Phil Karlton_

## Block

### HTML

    <div class="block">
          ...
          <span class="block__elem"></span>
     </div>

### CSS

    .block { color: #042; }

## Element

### HTML

    <div class="block">
    	  ...
    	  <span class="block__elem"></span>
     </div>

### CSS

#### Good

    .block__elem { color: #042; }

#### Bad

    .block .block__elem { color: #042; }
        div.block__elem { color: #042; }

## Modifier

### HTML

#### Good

    <div class="block block--mod">...</div>
        <div class="block block--size-big
            block--shadow-yes">...</div>

#### Bad

    <div class="block--mod">...</div>

### CSS

#### Use modifier class name as selector:

    .block--hidden { }

#### To alter elements based on a block-level modifier:

    .block--mod .block__elem { }

#### Element modifier:

    .block__elem--mod { }

## Example

### HTML

    <form class="form form--theme-xmas form--simple">
      <input class="form__input" type="text" />
      <input
        class="form__submit form__submit--disabled"
        type="submit" />
    </form>

### CSS

    .form { }
    .form--theme-xmas { }
    .form--simple { }
    .form__input { }
    .form__submit { }
    .form__submit--disabled { }

# References

* [https://cythilya.github.io/2018/06/05/css-methodologies/](https://cythilya.github.io/2018/06/05/css-methodologies/ "https://cythilya.github.io/2018/06/05/css-methodologies/")