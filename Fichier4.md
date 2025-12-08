
---

# 🟨 **Fichier 4 — schema_D.md**  
### *(Schéma détaillé niveau gouvernance)*

---

## 📄 **schema_D.md**

```md
# Schéma D – Vue détaillée (niveau gouvernance & comités projet)

## 🎯 Résumé
Schéma destiné aux directions projet, architectes et équipes de gouvernance.  
Il détaille l’ensemble des flux, validations, rétroactions et responsabilités  
entre France, pipeline GitHub, Espagne, Key Users et pilotage global.

---

## 🧠 Vue détaillée

```mermaid
flowchart TB

    PREPKG[🇫🇷 Preparation PKG-Core avant Lot 1]

    subgraph FR[🇫🇷 France – Core Model]
        direction TB
        L1[Lot 1 Dev/Test] --> L2[Lot 2 Dev/Test]
        L2 --> L3[Lot 3 Dev/Test]
        L3 --> L4[Lot 4 Dev/Test]
        L4 --> L5[Lot 5 Dev/Test]
    end

    subgraph PIPE[⚙️ Pipeline GitHub France]
        L1 --> DEP1[Install Lot 1]
        L2 --> DEP2[Install Lot 2]
        L3 --> DEP3[Install Lot 3]
        L4 --> DEP4[Install Lot 4]
        L5 --> DEP5[Install Lot 5]
    end

    subgraph ES[🇪🇸 Espagne – Specifiques & NR]
        SPEC[Specifiques Espagne (depuis Lot 1)]

        DEP2 --> NR2[Test impacts Lot 2] --> DEC2{Impacts ?}
        DEC2 -->|Oui| FIX2[Corrections] --> R2[Reinstallation] --> NR2B[Retest]
        DEC2 -->|Non| OK2

        DEP3 --> NR3[Test impacts Lot 3] --> DEC3{Impacts ?}
        DEC3 -->|Oui| FIX3 --> R3 --> NR3B
        DEC3 -->|Non| OK3

        DEP4 --> NR4[Test impacts Lot 4] --> DEC4{Impacts ?}
        DEC4 -->|Oui| FIX4 --> R4 --> NR4B
        DEC4 -->|Non| OK4

        DEP5 --> NR5[Test impacts Lot 5] --> DEC5{Impacts ?}
        DEC5 -->|Oui| FIX5 --> R5 --> NR5B
        DEC5 -->|Non| OK5
    end

    OK5 --> KU1[🧪 Tests Key Users]
    KU1 --> KU2[Tests End-to-End]
    KU2 --> MIG[Migration CRM Dynamique → Salesforce]
    MIG --> CORR[Corrections finales]
    CORR --> GO(🚀 Go-Live Janvier 2027)

    PREPKG --> L1
