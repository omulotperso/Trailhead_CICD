#!/bin/bash

DEV_ALIAS="core_dev_$(whoami)"
DEV_HUB_ALIAS="DevHub_Core"

echo "🔧 Création de la Scratch Org avec CLI sf : $DEV_ALIAS"

sf org create scratch \
  --definition-file config/project-scratch-def.json \
  --alias $DEV_ALIAS \
  --duration-days 30 \
  --target-dev-hub $DEV_HUB_ALIAS \
  --set-default

echo "📤 Déploiement du code Core Model"
sf project deploy start

echo "🧪 Lancement des tests Apex"
sf apex run test --wait 10

echo "✅ Scratch Org $DEV_ALIAS prête à l’usage"
