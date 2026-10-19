---
title: "Diesen Blog habe ich (fast) nicht selbst gebaut"
date: 2026-10-19T22:30:00+02:00
description: "Wie eyetealer.me entstanden ist: gebaut mit Hugo und viel KI, selbst gehostet auf meinem NUC."
categories: ["AI"]
tags: ["hugo", "spec-kit", "claude-code", "vibe-coding", "docker", "dokploy"]
---

Ja, und so geht's los. Ich erzähle euch heute, wie dieser Blog entstanden ist: womit er gebaut ist, worauf er läuft und wer ihn eigentlich gebaut hat.

<!--more-->

## Hugo, weil es simpel ist

Zunächst habe ich mich informiert, welches Framework ich nutzen möchte, also was sich ideal für einen Blog eignet. Als Erstes kommt einem natürlich direkt WordPress in den Kopf, aber ehrlich gesagt verbinde ich damit alte Webseiten mit hunderten Plugins und tausenden Sicherheitslücken. Am Ende bin ich dann bei [Hugo](https://gohugo.io) gelandet, einfach weil es super simpel und leicht einzurichten ist. Wer es noch nicht kennt: Hugo ist ein sogenannter Static Site Generator. Ich schreibe die Texte also in Markdown, und Hugo macht daraus statisches HTML. Heißt, ich brauche keine Datenbank und keinen Admin-Login, also gibt es kaum Angriffsfläche. Schließlich bin ich auch kein wahnsinniges Designtalent und beschäftige mich lieber mit den wichtigen Themen, zum Beispiel dem Inhalt.

## Vom Spec Kit zum Vibe-Coding

Nach der Entscheidung musste erstmal gebaut werden. Ich habe mir also Claude Code geschnappt und gleich das neue [Spec Kit](https://github.com/github/spec-kit) von GitHub ausprobiert. Dabei geht es um sogenanntes Spec-Driven Development: Man definiert das Projekt in Spezifikationen, die mit neuen Anforderungen wachsen und mit der Zeit immer präziser formuliert werden. Im Laufe der Zeit bin ich aber aufs Vibe-Coding umgestiegen. Das Entwickeln mit KI hat sich in den letzten Wochen und Monaten so extrem verändert, dass es einen eigenen Blogpost verdient hätte. Aber auch der wäre in wenigen Wochen vermutlich schon wieder überholt.

## Ab auf den NUC: Dokploy

Hugo baut die Seite nach jeder Änderung neu zusammen, und das Ergebnis lässt sich gut in einen Docker-Container{{< info "Was ist ein Docker-Container?" >}}Ein Docker-Container ist eine verpackte Anwendung, die alles mitbringt, was sie zum Laufen braucht, und deshalb überall gleich läuft. In meinem Fall steckt darin ein kleiner Webserver (nginx) mit der fertigen Seite.{{< /info >}} packen.

Der Container lässt sich nun auf nahezu allen Plattformen hosten. Bei vielen Anbietern kann man seine Docker-Container einfach hochladen und ausführen lassen. Und das sogar kostenlos. Aber das war mir etwas zu einfach. Ich wollte es selbst hosten und griff auf meinen NUC{{< info "Was ist ein NUC?" >}}NUC ist eigentlich der Name von Intels Mini-PC-Reihe, hat sich aber für kleine Mini-PCs allgemein eingebürgert. Meiner ist ein ACEMAGICIAN V1 mit Intel N150, 16 GB RAM und 256 GB SSD. Ab Werk lief darauf Windows 11, ich habe zunächst Ubuntu und mittlerweile Proxmox aufgespielt.{{< /info >}} zurück.

Ich hätte die Webseite auch einfach als eigenen Proxmox-Container hosten können, allerdings wollte ich sowieso eine Plattform haben, die all meine Docker-Container hosten kann. Verglichen habe ich [Coolify](https://coolify.io) und [Dokploy](https://dokploy.com), beide Open Source. Sie sind vergleichbar mit einem selbst gehosteten Vercel. Coolify ist älter, hat eine größere Community und mehr Features. Dokploy ist jünger, schlanker und aufgeräumter. Ich brauche nicht viel Funktionalität, sondern Einfachheit. Und da ich Coolify bereits in einem anderen Projekt genutzt habe, habe ich mich für Dokploy entschieden.

Den Blog habe ich in ein öffentliches GitHub-Repo gepusht. In Dokploy habe ich dann das Projekt angelegt und mit GitHub verbunden. Daraufhin bekommt man einen Webhook, den man im GitHub-Repo hinterlegt. Gibt es nun einen Push auf den Main-Branch, ruft GitHub den Webhook auf, und Dokploy baut den Container und deployt ihn. Dank cloudflared{{< info "Was ist cloudflared?" >}}cloudflared ist das kleine Programm hinter Cloudflare Tunnel. Cloudflare selbst ist ein großes Netzwerk, das vor vielen Webseiten sitzt. cloudflared läuft bei mir im Heimnetz und baut von innen eine ausgehende Verbindung zu Cloudflare auf, den Tunnel. Wer eyetealer.me aufruft, landet bei Cloudflare, und die Anfrage wird durch diesen Tunnel an meinen Server weitergereicht. Deshalb muss ich im Router keinen Port öffnen, und niemand kommt direkt in mein Heimnetz. Mehr dazu in einem eigenen Beitrag.{{< /info >}} ist der Blog jetzt im Internet erreichbar.

Ein cooles Gefühl, den Blog endlich live zu sehen – unter der eigenen Domain und gehostet bei mir zu Hause.

{{< figure src="dokploy.webp" width="2000" height="791" alt="Screenshot aus Dokploy: die Anwendung „blog“ (Hugo blog eyetealer.me) mit einem laufenden Container, Status „Up 3 minutes (healthy)“" caption="Dokploy meldet: Der Blog-Container läuft und ist gesund." >}}

## Was mir wichtig war

Noch bevor es inhaltlich losging, habe ich Rahmenbedingungen festgelegt, die mir wichtig waren. Dazu gehört ein guter Kontrast zwischen Text und Hintergrund, damit keine Barrieren entstehen. Das Orange, das sich vor allem durch die „Über mich“-Seite zieht und später auch noch häufiger zum Einsatz kommen wird, habe ich gewählt, weil es mich sehr angesprochen hat. Es ist an McLarens Papaya-Orange angelehnt, und dazu habe ich passende Komplementärfarben für die Hintergründe gewählt.

Weil ich den Blog auch international verfügbar machen möchte, habe ich Englisch als weitere Sprache hinzugefügt. Ich hoffe auf mehr Austausch, auch weil Englisch die Sprache der IT ist.

Eine Kommentarfunktion gibt es aktuell noch nicht. Ich überlege noch, ob ich eine einbaue. Vermutlich würde ich aber auf eine Kommentarsektion mit manueller Freischaltung setzen, da ich der einzige Moderator bin. Meinungsvielfalt ist mir wichtig, aber ich möchte Bots oder Ähnliches verhindern.

## Wie ich mit dem Blog arbeite

Und hier sind wir nun: Ich schreibe einen Blogpost über den Blog. Mein allgemeiner Workflow besteht aus diesen Teilen:

1. Ich habe eine Idee und brainstorme.
2. Ich sortiere die Erkenntnisse ein und erstelle einen Umsetzungsplan.
3. Ich setze um und mache mir regelmäßig Notizen, insbesondere bei Erkenntnissen oder Problemen. Entscheidungen halte ich in einem Entscheidungslog fest.
4. Ich reflektiere und starte gegebenenfalls wieder bei 1.

KI hilft mir bei diesem Prozess, insbesondere bei der Dokumentation und der Reflexion. Ich lasse mich von der KI ausfragen oder frage andersherum die KI, welche Fragen andere stellen oder was sie für wichtig halten würden. Diese Informationen nutze ich, um einen Blogpost zu verfassen. Die Beiträge schreibe ich aber selbst und lasse sie höchstens von der KI probelesen.

## Fazit

Um die Frage zu beantworten: Wer hat den Blog nun gebaut? Die Umsetzung – in erster Linie die KI. Die Planung – in erster Linie ich, im Duo mit der KI. Aber: meine Ideen, meine Entscheidungen, meine Texte.

Und würde ich den Weg wieder so wählen? Größtenteils ja. Hugo lässt sich sehr einfach bedienen. Anders machen würde ich vor allem eins: früher mit dem Schreiben anfangen. Der Blog lief schon lange, bevor der erste Beitrag kam.

Danke fürs Lesen.
