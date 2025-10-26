# 🇪🇸 Extension Espagne – Guide Développeur

Ce dépôt contient le code source de l’extension locale Espagne, basée sur le **Core Model Groupe**.  
Chaque développeur peut créer une **Scratch Org** pour développer et tester des fonctionnalités spécifiques à l’Espagne, tout en s’assurant qu’elles restent compatibles avec le Core Model.

---

## 📁 Prérequis

Avant de commencer :

- [x] Git + Salesforce CLI (`sfdx`) installés
- [x] VSCode avec Salesforce Extension Pack
- [x] Accès à la Dev Hub Espagne (`DevHub_ES`)
- [x] Le fichier `sfdx-project.json` référence une version promue du Core Model

---

## 🧪 Créer une Scratch Org pour les extensions Espagne

1. Ouvre le projet dans VSCode :
   ```bash
   code es-extension-repo
   ```

2. Ouvre le terminal intégré (`Ctrl + ~`)

3. Exécute la commande :
   ```bash
   sfdx force:org:create \
     --definitionfile config/project-scratch-def.json \
     --setalias es_dev_<prenom> \
     --durationdays 7 \
     --setdefaultusername \
     --targetdevhubusername DevHub_ES
   ```

4. Installe la version promue du **Core Model** :
   ```bash
   sfdx force:package:install --package <ID_VERSION_CORE_MODEL> --wait 10
   ```

5. Déploie ton code local :
   ```bash
   sfdx force:source:push
   ```

6. Lance les tests spécifiques Espagne :
   ```bash
   sfdx force:apex:test:run --classnames "ES_Specific_Tests" --resultformat human --wait 10
   ```

7. Ouvre l’org :
   ```bash
   sfdx force:org:open
   ```

---

## 🗑️ Supprimer ta Scratch Org

```bash
sfdx force:org:delete -u es_dev_<prenom> --noprompt
```

---

## ⚠️ Rappels

- Toutes les extensions **doivent dépendre d’une version promue du Core Model**
- Ne pas modifier directement le Core Model dans ce repo
- Chaque fonctionnalité doit être isolée dans une branche `feature/ES-xxx`
- Une fois stable, créer une version du package, la promouvoir et l’installer dans l’UAT Espagne

---

Bon développement à l’équipe 🇪🇸 !