---
title: "Projekte"
slug: "projekte"
description: "Was Mika Schulz neben dem Job baut: dieser Blog, ein Homelab, ein Smart Home mit Home Assistant und eigene Apps."
date: 2026-10-22
wide: true
---

Was ich neben dem Job baue: vom eigenen Server über das Smart Home bis zu eigenen Apps. Wo es schon einen Beitrag dazu gibt, ist er verlinkt.

<div class="projects">

<section class="project">
<div class="project-status">Online</div>
<h2 class="project-title">Dieser Blog</h2>

Ein zweisprachiger Blog mit Hugo. Gebaut hat ihn größtenteils die KI, Ideen, Entscheidungen und Texte sind von mir. Er läuft als Docker-Container auf meinem eigenen Server, und jeder Push auf `main` geht automatisch live.

<div class="tech-stack">

- Hugo
- Docker
- Dokploy
- Cloudflare Tunnel
- Claude Code

</div>

<div class="project-link">

[Wie dieser Blog entstanden ist]({{< relref "posts/wie-dieser-blog-entstand" >}}) · [Code auf GitHub](https://github.com/MikaSchulz/MeinBlog)

</div>
</section>

<section class="project">
<div class="project-status">Läuft</div>
<h2 class="project-title">Homelab</h2>

Ein Mini-PC, der eigentlich für den Fernseher gedacht war, ist heute mein Server. Mit Proxmox laufen darauf der Blog, eine Dev-Box zum Programmieren, mein Second Brain und Home Assistant. Öffentlich ist nur der Blog, alles andere ist über Cloudflare Zero Trust und Tailscale abgesichert.

<div class="tech-stack">

- Proxmox
- Docker & Dokploy
- Cloudflare Zero Trust
- Tailscale
- SilverBullet

</div>
</section>

<section class="project">
<div class="project-status">Läuft</div>
<h2 class="project-title">Smart Home</h2>

Home Assistant ist die Zentrale für Licht, Heizung, Türschloss und Türsummer, alles lokal statt in der Cloud des Herstellers. Meine Lieblings-Automation: nach Hause kommen mit dem Fahrrad auf der Schulter, ohne einen Schlüssel anzufassen.

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
<div class="project-status">In Arbeit</div>
<h2 class="project-title">Repper</h2>

Eine schlanke iPhone-App, die im Gym Wiederholungen zählt: Handy auf den Gewichtsblock legen, trainieren, fertig. Gerade bringe ich ihr bei, mit der Apple Watch auch bei Kurzhantel-Übungen mitzuzählen. Das ist schwerer, als es klingt, weil sich die Hand dabei im Bogen bewegt.

<div class="tech-stack">

- iOS
- Apple Watch
- Bewegungssensoren
- Vibe-Coding

</div>
</section>

<section class="project">
<div class="project-status">In Arbeit</div>
<h2 class="project-title">Wanna</h2>

Mutual-Match für Aktivitäten: Zwei Personen wählen privat aus, worauf sie gerade Lust haben, zum Beispiel Film gucken oder kochen. Wählen beide dasselbe, gibt es ein Match und eine Push-Nachricht. Für alle, die sich länger nicht gesehen haben oder sich nicht trauen, selbst etwas vorzuschlagen.

<div class="tech-stack">

- Compose Multiplatform
- Firebase
- Google Cloud
- Push-Benachrichtigungen

</div>
</section>

<section class="project">
<div class="project-status">Schulzeit</div>
<h2 class="project-title">Minecraft-Mods</h2>

Meine ersten Projekte in Java, als Jugendlicher. Eine Mod hat einen Fehler im Spiel ausgeglichen und berechnet, aus welcher Höhe ein bestimmter Sprung sicher ist; bald hat sie fast die ganze Community dieses Spielmodus genutzt. Dazu kamen Plugins für kleinere Server: Spielmodi und ein Lobby-System.

<div class="tech-stack">

- Java
- Forge
- LabyMod
- Spigot
- Paper

</div>
</section>

</div>
