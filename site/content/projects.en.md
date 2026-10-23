---
title: "Projects"
description: "What Mika Schulz builds outside of work: this blog, a homelab, a smart home with Home Assistant and apps."
date: 2026-10-22
layout: "projects"
wide: true
# One entry per project; see projects.md for how the fields are used.
projects:
  - id: "blog"
    title: "This blog"
    status: "Online"
    text: "A bilingual blog built with the help of AI. The ideas and posts are mine. It runs as a Docker container via Dokploy on my own server."
    tech: ["Hugo", "Docker", "Dokploy", "Cloudflare Tunnel", "Claude Code"]
    links:
      - text: "How this blog came about"
        page: "posts/wie-dieser-blog-entstand"
      - text: "Code on GitHub"
        url: "https://github.com/MikaSchulz/MeinBlog"
  - id: "homelab"
    title: "Homelab"
    status: "Running"
    text: "A NUC mini PC, originally meant to replace the TV, is now my server. With Proxmox it runs this blog, a dev box for programming, a second brain, a Pi-hole, a Tailscale exit node and Home Assistant. Only the blog is publicly reachable. Everything is secured with a Cloudflare Zero Trust tunnel and Tailscale."
    tech: ["Proxmox", "Docker & Dokploy", "Cloudflare Zero Trust", "Tailscale", "SilverBullet", "Pi-hole"]
  - id: "smart-home"
    title: "Smart home"
    status: "Running"
    text: "Home Assistant is the hub for the lights, heating, door lock and door buzzer, as well as door and window sensors. Everything is connected locally over a Matter-over-Thread network. My favorite automation: coming home with my bike on my shoulder and opening the front door with my smartphone, without touching a key."
    tech: ["Home Assistant", "Matter", "Thread", "Shelly", "Nuki", "MQTT"]
  - id: "repper"
    title: "Repper"
    status: "In progress"
    text: "A 'lightweight' app (pun intended) that counts reps at the gym: you put the phone on the weight stack, and it uses the phone's motion sensors to count how many reps you've done. It's planned to be available as a smartwatch app as well. The sensor side is much harder there, though, because the hand moves in an arc during dumbbell exercises."
    tech: ["iOS", "Apple Watch", "Motion sensors", "Vibe coding"]
  - id: "wanna"
    title: "Wanna"
    status: "In progress"
    text: "Mutual matching for activities: two people privately choose what they feel like doing, for example watching a movie or cooking. If both pick the same thing, there's a match and a push notification. For anyone who hasn't seen someone in a while or is too shy to suggest something."
    tech: ["Compose Multiplatform", "Firebase", "Google Cloud", "Push notifications"]
  - id: "minecraft"
    title: "Minecraft mods"
    status: "School days"
    text: "First projects in Java, as a teenager. Mods and plugins such as a \"King of the Hill\" game mode or a lobby system."
    tech: ["Java", "Forge", "LabyMod", "Spigot", "Paper"]
---

What I build outside of work: from my own server and smart home to my own apps. Where there's already a post about it, it's linked.
