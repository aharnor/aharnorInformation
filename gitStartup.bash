# Initialize a fresh local Git repository
git init

# Stage all files (this respects your .gitignore)
git add .

# Commit the files locally
git commit -m "Initial 'aharnorInformation' ::commit for migration"

# Rename the default branch to main
git branch -M main

# Link your local repository to your GitHub repository
git remote add origin https://github.com/aharnor/aharnorInformation.git

# Push the code to GitHub
git push -u origin main
