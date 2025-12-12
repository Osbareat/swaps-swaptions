#!/bin/bash
# Setup script to connect this repository to GitHub

echo "🔧 Setting up GitHub connection for Swaps-Swaptions repository"
echo ""

# Get GitHub username
read -p "Enter your GitHub username: " GITHUB_USER

# Set repository name
REPO_NAME="swaps-swaptions"

echo ""
echo "📝 Next steps:"
echo "1. Go to https://github.com/new"
echo "2. Repository name: $REPO_NAME"
echo "3. Description: Interest rate swaps and swaptions analysis with pricing models and risk metrics"
echo "4. Choose Public or Private"
echo "5. DO NOT initialize with README, .gitignore, or license (we already have them)"
echo "6. Click 'Create repository'"
echo ""
read -p "Press Enter after you've created the repository on GitHub..."

echo ""
echo "🔗 Connecting to GitHub..."

# Add remote
git remote add origin "https://github.com/$GITHUB_USER/$REPO_NAME.git"

echo "✅ Remote added!"
echo ""
echo "📤 Pushing to GitHub..."

# Push to GitHub
git branch -M main
git push -u origin main

echo ""
echo "✨ Done! Your repository is now on GitHub!"
echo "📍 View it at: https://github.com/$GITHUB_USER/$REPO_NAME"
