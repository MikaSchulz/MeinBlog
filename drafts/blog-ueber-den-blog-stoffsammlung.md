# Stoffsammlung: Ein Blog über den Blog

> **Arbeitsdokument, kein fertiger Artikel.** Grundlage sind die Git-Historie, die Spec-Kit-Dokumente, der Code und ein lokaler Build von `site/` mit Hugo 0.139.3 (Stand 11.10.2026). eyetealer.me selbst konnte ich aus meiner Umgebung nicht aufrufen.
> Alles mit **[?]** ist eine Vermutung oder eine Frage an dich. Die gesammelten Fragen stehen in Abschnitt 12.

---

## 1. Die Kernaussage in drei Sätzen

- eyetealer.me ist ein zweisprachiger Hugo-Blog **ohne fertiges Theme**: Templates, CSS, JavaScript und Docker-Setup sind maßgeschneidert, aber kaum eine Zeile davon ist von Hand geschrieben.
- Gebaut in **zwei KI-Etappen**: Oktober/November 2025 mit **GitHub Spec Kit + GitHub Copilot** in VS Code (Spezifikation → Plan → Aufgaben → Umsetzung), Mai 2026 mit **Claude Code** (Produktions-Image, Deployment über Dokploy, Fehlersuche).
- Die spannendste Erkenntnis: Die KI liefert in Stunden, wofür man sonst Wochenenden braucht. Sie hakt aber auch Aufgaben als erledigt ab, die es nicht ganz sind. Der Mensch bleibt Reviewer.

---

## 2. Zeitstrahl

| Datum | Uhrzeit | Was passiert ist | Werkzeug |
|---|---|---|---|
| Fr, 17.10.2025 | 20:43 | `first commit`, leeres Repo | – |
| | 20:55 | Spec Kit initialisiert (Prompts, Skripte, Templates: 21 Dateien, ~3.300 Zeilen Gerüst) | Spec Kit |
| | 21:05 | „Verfassung" (Constitution) mit den Grundprinzipien | `/speckit.constitution` |
| | 21:25 | Spezifikation + Qualitäts-Checkliste | `/speckit.specify`, `/speckit.clarify` |
| | 21:40 | Umsetzungsplan + 32 Aufgaben | `/speckit.plan`, `/speckit.tasks` |
| | 21:43–21:59 | Verfassung 1.1.0: neues Prinzip „Cross-Platform" (Bash statt PowerShell, `/` statt `\`) | `/speckit.constitution` |
| So, 19.10.2025 | 10:45 | Komplette Umsetzung in **einem** Commit: 50 Dateien, +2.405 Zeilen, alle 32 Aufgaben abgehakt | `/speckit.implement` |
| So, 02.11.2025 | 23:20 | Design & Inhalte: Farbsystem, dunkles Theme, Startseite mit Hero-Bereich, „Über mich" mit Zeitleiste, Sprachwahl mit Flaggen, Favicons, erstes Dockerfile (55 Dateien) | Copilot [?] |
| | | ~6 Monate Pause [?] | |
| Sa, 09.05.2026 | 12:37 | Produktions-Dockerfile (Multi-Stage: Hugo baut, nginx liefert aus) | Claude Code |
| | 12:48 | `.gitignore`-Fix für Build-Artefakte | Claude Code |
| | 13:11 | Healthcheck-Bug gefixt (IPv6 vs. `localhost`, siehe Abschnitt 6) | Claude Code |
| | 13:23 | Leerer Commit, um die Webhook-Kette einmal komplett zu testen | Claude Code |

**Zum Zitieren:**
- Vom leeren Repo bis zur fertigen Spezifikation inklusive Plan und Aufgabenliste: **76 Minuten** an einem Freitagabend.
- Deployment-Session: **46 Minuten** zwischen erstem und letztem Commit.
- Vom ersten Commit bis zum Livegang: knapp **7 Monate**, davon die meiste Zeit Pause.

---

## 3. Das Warum (aus dem Repo herausgelesen, bitte durch deinen Senf ersetzen)

Was der Blog selbst über dich sagt:
- Startseite: *„Aktuell vertiefe ich Cloud-Architektur und experimentiere mit KI-gestützten Developer-Tools."*
- Über mich → Zukunftsausblick: Software-Architektur, Cloud, und *„[ich] interessiere mich sehr für KI-Tools und die Möglichkeiten, die sie für moderne Software-Projekte bieten."*
- Seitenbeschreibung in der Config: *„Thoughts and projects on my IT life."*

Mögliche Motive (Vermutungen):
- Ein eigener Ort für Gedanken und Projekte, unabhängig von LinkedIn & Co.
- Der Blog als **Versuchsobjekt**: ein kleines, aber vollständiges echtes Projekt, an dem man KI-Workflows ausprobieren kann (Spec-Driven Development, Coding-Agenten).
- Bewusst **selbst gehostet** statt Medium, Substack oder WordPress.com. Das passt zu Docker, Kubernetes und Terraform in deinem Skill-Profil.
- **Hugo** war deine Vorgabe: In der Spec steht es unter Annahmen („The blog will be built using Hugo"). Statisch, schnell, keine Datenbank, Inhalte als Markdown in Git.

---

## 4. Etappe 1: Spec-Driven Development mit GitHub Spec Kit (Oktober 2025)

### Was ist Spec Kit?
Ein Open-Source-Toolkit von GitHub für **„Spec-Driven Development"**. Statt der KI direkt „bau mir einen Blog" zu sagen, entsteht zuerst eine Spezifikation, dann ein technischer Plan, dann eine Aufgabenliste, und erst dann Code. Jeder Schritt ist ein Slash-Command im KI-Chat.

Im Repo liegen die Befehle als Prompt-Dateien unter `.github/prompts/`. Das ist die Variante für **GitHub Copilot im VS Code Chat**: `.vscode/settings.json` schlägt die Prompts im Chat vor und erlaubt den Hilfsskripten unter `.specify/scripts/`, ohne Nachfrage im Terminal zu laufen.

Die Befehle: `constitution`, `specify`, `clarify`, `plan`, `tasks`, `implement`, dazu `analyze` und `checklist`.

### Schritt 1: Die „Verfassung" (`.specify/memory/constitution.md`)
Spielregeln, an die sich jeder spätere Schritt halten muss. Deine Prinzipien:

1. **Simplicity**: so einfach wie möglich
2. **Maintainability**: leicht änderbar und erweiterbar
3. **Automated Testing**: „Tests are mandatory before merging new features"
4. **Traceable Changes**: alles über Commits/PRs nachvollziehbar
5. **Minimal Dependencies**: keine großen oder unnötigen Abhängigkeiten
6. **Cross-Platform Compatibility**: *nachträglich, 16 Minuten später* (Version 1.0.0 → 1.1.0): alle Befehle in Bash-Syntax, Pfade nur mit `/`, Beispiel `/d/Projects/MeinBlog/`.

**Anekdote:** Prinzip VI verrät, dass du unter Windows (Git Bash) gearbeitet hast und die KI vermutlich PowerShell-Befehle oder Windows-Pfade ausgespuckt hat [?]. Statt das jedes Mal zu korrigieren, hast du es in die Verfassung geschrieben. Die Verfassung ist semantisch versioniert und enthält einen automatisch erzeugten „Sync Impact Report", der auflistet, welche Templates nachgezogen wurden.

### Schritt 2: Die Spezifikation (`specs/dev-blog/spec.md`)
Dein kompletter Input war **ein Satz**:

> „I want to create my own dev blog. The main page will show all my blog posts. I'll include an 'About Me' page, categories and tags for easy navigation, plus a contact section and a link to my GitHub profile."

Daraus wurden rund 120 Zeilen Spezifikation:
- **5 User Stories mit Priorität** (P1: alle Beiträge sehen; P2: Über mich, Kategorien/Tags; P3: GitHub-Link, LinkedIn-Link), jeweils mit Given/When/Then-Akzeptanzkriterien und einem eigenständigen Test.
- Funktionale Anforderungen, Erfolgskriterien, Annahmen, Datenobjekte (Beitrag, Autor), Fehler- und Leerzustände.
- Eine Qualitäts-Checkliste (z. B. „keine Implementierungsdetails in der Spec", „Anforderungen testbar").

### Schritt 3: Die Klärungsrunde (`/speckit.clarify`)
Die KI stellt Rückfragen, statt zu raten. **7 Fragen, 7 Entscheidungen** (Session vom 17.10.2025):

- Kontakt: kein Formular, nur GitHub + LinkedIn. Aus der „contact section" im Ursprungssatz wurde der LinkedIn-Link.
- Ausdrücklich **nicht** im Umfang: Kommentare, Suche, RSS, Analytics, mehrere Autoren.
- Eindeutige Identifikation von Beiträgen (Hugo-Standard: Pfad + Datum).
- Fehlender Link → Icon wird ausgeblendet; ungültiger Link → normale Browser-Fehlermeldung.
- **Barrierefreiheit nach WCAG 2.1 AA** und **Mehrsprachigkeit** sind Pflicht.
- Zweite Sprache: Deutsch.
- Entwürfe über `draft: true`.

Bemerkenswert: Mehrsprachigkeit und Barrierefreiheit standen nicht in deinem Satz. Sie kamen erst durch die Rückfragen in die Spec. [?] Hat die KI das vorgeschlagen, oder war das deine Antwort auf eine offene Frage?

### Schritt 4: Plan & Aufgaben
- **`plan.md`:** Technik (Hugo, nur der Kern, keine Plugins), Ziele (Startseite lädt in < 1 s, Lighthouse > 90), Abgleich mit der Verfassung, Projektstruktur, Risiken und Gegenmaßnahmen.
- **`tasks.md`:** **32 Aufgaben in 8 Phasen** (Setup, Fundament, eine Phase je User Story, Feinschliff). Jede Aufgabe hat eine ID, einen Dateipfad und bei Bedarf eine `[P]`-Markierung für „kann parallel laufen". MVP = Phase 1–3.

### Schritt 5: Umsetzung (`/speckit.implement`)
Ein einziger Commit am Sonntagmorgen, 19.10.2025:
- Hugo-Seite unter `site/`, **eigene Layouts statt fremdem Theme**
- Sprachdateien DE/EN, Navigation, Skip-Link, ARIA-Labels
- Testanleitungen je User Story unter `specs/dev-blog/tests/`
- ein ausführliches README
- alle 32 Checkboxen auf `[x]`

Nebenbei wurde der Build-Output (`site/public/`) mit eingecheckt. Gelöscht wurde er im November, den passenden `.gitignore`-Fix hat im Mai 2026 Claude Code nachgeliefert.

---

## 5. Etappe 2: Design & Inhalte (02.11.2025)

Der größte Einzel-Commit (55 Dateien, Commit-Message: „chore: some content"):

- **Farbsystem:** Alle Farben stehen in `config.toml` unter `[params.colors]`, Standardwerte in `data/color-defaults.toml`. Beim Build werden sie als CSS-Variablen in die Seite geschrieben. Ein Hugo-Template prüft beim Build, ob die Werte gültig sind (Hex, `rgb()`, Farbnamen), und bricht sonst mit einer Fehlermeldung ab.
- **Look:** dunkles Petrol (`#01161e` Hintergrund, `#124559` Header/Footer), weiße Überschriften, Orange als Akzent (`#ff6d00`, Hover `#ffa864`).
- **Startseite:** Hero-Bereich mit Kurzvorstellung und Profilbild, darunter die Beiträge.
- **Über mich:** ausführlicher Werdegang (Minecraft-Modding → Ausbildung zum Fachinformatiker Anwendungsentwicklung bei Otto → Java Software Engineer), vertikale Zeitleiste, „Was mich antreibt"-Raster, Skills als Karten. Alles als HTML direkt im Markdown, deshalb ist im Markdown-Renderer `unsafe = true` gesetzt.
- **Sprachwahl:** Dropdown mit SVG-Flaggen, mit der Tastatur bedienbar (Escape schließt), erkennt beim ersten Besuch die Browsersprache und leitet passend um.
- **Favicons & Web-App-Manifest.**
- **Erstes Docker-Setup:** ein Alpine-Container, der beim Start per GitHub-Token das Repo als Tarball herunterlädt (`download_repo.sh`) und dann `hugo server`, also den **Entwicklungsserver**, auf Port 1313 laufen lässt.

[?] Das Farbsystem mit den Prioritäten P1/P2/P3 in den Kommentaren sieht nach einem zweiten Spec-Kit-Feature aus. Die Fehlermeldung verweist außerdem auf eine `site/COLOR-CONFIGURATION.md`, die es im Repo nicht gibt. Gab es dafür eine eigene Spec, die nie committet wurde?

---

## 6. Etappe 3: Ab ins Internet mit Claude Code (09.05.2026)

### Die Hosting-Kette (laut Commit-Messages)

```
git push → GitHub-Webhook → Cloudflare Tunnel → Dokploy → Docker-Build
        → Docker Swarm → Traefik → eyetealer.me
```

- **Dokploy:** Open-Source-Plattform zum Selbsthosten, ähnlich wie Vercel oder Netlify, nur auf eigener Hardware. Baut aus dem Git-Repo ein Docker-Image und deployt es; nutzt intern Docker Swarm und Traefik als Reverse Proxy.
- **Cloudflare Tunnel:** macht den Server von außen erreichbar, ohne Ports am Router oder an der Firewall zu öffnen [?].
- Ergebnis: Jeder Push auf `main` geht automatisch live.

### Was Claude Code geändert hat

1. **Multi-Stage-Dockerfile:** Stufe 1 baut die Seite mit fest gepinntem Hugo 0.139.3 (`hugomods/hugo`) und minifiziert sie. Stufe 2 liefert nur noch die statischen Dateien mit `nginx:1.27-alpine` aus, mit Cache-Headern für Bilder/CSS/JS und sauberen URLs. Kein Entwicklungsserver und kein GitHub-Token mehr im Container. `download_repo.sh` ist seitdem überflüssig, liegt aber noch im Repo.
2. **`.gitignore`-Fix:** Die Ignore-Regeln für `public/` haben nie gegriffen, weil Hugo im Unterordner `site/` läuft.
3. **Der Healthcheck-Krimi** (wahrscheinlich die beste Anekdote):
   - **Symptom:** eyetealer.me zeigt *502 Bad Gateway*.
   - **Ursache:** Der Docker-Healthcheck fragt `http://localhost/` ab. Im Alpine-Image löst der musl-Resolver `localhost` zuerst zu `::1` (IPv6) auf, nginx lauscht aber nur auf IPv4.
   - **Kettenreaktion:** „Connection refused" → Docker Swarm hält den Container für krank → Neustart-Schleife → Traefik findet nie ein gesundes Backend → 502.
   - **Fix:** eine Zeile. `127.0.0.1` statt `localhost`.
   - Genau die Art Fehler, nach der man allein stundenlang sucht. Die Commit-Message erklärt die komplette Kette.
4. **Webhook-Test:** ein leerer Commit („test: trigger Dokploy webhook end-to-end"), nur um zu sehen, ob ein Push wirklich automatisch neu deployt.

Alle vier Commits tragen die Zeile `Co-Authored-By: Claude Opus 4.7`. Die KI-Beteiligung ist damit direkt in der Git-Historie nachvollziehbar, was gut zu Prinzip IV („Traceable Changes") passt.

---

## 7. Tech-Stack auf einen Blick

| Bereich | Technik |
|---|---|
| Static Site Generator | Hugo 0.139.3 (extended), **kein Theme** |
| Inhalte | Markdown + Front Matter; Deutsch als Standard unter `/`, Englisch unter `/en/` |
| Styling | eigenes CSS (~810 Zeilen), Farben als CSS-Variablen aus `config.toml` |
| JavaScript | genau eine Datei (Sprachwahl + Browsersprache, 56 Zeilen) |
| Planung & Umsetzung 2025 | GitHub Spec Kit + GitHub Copilot in VS Code |
| Deployment 2026 | Claude Code |
| Container | Multi-Stage: `hugomods/hugo` → `nginx:1.27-alpine` |
| Hosting | Dokploy (Docker Swarm + Traefik), Cloudflare Tunnel, Auto-Deploy per GitHub-Webhook |
| Domain | eyetealer.me |

---

## 8. Zahlen & Fakten

- **1 Satz** Input → ~120 Zeilen Spezifikation, **5** User Stories, **7** Klärungsfragen, **32** Aufgaben
- **13** Commits, **78** Dateien im Repo
- **~1.400** Zeilen eigener Code (Templates, CSS, JS, Config), davon ~810 Zeilen CSS
- **0** Themes, **0** npm-Pakete, **0** JS-Frameworks
- **2** Sprachen, je ~150 Zeilen „Über mich"
- **2** KI-Werkzeuge, **76** Minuten für die Planung, **46** Minuten für die Deployment-Session

---

## 9. Der ehrliche Teil: Was die KI abgehakt, aber nicht erledigt hat

Beim Durchsehen und lokalen Bauen ist einiges aufgefallen. Gutes Material für den Artikel („32 von 32 Aufgaben erledigt. Fast."). Einiges davon solltest du aber vermutlich **vor** dem ersten Beitrag fixen, weil es live sichtbar ist.

### Sichtbar auf der Seite
- Die **Überschrift über den Beiträgen ist leer**, der „Weiterlesen"-Link zeigt nur „→", und vor dem Datum fehlt „Veröffentlicht am". Ursache: Die Übersetzungsschlüssel `recentPosts`, `publishedOn`, `readMore` und `posts` werden in den Templates benutzt, stehen aber in keiner Sprachdatei. Hugo warnt beim Bauen sogar davor.
- Das **Datum steht auch auf der deutschen Seite auf Englisch** („October 17, 2025").
- Auf der **Beitragsseite selbst fehlen Datum, Kategorien und Tags**. Die passenden Bausteine (`taxonomy-links.html`, `social-links.html`) wurden zwar gebaut, aber nirgends eingebunden. User Story 3 („Kategorien und Tags") funktioniert also nur über die Übersichtsseiten.
- In der Beitragsliste wird der komplette (kurze) Beitrag als Zusammenfassung angezeigt, inklusive Zwischenüberschrift.
- Der deutsche Platzhalter-Beitrag hat eine englische Zwischenüberschrift („What I'll Write About") und denselben Punkt doppelt („Clean-Code-Praktiken").
- Kleinkram: Das 16×16-Favicon ist als `favicon-16x16.png` verlinkt, heißt aber `favicon-16-16.png`. nginx verweist auf eine `404.html`, die es nicht gibt. „Blog" in der Navigation und einige Screenreader-Texte („Read more about …", „Change language") sind fest auf Englisch.

### Versprochen vs. geliefert
- **Verfassung:** „Automated Testing … Tests are mandatory." **Geliefert:** manuelle Testanleitungen als Markdown. Automatisierte Tests gibt es keine.
- Die **Testanleitungen** prüfen einen Beitrag „Understanding Hugo Static Sites", den es nie gab, und nutzen den Pfad `/d/Projects/MeinBlock/site` (Tippfehler „MeinBlock" steht auch im README).
- **`config.toml` verspricht:** „All colors are validated at build time for format and WCAG AA accessibility standards." **Im Code steht:** „For now, we'll skip the actual contrast calculation". Geprüft wird nur, ob Text- und Hintergrundfarbe identisch sind.
- **Aufgabe T030** „Bilder und CSS optimieren (Lighthouse > 90)" ist abgehakt. Das Profilbild ist aber **2,8 MB** groß und wird auf Start- und Über-mich-Seite geladen. Daneben liegen ein ungenutztes `profile.png` (**5,1 MB**) und ein ungenutztes `logo.png`.
- **RSS** steht in der Spec unter „Out of Scope". Hugo erzeugt standardmäßig trotzdem RSS-Feeds (`index.xml`).
- Das **README** beschreibt noch Deployment auf GitHub Pages/Netlify/Vercel, nicht das tatsächliche Dokploy-Setup.

### Mögliche These daraus
Spec Kit sorgt für Struktur und Nachvollziehbarkeit. Aber **eine abgehakte Checkbox ist eine Behauptung, kein Beweis.** Ohne echte, automatisierte Tests und ohne menschlichen Blick schlüpfen genau solche Dinge durch. Ironischerweise stand das Gegenmittel (Prinzip III: automatisierte Tests) schon in der Verfassung.

---

## 10. Was gut lief

- **Struktur:** Aus einem Satz wurde in gut einer Stunde ein durchdachtes Anforderungsdokument mit klar abgegrenztem Umfang.
- **Klärungsfragen** bringen Dinge auf den Tisch, an die man selbst nicht denkt (Barrierefreiheit, Leerzustände, Entwürfe, was explizit *nicht* gebaut wird).
- **Schlankes Ergebnis:** kein fremdes Theme, keine Abhängigkeiten, nur Hugo plus etwas CSS und JS. „Simplicity" und „Minimal Dependencies" wurden tatsächlich eingehalten.
- **Barrierefreiheits-Grundlagen sind drin:** Skip-Link, semantisches HTML, ARIA-Labels, Tastaturbedienung der Sprachwahl.
- **Claude Code beim Deployment:** Aus einem Entwicklungs-Container mit GitHub-Token wurde ein sauberes Produktions-Image. Ein schwer zu findender Netzwerkfehler wurde gefunden, erklärt und mit einer Zeile behoben.
- **Nachvollziehbarkeit:** Specs, Plan, Aufgaben, Testanleitungen und Co-Author-Zeilen liegen alle im Repo. Man kann die Entstehung des Blogs Commit für Commit nachlesen, und genau das macht diesen Artikel möglich.

---

## 11. Ideen für den Artikel

### Titelideen
- „Diesen Blog habe ich (fast) nicht selbst geschrieben"
- „Ein Satz, zwei KIs, ein Blog"
- „Vom Prompt zum Produktivsystem: Wie eyetealer.me entstanden ist"
- „32 von 32 Aufgaben erledigt. Fast."

### Mögliche Gliederung
1. **Einstieg:** Hallo, das ist der erste Beitrag, und der Blog, auf dem du ihn liest, wurde fast vollständig von KI gebaut.
2. **Warum ein eigener Blog und warum mit KI?**
3. **Spec-Driven Development:** vom Satz zur Spezifikation (Verfassung, Klärungsfragen, Plan)
4. **Umsetzung:** 32 Aufgaben in einem Commit
5. **Feinschliff:** Design und Inhalte
6. **Live gehen mit Claude Code**, inklusive Healthcheck-Krimi
7. **Der ehrliche Teil:** was die KI abgehakt, aber nicht erledigt hat
8. **Fazit** und was als Nächstes kommt

### Mögliche Schlusspointe
Den Artikel selbst als Teil des Experiments zeigen: Die Stoffsammlung kam von der KI, Meinung, Auswahl und Text kamen von dir.

---

## 12. Offene Fragen an dich

1. Warum gerade jetzt ein Blog? Worüber willst du schreiben, und für wen?
2. Woher kommt der Name „eyetealer"?
3. Warum Hugo: bewusste Wahl nach Vergleich oder einfach gesetzt?
4. Welches Modell lief im Oktober 2025 hinter GitHub Copilot?
5. Wie viel hast du selbst angefasst? (Über-mich-Text, Farben, Bilder? Der deutsche Kommentar in der Config, „Orange-Ton für Konsistenz und Sichtbarkeit", klingt nach Handarbeit oder nach einem deutschen Prompt.)
6. Wie hat sich Spec Kit angefühlt: hilfreiche Struktur oder Overkill für einen Blog?
7. Kamen Barrierefreiheit und Mehrsprachigkeit von dir oder von der KI?
8. Was war in den sechs Monaten zwischen November und Mai los?
9. Wo läuft Dokploy (Homelab, Raspberry Pi, VPS)? Warum selbst hosten statt GitHub Pages oder Netlify?
10. Wie lange hast du den 502-Fehler gejagt, bevor Claude Code die Ursache gefunden hat?
11. Was kostet das Ganze (KI-Abos, Domain, Server, Strom)?
12. Würdest du es wieder so machen? Was würdest du anders machen?

---

## 13. Links für den Artikel

- GitHub Spec Kit: https://github.com/github/spec-kit
- Hugo: https://gohugo.io
- Dokploy: https://dokploy.com
- Cloudflare Tunnel: https://developers.cloudflare.com/cloudflare-one/connections/connect-networks/
- Claude Code: https://claude.com/claude-code
