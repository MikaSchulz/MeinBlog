---
title: "Über mich"
date: 2025-10-17
draft: false
type: about
image: "/assets/images/profile.jpg"
imageAlt: "Mika mit Brille, lächelnd, im Hintergrund bunte Laternen und Lichterketten"
---

Moin, ich bin Mika, Software Engineer aus Hamburg. Seit 2023 arbeite ich bei Otto in der Logistik, vorher habe ich dort meine Ausbildung zum Fachinformatiker für Anwendungsentwicklung gemacht. Zum ersten Mal programmiert habe ich mit zwölf, als Minecraft-Modder. Am meisten reizt mich Architektur: Abläufe so zu bauen, dass sie einfach und nachvollziehbar bleiben.

## Werdegang

<div class="timeline">

<div class="timeline-item">
<div class="timeline-marker"></div>
<div class="timeline-content">
<div class="timeline-date">Seit 2023</div>
<h3 class="timeline-title">Software Engineer</h3>
<div class="timeline-location">Otto, Hamburg · Logistik</div>

Aus den bestellten Artikeln berechnen unsere Services, wie sie am besten auf Pakete verteilt werden. Dabei zählen Bestände, Lagerkapazitäten, Größe und Gewicht der Artikel und Gefahrgutregeln. Ziel sind möglichst wenige Pakete bei gehaltenem Liefertermin.

- Sendungsbildung: maßgeblich an der Trennung von Auftrags- und Lieferposition beteiligt, damit gescheiterte Lieferungen sauber neu abgewickelt werden können
- Entwicklung und Betrieb nach „You build it, you run it", Infrastruktur mit Terraform in der Google Cloud und in AWS
- Fachliche Modellierung mit Domain-Driven Design und Event Storming
- Abstimmung im Team und mit anderen Teams

</div>
</div>

<div class="timeline-item">
<div class="timeline-marker"></div>
<div class="timeline-content">
<div class="timeline-date">2020–2023</div>
<h3 class="timeline-title">Ausbildung zum Fachinformatiker für Anwendungsentwicklung</h3>
<div class="timeline-location">Otto, Hamburg</div>

- Auf zweieinhalb Jahre verkürzt, Abschlussprüfung mit „gut" (82 Punkte)
- Data Warehouse: ETL-Strecken mit SQL nach Data Vault 2.0
- Business Intelligence und Data Science: erste Schritte mit Power BI, Umsatzprognosen mit Python und Machine Learning
- IT-Security: OWASP Top 10 durchgearbeitet, in der wöchentlichen Security-Runde aktuelle Themen vorgestellt
- Java-Entwicklung mit Spring Boot, dabei bin ich geblieben
- Im Azubi-Team Aufträge aus anderen Teams umgesetzt
- Abschlussprojekt: ein Service zur Bestandskorrektur. Korrekturen werden als Events gespeichert und im Bestandssystem verbucht.

</div>
</div>

<div class="timeline-item">
<div class="timeline-marker"></div>
<div class="timeline-content">
<div class="timeline-date">Bis 2020</div>
<h3 class="timeline-title">Abitur</h3>

- Informatik ab der 7. Klasse, im Abitur Teil meines Medienprofils
- Nebenbei erste eigene Projekte in Java: Minecraft-Mods (Forge, LabyMod-Addon), Spielmodi und ein Lobby-System für kleinere Server

</div>
</div>

</div>

## Kenntnisse

<div class="skills-section">

### Sprachen & Frameworks

<div class="tech-stack">

- Java
- Spring Boot
- Gradle

</div>

### Cloud & Infrastruktur

<div class="tech-stack">

- Google Cloud (Cloud Run)
- AWS (EKS, SQS, SNS, S3, EC2, RDS, SSM)
- Terraform
- Docker

</div>

### Daten & Messaging

<div class="tech-stack">

- PostgreSQL
- MongoDB Atlas
- Kafka

</div>

### Monitoring

<div class="tech-stack">

- Grafana
- Prometheus
- OpenTelemetry (lerne ich gerade)

</div>

### Methoden & Werkzeuge

<div class="tech-stack">

- Domain-Driven Design
- Event Storming
- Agile Teams
- Jira & Confluence
- GitHub Copilot

</div>

### Außerdem gearbeitet mit

<div class="tech-stack">

- Kubernetes
- Helm
- Python
- SQL & Data Vault 2.0
- OWASP Top 10

</div>

### Privat: Homelab & KI

<div class="tech-stack">

- Proxmox
- Home Assistant
- Docker & Dokploy
- Cloudflare
- Tailscale
- Hugo
- Claude Code

</div>

</div>

## Sprachen

- **Deutsch:** Muttersprache
- **Englisch:** gut (B2)

## Interessen

Smart Home und Homelab, Fitness (dreimal die Woche im Gym), Meal Prep, Klemmbausteine, Musik, Reisen.

## Wie ich arbeite

Am liebsten beschäftige ich mich mit Architektur. Meine Faustregel: Die Technik soll die fachlichen Abläufe abbilden. Laufen beide auseinander, wird aus jeder kleinen Änderung im Business eine große in der Technik. Deshalb bauen wir unsere Services nach Domain-Driven Design und setzen uns vorher zum Event Storming zusammen: Gemeinsam gehen wir durch, welche fachlichen Ereignisse es gibt, in welcher Reihenfolge sie passieren und wie wir sie technisch abbilden.

Ein Beispiel, auf das ich stolz bin: Eine Bestellung kann über mehrere Lieferungen laufen. Klappt eine Lieferung nicht, etwa weil ein Artikel doch nicht mehr verfügbar war, will der Kunde sein Paket trotzdem, also starten wir einen neuen Versuch. Ursprünglich steckten Auftragsposition und Lieferposition in einer einzigen Entität, die beides können musste, und jeder neue Versuch wurde kompliziert: Die Lieferung war vorbei, der Auftrag aber noch nicht. Wir haben beides getrennt, jede mit eigenem Lebenszyklus. Seitdem kann eine Lieferung enden, während der Auftrag weiterläuft, bis er wirklich erledigt ist.

Außerdem verschlanke ich gern Prozesse. Lieber zweimal länger nachdenken und einen Standard finden, als mehrere ähnliche Abläufe zu pflegen, die sich irgendwo überschneiden. Ein paar Bytes mehr in der Datenbank sind billiger als zwei Varianten desselben Prozesses, die man bei jedem Fix getrennt anfassen muss. Das zieht sich bis ins Private: Zu Hause automatisiere ich mit Home Assistant, was sich automatisieren lässt, und die trockenen Zutaten für meine Shakes portioniere ich für mehrere Tage vor.

KI gehört für mich fest dazu, im Job mit GitHub Copilot, privat mit Claude Code. Beim Programmieren ist sie mein Pair-Programming-Partner: Sie fährt, ich navigiere und sage, wo es hingeht. Bei Ideen frage ich sie bewusst nach Kritik statt nach Zustimmung. Und Prozesse klicke ich nicht mehr mühsam mit Kästchen und Pfeilen zusammen, sondern lasse sie als Mermaid-Diagramm erzeugen; das geht schneller und ist am Ende übersichtlicher. Wie weit man KI einsetzen sollte und wo ihre Grenzen liegen, beschäftigt mich gerade sehr. Ich glaube, sie wird eine sehr große Rolle spielen, wahrscheinlich eine größere, als manche erwarten. Wie groß genau, traue ich mich bei dem Tempo nicht vorherzusagen.

## Kontakt

Schreibt mir gern über [LinkedIn](https://www.linkedin.com/in/mika-schulz-538b5a246/) oder per Mail an [info@eyetealer.me](mailto:info@eyetealer.me).

*Hier schreibe ich privat. Was auf diesem Blog steht, ist meine eigene Meinung und nicht die von Otto.*
