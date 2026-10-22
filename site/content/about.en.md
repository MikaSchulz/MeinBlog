---
title: "About Me"
date: 2025-10-17
draft: false
image: "/assets/images/profile.jpg"
imageAlt: "Mika wearing glasses and smiling, with colorful lanterns and string lights in the background"
---

Moin, I'm Mika, a software engineer from Hamburg. Since 2023 I've been working in logistics at Otto, where I also did my apprenticeship as an IT specialist for application development. I first started programming at twelve, writing Minecraft mods. What excites me most is architecture: building processes that stay simple and easy to follow.

## Career

<div class="timeline">

<div class="timeline-item">
<div class="timeline-marker"></div>
<div class="timeline-content">
<div class="timeline-date">Since 2023</div>
<h3 class="timeline-title">Software Engineer</h3>
<div class="timeline-location">Otto, Hamburg · Logistics</div>

Our services work out how best to split the items of an order into parcels, based on stock levels, warehouse capacity, item size and weight, and dangerous goods rules. The goal is as few parcels as possible while keeping the promised delivery date.

- Shipment planning: played a key role in separating order lines from delivery lines, so failed deliveries can be retried cleanly
- Building and running our services the "you build it, you run it" way, with infrastructure in Terraform on Google Cloud and AWS
- Domain modeling with Domain-Driven Design and Event Storming
- Coordinating within the team and with other teams

</div>
</div>

<div class="timeline-item">
<div class="timeline-marker"></div>
<div class="timeline-content">
<div class="timeline-date">2020–2023</div>
<h3 class="timeline-title">Apprenticeship as an IT Specialist for Application Development</h3>
<div class="timeline-location">Otto, Hamburg · Fachinformatiker für Anwendungsentwicklung</div>

- Shortened to two and a half years, final exam graded "good" (82 out of 100 points)
- Data warehouse: ETL pipelines in SQL following Data Vault 2.0
- Business intelligence and data science: first steps with Power BI, sales forecasts with Python and machine learning
- IT security: worked through the OWASP Top 10, presented current topics in the weekly security meeting
- Java development with Spring Boot, which is where I stayed
- In the apprentice team, took on projects for other teams
- Final project: a stock correction service. Corrections are stored as events and posted to the inventory system.

</div>
</div>

<div class="timeline-item">
<div class="timeline-marker"></div>
<div class="timeline-content">
<div class="timeline-date">Until 2020</div>
<h3 class="timeline-title">Abitur</h3>
<div class="timeline-location">German university entrance qualification</div>

- Computer science from year 7, part of my media-focused profile in the Abitur
- On the side, my first projects in Java: Minecraft mods (Forge, LabyMod add-on), game modes and a lobby system for smaller servers

</div>
</div>

</div>

## Skills

<div class="skills-section">

### Languages & Frameworks

<div class="tech-stack">

- Java
- Spring Boot
- Gradle

</div>

### Cloud & Infrastructure

<div class="tech-stack">

- Google Cloud (Cloud Run)
- AWS (EKS, SQS, SNS, S3, EC2, RDS, SSM)
- Terraform
- Docker

</div>

### Data & Messaging

<div class="tech-stack">

- PostgreSQL
- MongoDB Atlas
- Kafka

</div>

### Monitoring

<div class="tech-stack">

- Grafana
- Prometheus
- OpenTelemetry (currently learning)

</div>

### Methods & Tools

<div class="tech-stack">

- Domain-Driven Design
- Event Storming
- Agile teams
- Jira & Confluence
- GitHub Copilot

</div>

### Also worked with

<div class="tech-stack">

- Kubernetes
- Helm
- Python
- SQL & Data Vault 2.0
- OWASP Top 10

</div>

### Private: Homelab & AI

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

## Languages

- **German:** native
- **English:** good (B2)

## Interests

Smart home and homelab, fitness (gym three times a week), meal prep, building bricks, music, travel.

## How I Work

Architecture is what I enjoy most. My rule of thumb: the technology should mirror the business processes. When the two drift apart, every small change on the business side turns into a big one on the technical side. That's why we build our services following Domain-Driven Design and get together for Event Storming first: as a team, we go through which business events exist, in what order they happen and how we map them technically.

One example I'm proud of: an order can be split across several deliveries. If a delivery fails, say because an item turned out to be unavailable after all, the customer still wants their parcel, so we start a new attempt. Originally, order lines and delivery lines lived in a single entity that had to handle both, which made every new attempt complicated: the delivery was over, but the order wasn't. We split the two, each with its own lifecycle. Now a delivery can end while the order carries on until it's really done.

I also like to streamline processes. I'd rather think twice and find a standard than maintain several similar flows that overlap somewhere. A few extra bytes in the database are cheaper than two variants of the same process that need separate attention with every fix. That carries over into my private life: at home I automate whatever I can with Home Assistant, and I portion out the dry ingredients for my shakes several days in advance.

AI has become a fixed part of how I work, with GitHub Copilot on the job and Claude Code at home. When coding, it's my pair programming partner: it drives, I navigate and say where we're going. When I have ideas, I deliberately ask it for criticism rather than agreement. And instead of tediously clicking boxes and arrows together, I have it generate processes as Mermaid diagrams; that's faster and clearer in the end. How far we should use AI and where its limits are is something I think about a lot right now. I believe it will play a very big role, probably bigger than many expect. Exactly how big, I wouldn't dare predict at this pace.

## Contact

Drop me a message via [LinkedIn](https://www.linkedin.com/in/mika-schulz-538b5a246/) or by email at [info@eyetealer.me](mailto:info@eyetealer.me).

*I write here in a private capacity. What you read on this blog is my own opinion, not Otto's.*
