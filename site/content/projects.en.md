---
title: "Projects"
description: "What Mika Schulz builds outside of work: this blog, a homelab, a smart home with Home Assistant and apps."
date: 2026-10-22
wide: true
---

What I build outside of work: from my own server and smart home to my own apps. Where there's already a post about it, it's linked.

<div class="projects">

<section class="project">
<div class="project-status">Online</div>
<h2 class="project-title">This blog</h2>

A bilingual blog built with Hugo. Most of it was built by AI; the ideas, decisions and texts are mine. It runs as a Docker container on my own server, and every push to `main` goes live automatically.

<div class="tech-stack">

- Hugo
- Docker
- Dokploy
- Cloudflare Tunnel
- Claude Code

</div>

<div class="project-link">

[How this blog came about]({{< relref "posts/wie-dieser-blog-entstand" >}}) · [Code on GitHub](https://github.com/MikaSchulz/MeinBlog)

</div>
</section>

<section class="project">
<div class="project-status">Running</div>
<h2 class="project-title">Homelab</h2>

A mini PC that was meant for the TV is now my server. With Proxmox it runs this blog, a dev box for programming, my second brain and Home Assistant. Only the blog is public; everything else is secured with Cloudflare Zero Trust and Tailscale.

<div class="tech-stack">

- Proxmox
- Docker & Dokploy
- Cloudflare Zero Trust
- Tailscale
- SilverBullet

</div>
</section>

<section class="project">
<div class="project-status">Running</div>
<h2 class="project-title">Smart home</h2>

Home Assistant is the hub for the lights, heating, door lock and door buzzer, all local instead of in the manufacturer's cloud. My favorite automation: coming home with my bike on my shoulder without touching a key.

<div class="tech-stack">

- Home Assistant
- Matter & Thread
- Philips Hue
- Shelly
- Nuki
- MQTT

</div>
</section>

<section class="project">
<div class="project-status">In progress</div>
<h2 class="project-title">Repper</h2>

A lean iPhone app that counts reps at the gym: put the phone on the weight stack, train, done. Right now I'm teaching it to count dumbbell exercises with the Apple Watch too. That's harder than it sounds, because the hand moves in an arc.

<div class="tech-stack">

- iOS
- Apple Watch
- Motion sensors
- Vibe coding

</div>
</section>

<section class="project">
<div class="project-status">In progress</div>
<h2 class="project-title">Wanna</h2>

Mutual matching for activities: two people privately choose what they feel like doing, for example watching a movie or cooking. If both pick the same thing, there's a match and a push notification. For anyone who hasn't seen someone in a while or doesn't dare to suggest something.

<div class="tech-stack">

- Compose Multiplatform
- Firebase
- Google Cloud
- Push notifications

</div>
</section>

<section class="project">
<div class="project-status">School days</div>
<h2 class="project-title">Minecraft mods</h2>

My first projects in Java, as a teenager. One mod made up for a bug in the game by calculating from which height a certain jump is safe; soon almost the whole community of that game mode used it. Then came plugins for smaller servers: game modes and a lobby system.

<div class="tech-stack">

- Java
- Forge
- LabyMod
- Spigot
- Paper

</div>
</section>

</div>
