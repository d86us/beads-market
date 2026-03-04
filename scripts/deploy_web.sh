#!/bin/bash
set -e

echo "Building Flutter web..."
flutter build web --release --base-href /beads-market/

echo "Deploying to GitHub Pages..."

git branch -D gh-pages-deploy 2>/dev/null || true
git checkout -b gh-pages-deploy --orphan

cp -r build/web/* .

git add index.html main.dart.js flutter.js flutter_bootstrap.js flutter_service_worker.js manifest.json version.json favicon.png
git add assets icons canvaskit

git commit -m "Deploy to GitHub Pages: $(date)" 2>/dev/null || echo "No changes to deploy"
git push origin gh-pages-deploy:gh-pages --force

git checkout master
git branch -D gh-pages-deploy 2>/dev/null || true

echo "Deployed! Visit https://d86us.github.io/beads-market/"
