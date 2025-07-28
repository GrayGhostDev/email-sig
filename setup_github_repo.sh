#!/bin/bash

# Gray Ghost Data Consultants - GitHub Repository Setup Script
# This script helps set up the email_signature repository on GitHub

echo "🚀 Setting up GitHub repository for Gray Ghost Data Consultants email signature..."

# Check if we're in the right directory
if [ ! -f "logo.png" ]; then
    echo "❌ Error: logo.png not found. Please run this script from the Email_Signature directory."
    exit 1
fi

# Check if git is initialized
if [ ! -d ".git" ]; then
    echo "❌ Error: Git repository not initialized. Please run 'git init' first."
    exit 1
fi

# Check if GitHub CLI is authenticated
if ! gh auth status &> /dev/null; then
    echo "❌ Error: GitHub CLI not authenticated. Please run 'gh auth login' first."
    echo "   Then run this script again."
    exit 1
fi

echo "✅ GitHub CLI is authenticated"

# Create the repository on GitHub
echo "📦 Creating repository: grayghostdev/email_signature"
gh repo create grayghostdev/email_signature --public --description "Gray Ghost Data Consultants email signature assets" --source=. --remote=origin --push

if [ $? -eq 0 ]; then
    echo "✅ Repository created successfully!"
    echo ""
    echo "🎉 Your logo is now hosted at:"
    echo "   https://raw.githubusercontent.com/grayghostdev/email_signature/main/logo.png"
    echo ""
    echo "📧 You can now use any of these email signature files:"
    echo "   - email_signature.html (main version)"
    echo "   - email_signature_github_hosted.html (GitHub optimized)"
    echo "   - email_signature_spark_optimized.html (Spark optimized)"
    echo ""
    echo "🔗 Repository URL: https://github.com/grayghostdev/email_signature"
else
    echo "❌ Failed to create repository. Please check your GitHub permissions."
    exit 1
fi 