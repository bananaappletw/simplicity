---
date: 2019-07-03T02:35:06.000+00:00
title: official website review
tags: []
categories:
- computer science

---
主要官網的需求必須是靜態網頁

也就是只有 html css js 構成的網頁

只有前端不具備任何後端的功能

通常第一個想法會是 GitHub page

可以依照 [https://www.staticgen.com/](https://www.staticgen.com/ "https://www.staticgen.com/") 來選擇

這裡我選擇的是 [https://jekyllrb.com/](https://jekyllrb.com/ "jekyll")

自己選擇的原因有幾個:

* 我對於 jekyll 比較熟悉
* 這套使用的語言是 Ruby 是個還算會寫的語言
* 這套是 GitHub 預設的 GitHub page generator

如果不知道要選擇哪一個框架的時候可以這樣選

* 程式語言是自己可以接受的
* 最多人用的框架, 因為當你遇到問題時應該也很多人遇過了, 網路上可能找到的解法也會比較多, 通常文件也會比較齊全, 不知道選什麼就直接選最多人用的框架

這裡列出一些基本的功能:

* [https://github.com/sverrirs/jekyll-paginate-v2](https://github.com/sverrirs/jekyll-paginate-v2 "jekyll-paginate-v2")
* [https://forestry.io/blog/creating-a-multilingual-blog-with-jekyll/](https://forestry.io/blog/creating-a-multilingual-blog-with-jekyll/ "i18n")
* [https://jekyllrb.com/docs/configuration/front-matter-defaults/](https://jekyllrb.com/docs/configuration/front-matter-defaults/ "Front Matter Defaults")

基本上這些提到的功能我都 survey 過

我這裡提到的都是最好的或是最彈性的解法

分頁部份需求是 browse by category 或是 browse by tag

而且要依照 i18n 不同語言的頁面選擇不同語系的文章

[https://github.com/sverrirs/jekyll-paginate-v2](https://github.com/sverrirs/jekyll-paginate-v2 "jekyll-paginate-v2") 能依照 post 的 category, tag, lang front matter 來挑選出文章做分頁

i18n 的部份 url 會是這樣

\`/en/index.html\`

\`/zh-TW/index.html\`

事實上目前的 plugin 都沒有辦法滿足這需求

所以只能自己寫

[https://forestry.io/blog/creating-a-multilingual-blog-with-jekyll/](https://forestry.io/blog/creating-a-multilingual-blog-with-jekyll/ "https://forestry.io/blog/creating-a-multilingual-blog-with-jekyll/")

\`_plugin_/i18n_tag.rb_\` 

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
          if site.data[page['lang']][page['i18n_prefix']]&.dig(*path)
            site.data[page['lang']][page['i18n_prefix']].dig(*path)
          else
            site.data[page['lang']].dig(*path)
          end
        end
      end
    end
    
    Liquid::Template.register_tag('t', Jekyll::I18nTag)

在 front matter 裡面設定 `i18n_prefix: index`

這樣就可以在 i18n 不同的分頁面寫同樣的 key 也不怕會撞 key 

`_data/en.yml`

    index: 
    	title: Index Page