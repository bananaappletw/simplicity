# simplicity

[Theme preview](https://bananaappletw.github.io/)

![simplicity theme preview](/demo.gif)

## Installation

```bash
git clone https://github.com/bananaappletw/simplicity/ [your_github_username].github.io
cd [your_github_username].github.io
bundle install
jekyll serve
```

## Usage

### Enabling comments (via Disqus)

Optionally, if you have a Disqus account, you can tell Jekyll to use it to show a comments section below each post.

To enable it, add the following lines to your Jekyll site:

```yaml
  disqus:
    shortname: my_disqus_shortname
```

You can find out more about Disqus' shortnames [here](https://help.disqus.com/customer/portal/articles/466208).

Comments are enabled by default and will only appear in production, i.e., `JEKYLL_ENV=production`

If you don't want to display comments for a particular post you can disable them by adding `comments: false` to that post's YAML Front Matter.

--

### Enabling Google Analytics

To enable Google Anaytics, add the following lines to your Jekyll site:

```yaml
  google_analytics: UA-NNNNNNNN-N
```

Google Analytics will only appear in production, i.e., `JEKYLL_ENV=production`

## License

The theme is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
