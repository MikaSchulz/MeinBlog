---
title: "This blog was not made by me, or was it?"
slug: "how-this-blog-was-built"
date: 2026-10-19T22:30:00+02:00
description: "How eyetealer.me came to be: built with Hugo and a lot of AI, self-hosted on my NUC."
categories: ["AI"]
tags: ["hugo", "spec-kit", "claude-code", "vibe-coding", "docker", "dokploy"]
---

All right, here we go. Today I'll tell you what this blog is built with, what it runs on and who actually built it.

<!--more-->

## Hugo, because it's simple

First, I looked into which framework I wanted to use, especially what works best for a blog. Of course, the first thing that comes to my mind is WordPress, but honestly, I associate it with ancient websites, hundreds of plugins and thousands of security holes. In the end, I decided to go for [Hugo](https://gohugo.io) because it's super simple and easy to set up. If you don't know it yet: Hugo is a so-called static site generator. I write my texts in Markdown, and Hugo turns them into static HTML. Meaning I don't need a database or an admin login, so there's hardly any attack surface. After all, I'm not really a Van Gogh, and I'd rather focus on the important stuff, like the content.

## From Spec Kit to vibe coding

Once the decision was made, it was time to build. So I grabbed Claude Code and tried out GitHub's new [Spec Kit](https://github.com/github/spec-kit). It's about so-called spec-driven development: you define your project in specifications that grow with new requirements and get more and more precise over time. Along the way, though, I switched to vibe coding. Developing with AI has changed so much in the last few weeks and months that it would deserve its own blog post. But that would probably be outdated again in a few weeks.

## Off to the NUC: Dokploy

Hugo rebuilds the site after every change, and the result fits nicely into a Docker container{{< info "What's a Docker container?" >}}A Docker container is a packaged application that brings everything it needs to run, so it runs the same everywhere. In my case, it holds a small web server (nginx) with the finished site.{{< /info >}}.

The container can now be hosted on pretty much any platform. Lots of providers let you upload your containers and run them, even for free. But that was a little too easy for me. I wanted to host it myself, so I went for my NUC{{< info "What's a NUC?" >}}NUC is actually the name of Intel's line of mini PCs, but it has become a common term for small mini PCs in general. Mine is an ACEMAGICIAN V1 with an Intel N150, 16 GB of RAM and a 256 GB SSD. It came with Windows 11; I first installed Ubuntu and now Proxmox.{{< /info >}}.

I could have simply hosted the website as its own Proxmox container, but I wanted a platform that could host all my Docker containers anyway. I compared [Coolify](https://coolify.io) and [Dokploy](https://dokploy.com), both open source. You can think of them as a self-hosted Vercel. Coolify is older, has a bigger community and more features. Dokploy is newer, leaner and cleaner. I don't need a lot of features, I just want simplicity. Since I had already used Coolify in another project, I went for Dokploy.

I pushed the blog to a public GitHub repo, created the project in Dokploy and connected it. You then get a webhook, which you add to the repo. Whenever there's a push to the main branch, GitHub calls the webhook, and Dokploy builds and deploys the container. Thanks to cloudflared{{< info "What's cloudflared?" >}}cloudflared is the small program behind Cloudflare Tunnel. Cloudflare itself is a big network that sits in front of lots of websites. cloudflared runs in my home network and opens an outgoing connection to Cloudflare from the inside: the tunnel. When you open eyetealer.me, you land at Cloudflare, and your request is passed through this tunnel to my server. That's why I don't have to open any port on my router, and nobody gets directly into my home network. More on that in a separate post.{{< /info >}}, the blog is now reachable on the internet.

What a cool feeling to finally see the blog live, under my own domain and hosted at home.

{{< figure src="dokploy.webp" width="2000" height="791" alt="Screenshot from Dokploy: the application “blog” (Hugo blog eyetealer.me) with a running container, status “Up 3 minutes (healthy)”" caption="Dokploy says: the blog container is running and healthy." >}}

## What mattered to me

Even before writing any content, I set some ground rules that were important to me. One of them is good contrast between text and background, so nobody runs into barriers. I chose papaya orange because I really liked it. You'll mostly find it on my CV page, but it will show up more often later on. It's inspired by McLaren, and I chose matching complementary colors for the backgrounds.

Since I want the blog to be available internationally as well, I added English as a second language. I'm hoping for more exchange, also because English is the language of IT.

There's no comment section yet. I'm still thinking about whether to add one. If I do, it will probably be one with manual approval, since I'm the only moderator for now. A diversity of opinions is important to me, but I want to keep bots and the like out.

## How I work on the blog

And here we are now: I'm writing a blog post about the blog. My general workflow consists of these steps:

1. Have an idea and start brainstorming.
2. Sort my findings and create an implementation plan.
3. Implement it and regularly take notes, especially when I learn something or run into problems. I keep track of decisions in a decision log.
4. Reflect and start over at 1 if needed.

AI helps me with this process, especially with documentation and reflection. I let AI ask me questions, or the other way around: I ask AI what questions others would ask or what they would find important. Finally, I use this information to write a blog post. I write the posts myself, though, and at most let AI proofread them.

## Conclusion

So, the answer to the question: who built this blog? The implementation – mostly AI. The planning – mostly me, together with AI. But: my ideas, my decisions, my words.

And would I go the same way again? Mostly yes. Hugo is really easy to use. What I'd do differently above all: start writing earlier. The blog was running long before the first post came out.

Thanks for reading!
