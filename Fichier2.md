
---

# 🟦 **Fichier 2 — schema_B.md**  
### *(Architecture / Process DevOps en 3 colonnes)*

---

## 📄 **schema_B.md**

```md
# Schéma B – Architecture / Process DevOps France → Pipeline GitHub → Espagne

## 🎯 Résumé
Ce schéma représente la structure DevOps du projet avec :
1. La construction du Core Model en France  
2. Les déploiements via GitHub Actions  
3. Les validations de non-régression en Espagne  
4. Le passage à la phase Key Users puis production

## 🧩 Contexte
- L’équipe France construit, teste et package chaque lot.
- Le pipeline GitHub installe automatiquement chaque lot dans PKG-Core Espagne.
- L’équipe Espagne contrôle les impacts sur ses propres packages.
- Le projet intègre ensuite les Key Users et les tests de migration.

---

## 🏗️ Architecture globale

```mermaid
flowchart LR

    subgraph FR[🇫🇷 France – Core Model]
        direction TB
        PREPKG[Preparation PKG-Core avant Lot 1]
        DEV1[Developpement Lot 1] --> TEST1[Test Lot 1] --> PKG1[Package Lot 1]
        DEV2[Developpement Lot 2] --> TEST2[Test Lot 2] --> PKG2[Package Lot 2]
        DEV3[Developpement Lot 3] --> TEST3[Test Lot 3] --> PKG3[Package Lot 3]
        DEV4[Developpement Lot 4] --> TEST4[Test Lot 4] --> PKG4[Package Lot 4]
        DEV5[Developpement Lot 5] --> TEST5[Test Lot 5] --> PKG5[Package Lot 5]
    end

    subgraph CI[⚙️ Pipeline GitHub France]
        PKG1 --> DEP1[Installation Lot 1 → PKG-Core Espagne]
        PKG2 --> DEP2[Installation Lot 2]
        PKG3 --> DEP3[Installation Lot 3]
        PKG4 --> DEP4[Installation Lot 4]
        PKG5 --> DEP5[Installation Lot 5]
    end

    subgraph ES[🇪🇸 Espagne – Developpements locaux]
        direction TB
        SPEC[Developpement Specifiques des Lot 1]

        DEP2 --> IMP2[Test impacts Lot 2] --> DEC2{Impacts ?}
        DEC2 -->|Oui| FIX2[Correction Specifiques] --> REDEP2[Reinstallation] --> OK2
        DEC2 -->|Non| OK2

        DEP3 --> IMP3[Test impacts Lot 3] --> DEC3{Impacts ?}
        DEC3 -->|Oui| FIX3 --> REDEP3 --> OK3
        DEC3 -->|Non| OK3

        DEP4 --> IMP4[Test impacts Lot 4] --> DEC4{Impacts ?}
        DEC4 -->|Oui| FIX4 --> REDEP4 --> OK4
        DEC4 -->|Non| OK4

        DEP5 --> IMP5[Test impacts Lot 5] --> DEC5{Impacts ?}
        DEC5 -->|Oui| FIX5 --> REDEP5 --> OK5
        DEC5 -->|Non| OK5
    end

    OK5 --> KU[🧪 Tests Key Users + Migration]
    KU --> GO(🚀 Mise en Production Janvier 2027)
