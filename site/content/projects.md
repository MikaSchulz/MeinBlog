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
    text: "Ein zweisprachiger Blog, gebaut mit Hilfe von KI. Ideen und Blogeinträge sind von mir. Er läuft als Docker-Container via Dokploy auf meinem eigenen Server."
    tech: ["Hugo", "Docker", "Dokploy", "Cloudflare Tunnel", "Claude Code"]
    links:
      - text: "Wie dieser Blog entstanden ist"
        page: "posts/wie-dieser-blog-entstand"
      - text: "Code auf GitHub"
        url: "https://github.com/MikaSchulz/MeinBlog"
  - id: "homelab"
    title: "Homelab"
    status: "Läuft"
    text: "Ein NUC-Mini-PC, ursprünglich als Fernseherersatz gedacht, ist heute mein Server. Mit Proxmox laufen darauf der Blog, eine Dev-Box zum Programmieren, ein Second Brain, ein Pi-hole, ein Tailscale Exit Node sowie Home Assistant. Öffentlich erreichbar ist nur der Blog. Abgesichert ist alles über einen Cloudflare Zero Trust Tunnel und Tailscale."
    tech: ["Proxmox", "Docker & Dokploy", "Cloudflare Zero Trust", "Tailscale", "SilverBullet", "Pi-hole"]
  - id: "smart-home"
    title: "Smart Home"
    status: "Läuft"
    text: "Home Assistant ist die Zentrale für Licht, Heizung, Türschloss und Türsummer sowie Tür- und Fenstersensoren. Alles ist lokal über ein Matter-over-Thread-Netzwerk verbunden. Meine Lieblings-Automation: nach Hause kommen mit dem Fahrrad auf der Schulter und, ohne einen Schlüssel anzufassen, mit dem Smartphone die Haustür öffnen."
    tech: ["Home Assistant", "Matter", "Thread", "Shelly", "Nuki", "MQTT"]
  - id: "repper"
    title: "Repper"
    status: "In Arbeit"
    text: "Eine „leichtgewichtige“ App (pun intended), die im Gym Wiederholungen zählt, indem man sie auf den Gewichtsblock legt. Beim Training misst sie anhand der Bewegungssensoren des Smartphones, wie viele Wiederholungen der Trainierende gemacht hat. In Zukunft soll dies auch als Smartwatch-App verfügbar sein. Allerdings ist die Sensorik deutlich schwieriger, da sich die Hand bei Kurzhantelübungen im Bogen bewegt."
    tech: ["iOS", "Apple Watch", "Bewegungssensoren", "Vibe-Coding"]
  - id: "wanna"
    title: "Wanna"
    status: "In Arbeit"
    text: "Mutual-Match für Aktivitäten: Zwei Personen wählen privat aus, worauf sie gerade Lust haben, zum Beispiel Film gucken oder kochen. Wählen beide dasselbe, gibt es ein Match und eine Push-Nachricht. Für alle, die sich länger nicht gesehen haben oder sich nicht trauen, selbst etwas vorzuschlagen."
    tech: ["Compose Multiplatform", "Firebase", "Google Cloud", "Push-Benachrichtigungen"]
  - id: "podcast"
    title: "Daily News Podcast"
    status: "Pausiert"
    text: "Ein KI-generierter Nachrichten-Podcast, der täglich neu erstellt wird. Er holt sich die Themen aus RSS-Feeds. Die Kategorien, etwa Welt, Wirtschaft oder Tech, lassen sich konfigurieren und gewichten. Themen, über die viel berichtet wird, werden bei der Gewichtung bevorzugt. War ein Thema in den letzten Tagen schon Teil des Podcasts, so wird nicht noch einmal darüber berichtet. Claude schreibt den Sprechtext, Google Text-to-Speech liest ihn vor, und die MP3 wird in Google Drive hochgeladen. Jeden Morgen rund 30 Minuten tagesaktuelle News."
    tech: ["Python", "Claude Code", "Google Text-to-Speech", "GitHub Actions", "Google Drive", "RSS"]
    links:
      - text: "Code auf GitHub"
        url: "https://github.com/MikaSchulz/DailyNewsPodcast"
  - id: "wortel"
    title: "Wortel"
    status: "Pausiert"
    text: "Ein deutsches Rätselspiel nach dem Prinzip von Wordle. Die Wörter haben vier bis sieben Buchstaben. Eine Tippfunktion ergänzt Buchstaben, die in der Lösung vorkommen. Angefangen mit Spring Boot, dann umgezogen auf Supabase: Postgres, Login und eine REST-API als Edge Functions in TypeScript. Die App ist in Compose Multiplatform gebaut und läuft im Browser und auf Android."
    tech: ["Supabase", "TypeScript", "Compose Multiplatform", "PostgreSQL", "Deno", "GitHub Actions"]
    links:
      - text: "Code auf GitHub"
        url: "https://github.com/MikaSchulz/Wortel"
  - id: "tamagotchi"
    title: "TamagotchiVB"
    status: "Schulzeit"
    text: "Ein virtuelles Haustier, angelehnt an Tamagotchis. Entstanden als Schulprojekt im Team, bei dem der Fokus auf objektorientiertem Programmieren in Visual Basic lag. Zu Anfang lässt sich zwischen Katze, Hund und Axolotl wählen. Man muss es füttern, streicheln und bei Laune halten. Der Schwierigkeitsgrad legt fest, wie schnell sich die Werte dafür ändern. Das passiert auch dann, wenn das Programm geschlossen ist. Kümmert man sich zu wenig um sein Haustier, so stirbt es. Münzen verdient man in Minispielen wie Memory oder am Spielautomaten. Man gibt sie im Shop für Futter aus. Die Grafiken sind teils von Hand gezeichnet und dann selbst mit Vektorgrafikprogrammen nachgezeichnet."
    tech: ["VB.NET", "Windows Forms", ".NET Framework", "Visual Studio"]
    links:
      - text: "Code auf GitHub"
        url: "https://github.com/MikaSchulz/TamagotchiVB"
  - id: "minecraft"
    title: "Minecraft-Mods"
    status: "Schulzeit"
    text: "Erste Projekte in Java, als Jugendlicher. Mods und Plugins wie ein „King of the Hill“-Spielmodus oder ein Lobby-System."
    tech: ["Java", "Forge", "LabyMod", "Spigot", "Paper"]
---

Was ich neben dem Job baue: vom eigenen Server über das Smart Home bis zu eigenen Apps. Wo es schon einen Beitrag dazu gibt, ist er verlinkt.
