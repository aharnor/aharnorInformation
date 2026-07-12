#!/usr/bin/env bash
# ==============================================================================
# Next.js Clean Reinstall & Dependency Resolution Script
# ==============================================================================
# This script resolves the ERESOLVE conflict between React 19 and Next.js
# by clearing all caches and forcing installation with legacy peer dependencies.

echo "🧹 Cleaning up existing node_modules, package-lock.json, and Next.js cache..."
rm -rf node_modules
rm -f package-lock.json
rm -rf .next

echo "🧹 Clearing npm cache..."
npm cache clean --force

echo "📦 Reinstalling dependencies with --legacy-peer-deps..."
npm install --legacy-peer-deps

echo "✅ Reinstallation complete! You can now run your development server:"
echo "   PORT=3002 npm run dev"
#########################################
#!/usr/bin/env bash
# ==============================================================================
# Next.js & React Version Alignment Script
# ==============================================================================
# Your package.json is currently pulling in Next.js 9.5.5 (from 2020), which 
# does not support TypeScript configuration files (next.config.ts) or React 19.
#
# This script updates your package.json to use Next.js 15 (which fully supports 
# next.config.ts and React 19), clears the old installation, and reinstalls.

echo "🔄 Updating package.json to modern Next.js 15 and React 19..."

# Use Node to safely update the dependencies in package.json without losing other settings
node -e '
const fs = require("fs");
const pkg = JSON.parse(fs.readFileSync("package.json", "utf8"));

pkg.dependencies = pkg.dependencies || {};
pkg.devDependencies = pkg.devDependencies || {};

// Force modern, compatible versions
pkg.dependencies["next"] = "^15.1.0";
pkg.dependencies["react"] = "^19.0.0";
pkg.dependencies["react-dom"] = "^19.0.0";

// Ensure TypeScript types are updated for React 19
if (pkg.devDependencies["@types/react"]) pkg.devDependencies["@types/react"] = "^19.0.0";
if (pkg.devDependencies["@types/react-dom"]) pkg.devDependencies["@types/react-dom"] = "^19.0.0";

fs.writeFileSync("package.json", JSON.stringify(pkg, null, 2), "utf8");
console.log("✅ package.json updated successfully.");
'

echo "🧹 Clearing old build caches and node_modules..."
rm -rf node_modules
rm -f package-lock.json
rm -rf .next

echo "📦 Installing compatible Next.js 15 + React 19 dependencies..."
npm install --legacy-peer-deps

echo "🚀 Done! You can now start your development server with:"
echo "   PORT=3002 npm run dev"
