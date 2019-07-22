---
title: official website review
date: 2019-07-03 02:35:06 +0000
categories:
- computer science
tags: []

---
# 釐清需求

這次官網的目的是要做出一個靜態的網站

然後提供非技術人員能夠寫稿然後發表(包含上傳圖片還有一些比較客製化的樣式)

這種東西比較精確的名詞是 Static Site Generators

可以參考 [https://www.staticgen.com/](https://www.staticgen.com/ "https://www.staticgen.com/") 看看每個框架的 star, issue, fork 數量

看看這些數值的變動來決定使用什麼框架

當不知道要選什麼框架的時候可以從一些方向下手

* 程式語言
* 使用人數多寡,使用人數比較多的話也會比較多人遇到相同問題,這樣有解的機率也會比較高

主要需求:

* i18n

`/zh/index.html`

顯示中文的頁面

`/en/index.html`

顯示英文的頁面

* 不同頁面呈現不同 category 的文章

像是 `/blog`

會顯示出 front matter 的 category 是 blog 的文章

* 能夠照 i18n 顯示對應語系的文章

像是 `/zh/blog`

顯示出 front matter 的 category 是 blog 而且 locale 是 zh 的文章

* 各自 category 的文章照 tag 分類顯示

像是 `/blog/life`

會顯示出 front matter 的 category 是 blog 的文章而且 tag 是 life 的文章

# i18n

主要是參考這篇文章 [https://forestry.io/blog/creating-a-multilingual-blog-with-jekyll/](https://forestry.io/blog/creating-a-multilingual-blog-with-jekyll/ "https://forestry.io/blog/creating-a-multilingual-blog-with-jekyll/")

`index.html`

    ---
        permalink: /
        i18n_prefix: index
        lang: en
    ---    
    
    {% t title %}
    // hello

`zh/index.html`

    ---
    permalink: /zh
    i18n_prefix: index
    lang: en
    ---
    
    {% t title %}
    // 你好

`_data/en.yml`

    index:
    	title: hello

`_data/zh.yml`

    index:
    	title: 你好

`_plugins/i18n_tag`

    module Jekyll
      class I18nTag < Liquid::Tag
        def initialize(tag_name, text, tokens)
          super
          @text = text.strip
        end
    
        def render(context)
          site = context.registers[:site]
          page = context.registers[:page]
          path = @text.split('.')
          if site.data[page['locale']][page['i18n_prefix']]&.dig(*path)
            site.data[page['locale']][page['i18n_prefix']].dig(*path)
          else
            site.data[page['locale']].dig(*path)
          end
        end
      end
    end
    
    Liquid::Template.register_tag('t', Jekyll::I18nTag)

# Pagination

使用這個套件 [https://github.com/sverrirs/jekyll-paginate-v2](https://github.com/sverrirs/jekyll-paginate-v2 "https://github.com/sverrirs/jekyll-paginate-v2")

`index.html`

    ---
    layout: index
    permalink: /
    pagination:
        per_page: 5
        enabled: true
        locale: en
    ---

# CSS 小技巧或是

## image wrapper

我自己是比較喜歡在外面再加一層 wrapper 然後用外框來控制寬度和高度

寬度 300px 然後高度保持比例放大

### HTML

    <div class="logo">
    	<img src="...">
    </div>

### CSS

    .logo{
    	width: 300px;
    	img{
        	width: 100%;
        }
    }

## Aspect Ratio Boxes

可以參考這篇文章 [https://css-tricks.com/aspect-ratio-boxes/](https://css-tricks.com/aspect-ratio-boxes/ "https://css-tricks.com/aspect-ratio-boxes/")

比如說想要比例是 4:3 (寬 vs 高)

寬度佔滿 100% 垂直至中對齊多餘的隱藏起來

### HTML

    <div class="ratio-box">
    	<img src="...">
    </div>

### CSS

    .ratio-box{
        overflow: hidden;
        position: relative;
        &::after {
          content: "";
          display: block;
          padding-top: 75%;
        }
        img {
          position: absolute;
          top: 50%;
          transform: translateY(-50%);
          width: 100%;
        }
    }

## Nested links

[https://css-tricks.com/nested-links/](https://css-tricks.com/nested-links/ "https://css-tricks.com/nested-links/")

### HTML

    <a href="..."> 
      <a href="..."> 
    	...
      </a>
    </a>

這樣其實就會有非預期的現象發生應該避免

## Stop box-sizing everything

[https://aastudio.fr/box-sizing.html](https://aastudio.fr/box-sizing.html "https://aastudio.fr/box-sizing.html")

一開始在寫的時候發現有 `box-sizing` 這東西好方便喔

你設寬度是多少就是多少

就直接把全部東西都這樣寫了

### HTML

      html { box-sizing: border-box; }

後來會發現有些東西根本不需要或是能用 padding + border 算就可以了

就全部改回來了

## Mobile first

一開始在刻的時候先刻 desktop 版再刻 mobile 版

事實上應該反過來

這個我刻到一半的時候發覺這件事後就改過來了

## Don't affect positioning of other elements on border-width changes

你可能會想要有 hover 的時候

元素下面加一下底線

但是你加了 border 元素的大小就改變了

就會產生移位

1. 使用 box-shadow
2. 你可以先把 border 加上去但是 transparent 等到 hover 的時候再改變顏色顯示出來

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

`block-name`

#### HTML

    <div class="block">
          ...
          <span class="block__elem"></span>
     </div>

#### CSS

    .block { color: #042; }

### Element

`block-name__element-name`

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

其實 Modifier 的寫法比較有歧異

有兩種寫法

`block-name__element-name--modifier-name-modifier_value`

`block-name__element-name_modifier-name_modifier_value`

我自己是比較喜歡後者

以下例子都用後者的寫法

#### HTML

##### Good

    <div class="block block_mod">...</div>
        <div class="block block_size-big
            block_shadow_yes">...</div>

##### Bad

    <div class="block_mod">...</div>

#### CSS

##### Use modifier class name as selector:

    .block_hidden { }

##### To alter elements based on a block-level modifier:

    .block_mod .block__elem { }

##### Element modifier:

    .block__elem_mod { }

### Example

#### HTML

    <form class="form form_theme_xmas form_simple">
      <input class="form__input" type="text" />
      <input
        class="form__submit form__submit_disabled"
        type="submit" />
    </form>

#### CSS

    .form { }
    .form_theme_xmas { }
    .form_simple { }
    .form__input { }
    .form__submit { }
    .form__submit_disabled { }

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

可能會遇到一種情況有 block 和 elem1 和 elem2

elem1 和 elem2 相對於 block

那就可以寫成 `block__elem1` 和 `block__elem2`

但是 elem2 是相對於 elem1 的

可以忽視 elem2 對於 elem1 的關係

畢竟他們都是相對於 block

要是你將 elem2 nested 在 elem1 裡

那你就無法讓 elem2 在沒有 elem1 的情況下獨立存在

    <form class="search-form">
        <div class="search-form__content">
            <input class="search-form__input">
    
            <button class="search-form__button">Search</button>
        </div>
    </form>

或是將 elem1 加上 elem2 當成組合字當成一個新的 element `elem1-elem2`

`block__elem1-elem2`

    <form class="search-form">
        <div class="search-form__content">
            <input class="search-form__content-input">
    
            <button class="search-form__content-button">Search</button>
        </div>
    </form>

### Block in Block

[https://gist.github.com/Integralist/4960210](https://gist.github.com/Integralist/4960210 "https://gist.github.com/Integralist/4960210")

#### HTML

    <div class="blocka">
    	<div class="blocka__blockb">
        	<div class="blocka__blockb__elementb>
            </div>
        </div>
    </div>

#### Alternative HTML(1)

    <div class="blocka">
    	<div class="blocka__elementa blockb">
        	<div class="blockb__elementb>
            </div>
        </div>
    </div>

以 blocka__elementa 來代表和 blocka 的關係

#### Alternative HTML(2)

    <div class="blocka">
    	<div class="blockb">
        	<div class="blockb__elementb>
            </div>
        </div>
    </div>

如果 blocka 和 blockb 沒有相對關係的話可以省略 blocka-elementa

### Block container

#### HTML

    <div class="product-container>
        <div class="product>
            <div class="product__content">
            </div>
        </div>
    </div>

#### Alternative HTML(1)

    <div class="product>
        <div class="product__inner>
            <div class="product__content">
            </div>
        </div>
    </div>

將 product 往上拉一層

#### Alternative HTML(2)

    <div class="product-container>
        <div class="product>
            <div class="product__content">
            </div>
        </div>
    </div>

不予理會 product-container 和 product 的關係

我自己是比較喜歡這個寫法

主要的分界點是在於 product 是否能獨立存在 product-container 外

### Don't use nested selectors

只有你要改變 element 的 style based on block 的 modifier 的時候

    .button_hovered .button__text
    {
      text-decoration: underline;
    }
    .button_theme_islands .button__text
    {
      line-height: 1.5;
    }

或是你可以把原本的 SCSS 用 `@at-root` 改寫

既可以用巢狀結構包起來但是輸出卻不是 nested

#### bad SCSS

    .block{
    	.block__element{
        	...
        }
    }

#### Good SCSS

    .block{
    	@at-root #{&}__element{
        	...
        }
    }

#### Good CSS Output

    .block{
    	...
    }
    .block__element{
        ...
    }

### Don't use combined selectors

#### HTML

    <button class="button button_theme_islands button_active">...</button>

#### Bad CSS

    .button.button_theme_islands {}
    .button.button_active {}

你必須將兩個 modifier 拉到同樣 .button 的 level 才能有相同的 CSS 權重

#### Good CSS

    .button_theme_islands {}
    .button_active {}
    .button {}

#### Exception

比如你有可能需要用 markdown 生成 html tag

在 .content class 的 block 套用你自己寫的 style

    <div class="content">
      ... <!-- the user’s text -->
    </div>
    CSS rules:
    .content a {
      ...
    }
    .content p {
      font-family: Arial, sans-serif;
      text-align: center;
    }

# 對於簡單和複雜的元素的策略

簡單的元素可以想辦法用 utilities class 來達成

## HTML

    <div class="once-block font-bold text-align-center">
    </div>

複雜的元素其實就比較適合自己寫成一個 class 並撰寫 style，不然你的 html 裡的 class 可能就會太多，很複雜不好維護

## HTML

    <div class="muzukashii-block">
    </div>

# 一些下次可以改進的點

* 可能需要跟設計師協調設計稿的 breakpoint，會是希望可以套框架的 convension 可以善用 utilities class 用 class 就組出簡單的 style
  * xs
  * sm(min-width: 576px)
  * md(min-width: 768px)
  * lg(min-width: 992px)
  * xl(min-width: 1200px)
* 一開始就將所有頁面看完再開始寫，先將可以共用的 style 刻出來，再依照各個頁面不同的要求稍作調整，我一開始寫是一個頁面一個頁面刻，每次刻完一個頁面才發覺到其他頁面可以共用這個 style，但是為了共用 style 又必須稍做調整
* 使用 rem 和 em 取代 px，這個有溝通過只是在設計的時候就用了 px 了，來不及
* 再強一點之類的，我覺得以我寫完這個專案成長後的能力來重寫一次，可能只需要花一半的時間

# References

* [https://cythilya.github.io/2018/06/05/css-methodologies/](https://cythilya.github.io/2018/06/05/css-methodologies/ "https://cythilya.github.io/2018/06/05/css-methodologies/")
* [https://codeburst.io/understanding-css-bem-naming-convention-a8cca116d252](https://codeburst.io/understanding-css-bem-naming-convention-a8cca116d252 "https://codeburst.io/understanding-css-bem-naming-convention-a8cca116d252")
* [https://css-tricks.com/lets-define-exactly-atomic-css/](https://css-tricks.com/lets-define-exactly-atomic-css/ "https://css-tricks.com/lets-define-exactly-atomic-css/")
* [https://en.bem.info/methodology/quick-start/#guidelines-for-using-elements](https://en.bem.info/methodology/quick-start/#guidelines-for-using-elements "https://en.bem.info/methodology/quick-start/#guidelines-for-using-elements")
* [https://www.smashingmagazine.com/2018/06/bem-for-beginners/](https://www.smashingmagazine.com/2018/06/bem-for-beginners/ "https://www.smashingmagazine.com/2018/06/bem-for-beginners/")
* [https://medium.com/@yanglin_68397/%E5%A5%BD%E7%94%A8%E7%9A%84-bootstrap-4-utilities-class-79484fa4c506](https://medium.com/@yanglin_68397/%E5%A5%BD%E7%94%A8%E7%9A%84-bootstrap-4-utilities-class-79484fa4c506 "https://medium.com/@yanglin_68397/%E5%A5%BD%E7%94%A8%E7%9A%84-bootstrap-4-utilities-class-79484fa4c506")
* [https://zellwk.com/blog/css-architecture-1/](https://zellwk.com/blog/css-architecture-1/ "https://zellwk.com/blog/css-architecture-1/")
* [https://gist.github.com/Integralist/4960210](https://gist.github.com/Integralist/4960210 "https://gist.github.com/Integralist/4960210")