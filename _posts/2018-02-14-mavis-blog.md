---
layout: post
title: The MAVIS Blog and Website is Up
feature-img: "assets/img/pexels/eso1724e_faded.jpg"
tags: [mavis, blog]
author: frigaut
---

MAVIS has a new website, including a blog! You are looking at it right now.

A blog is a nice tool to announce news, new development, things of interest. My experience is that it help keeping the team motivated and gives a sense of unity. This is particularly true given the geographic dispersion of the MAVIS team.

After careful consideration, I have chosen to use **Jekyll** an open-source blogging engine that is very well integrated in github, the document exchange and code collaboration repository we have adopted for MAVIS. The good thing about Jekyll is that it is super simple, doesn't rely on complicated set up involving database etc. You just create a new file, write your post in it with markdown (super simple markup) and there you are, it's a new post. Importantly for us, you can also use $$\KaTeX$$ to write beautiful equations ($$\nabla . {\rm D} = \rho_v$$), which I believe is crucial and was not available in mainstream blogging platform like wordpress without paying premium (e.g. it costs AUD33/**month** to be able to install plugins at wordpress.com)

## Instructions to create a new post

* Check out the [mavis-ao repo](https://github.com/frigaut/mavis-ao)

* Go to `mavis-ao/_post`

* Copy `2000-01-01-template-post.md` to the name of you post. Obviously, the date should match. Please respect the name convention: no space, no funny character (no colon, semi-colon, dot etc, use dash to separate the words).

* Edit the file. The "front-matter" is the thing between `---` at the start of the file:

```
---
layout: post
title: This should be the title of your post
tags: [Test, Markdown]
---
```
Edit it, as well as the tags (no limitation, but try to stick to existing tags if possible). Then replace the example text in this post with your content. Markdown syntax is extremely simple, you can get examples from the post you are editing, or get syntax from [this page](https://guides.github.com/features/mastering-markdown/). There are many cheat sheet, just be careful that there are several interpretation of markdown and they may differ slightly; we are using github markdown.

* If you have to insert images, just put them in the github repo (now on your disk, you are editing the post file from there) in `assets/img/pexels/` and refer to it in your post with the following syntax (assuming image `toto.jpg`):

```
this is an image:
![]({{site.baseurl}}/assets/img/pexels/toto.jpg)
... continued text
```

* You can also insert headings, emphasis and bold, tables, code, etc... just refer to the above markdown cheat sheet

* To insert equations, use:

```
Einstein said $$E=m c^2$$ and, on a separate line:

$$ \varphi = \sum_i^\infty a_i Z_i $$
```
which gives:

Einstein said $$E=m c^2$$ and, on a separate line:

$$ \varphi = \sum_i^\infty a_i Z_i $$
