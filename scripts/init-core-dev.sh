#!/bin/bash

DEV_ALIAS="core_dev_$(whoami)"

echo "🔧 Création de la Scratch Org : $DEV_ALIAS"

sfdx force:org:create \
  --definitionfile config/project-scratch-def.json \
  --setalias $DEV_ALIAS \
  --setdefaultusername \
  --durationdays 30 \
  --targetdevhubusername DevHub_Core

echo "📤 Déploiement du code Core Model"
sfdx force:source:push

echo "🧪 Lancement des tests"
sfdx force:apex:test:run --resultformat human --wait 10

echo "✅ Scratch Org $DEV_ALIAS prête à l’usage"
