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
    text: "A bilingual blog built with Hugo. Most of it was built by AI; the ideas, decisions and texts are mine. It runs as a Docker container on my own server, and every push to `main` goes live automatically."
    tech: ["Hugo", "Docker", "Dokploy", "Cloudflare Tunnel", "Claude Code"]
    links:
      - text: "How this blog came about"
        page: "posts/wie-dieser-blog-entstand"
      - text: "Code on GitHub"
        url: "https://github.com/MikaSchulz/MeinBlog"
  - id: "homelab"
    title: "Homelab"
    status: "Running"
    text: "A mini PC that was meant for the TV is now my server. With Proxmox it runs this blog, a dev box for programming, my second brain and Home Assistant. Only the blog is public; everything else is secured with Cloudflare Zero Trust and Tailscale."
    tech: ["Proxmox", "Docker & Dokploy", "Cloudflare Zero Trust", "Tailscale", "SilverBullet"]
  - id: "smart-home"
    title: "Smart home"
    status: "Running"
    text: "Home Assistant is the hub for the lights, heating, door lock and door buzzer, all local instead of in the manufacturer's cloud. My favorite automation: coming home with my bike on my shoulder without touching a key."
    tech: ["Home Assistant", "Matter & Thread", "Philips Hue", "Shelly", "Nuki", "MQTT"]
  - id: "repper"
    title: "Repper"
    status: "In progress"
    text: "A lean iPhone app that counts reps at the gym: put the phone on the weight stack, train, done. Right now I'm teaching it to count dumbbell exercises with the Apple Watch too. That's harder than it sounds, because the hand moves in an arc."
    tech: ["iOS", "Apple Watch", "Motion sensors", "Vibe coding"]
  - id: "wanna"
    title: "Wanna"
    status: "In progress"
    text: "Mutual matching for activities: two people privately choose what they feel like doing, for example watching a movie or cooking. If both pick the same thing, there's a match and a push notification. For anyone who hasn't seen someone in a while or doesn't dare to suggest something."
    tech: ["Compose Multiplatform", "Firebase", "Google Cloud", "Push notifications"]
  - id: "minecraft"
    title: "Minecraft mods"
    status: "School days"
    text: "My first projects in Java, as a teenager. One mod made up for a bug in the game by calculating from which height a certain jump is safe; soon almost the whole community of that game mode used it. Then came plugins for smaller servers: game modes and a lobby system."
    tech: ["Java", "Forge", "LabyMod", "Spigot", "Paper"]
---

What I build outside of work: from my own server and smart home to my own apps. Where there's already a post about it, it's linked.
