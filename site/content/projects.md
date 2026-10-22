---
title: "Projekte"
slug: "projekte"
description: "Was Mika Schulz neben dem Job baut: dieser Blog, ein Homelab, ein Smart Home mit Home Assistant und eigene Apps."
date: 2026-10-22
layout: "projects"
wide: true
# One entry per project. The projects page shows them as cards, the CV as a short preview
# (title, status and the first three entries of "tech", linking to the card via "id").
# Links: "page" for a page of this blog (path as in content/), "url" for anything else.
projects:
  - id: "blog"
    title: "Dieser Blog"
    status: "Online"
    text: "Ein zweisprachiger Blog mit Hugo. Gebaut hat ihn größtenteils die KI, Ideen, Entscheidungen und Texte sind von mir. Er läuft als Docker-Container auf meinem eigenen Server, und jeder Push auf `main` geht automatisch live."
    tech: ["Hugo", "Docker", "Dokploy", "Cloudflare Tunnel", "Claude Code"]
    links:
      - text: "Wie dieser Blog entstanden ist"
        page: "posts/wie-dieser-blog-entstand"
      - text: "Code auf GitHub"
        url: "https://github.com/MikaSchulz/MeinBlog"
  - id: "homelab"
    title: "Homelab"
    status: "Läuft"
    text: "Ein Mini-PC, der eigentlich für den Fernseher gedacht war, ist heute mein Server. Mit Proxmox laufen darauf der Blog, eine Dev-Box zum Programmieren, mein Second Brain und Home Assistant. Öffentlich ist nur der Blog, alles andere ist über Cloudflare Zero Trust und Tailscale abgesichert."
    tech: ["Proxmox", "Docker & Dokploy", "Cloudflare Zero Trust", "Tailscale", "SilverBullet"]
  - id: "smart-home"
    title: "Smart Home"
    status: "Läuft"
    text: "Home Assistant ist die Zentrale für Licht, Heizung, Türschloss und Türsummer, alles lokal statt in der Cloud des Herstellers. Meine Lieblings-Automation: nach Hause kommen mit dem Fahrrad auf der Schulter, ohne einen Schlüssel anzufassen."
    tech: ["Home Assistant", "Matter & Thread", "Philips Hue", "Shelly", "Nuki", "MQTT"]
  - id: "repper"
    title: "Repper"
    status: "In Arbeit"
    text: "Eine schlanke iPhone-App, die im Gym Wiederholungen zählt: Handy auf den Gewichtsblock legen, trainieren, fertig. Gerade bringe ich ihr bei, mit der Apple Watch auch bei Kurzhantel-Übungen mitzuzählen. Das ist schwerer, als es klingt, weil sich die Hand dabei im Bogen bewegt."
    tech: ["iOS", "Apple Watch", "Bewegungssensoren", "Vibe-Coding"]
  - id: "wanna"
    title: "Wanna"
    status: "In Arbeit"
    text: "Mutual-Match für Aktivitäten: Zwei Personen wählen privat aus, worauf sie gerade Lust haben, zum Beispiel Film gucken oder kochen. Wählen beide dasselbe, gibt es ein Match und eine Push-Nachricht. Für alle, die sich länger nicht gesehen haben oder sich nicht trauen, selbst etwas vorzuschlagen."
    tech: ["Compose Multiplatform", "Firebase", "Google Cloud", "Push-Benachrichtigungen"]
  - id: "minecraft"
    title: "Minecraft-Mods"
    status: "Schulzeit"
    text: "Meine ersten Projekte in Java, als Jugendlicher. Eine Mod hat einen Fehler im Spiel ausgeglichen und berechnet, aus welcher Höhe ein bestimmter Sprung sicher ist; bald hat sie fast die ganze Community dieses Spielmodus genutzt. Dazu kamen Plugins für kleinere Server: Spielmodi und ein Lobby-System."
    tech: ["Java", "Forge", "LabyMod", "Spigot", "Paper"]
---

Was ich neben dem Job baue: vom eigenen Server über das Smart Home bis zu eigenen Apps. Wo es schon einen Beitrag dazu gibt, ist er verlinkt.
