#!/bin/bash

# Script to update all club pages with correct styling and navigation

cd "/home/harry/Downloads/website/gymkhana_website_modern (1)/clubs"

for file in *.html; do
    echo "Updating $file..."
    
    # Fix CSS link
    sed -i 's|href="assets/css/style.css"|href="../assets/css/style.css"|g' "$file"
    
    # Fix JS link
    sed -i 's|src="assets/js/script.js"|src="../assets/js/script.js"|g' "$file"
    
    # Fix navigation links
    sed -i 's|href="index.html"|href="../index.html"|g' "$file"
    sed -i 's|href="about.html"|href="../about.html"|g' "$file"
    sed -i 's|href="facilities.html"|href="../facilities.html"|g' "$file"
    sed -i 's|href="events.html"|href="../events.html"|g' "$file"
    sed -i 's|href="committee.html"|href="../committee.html"|g' "$file"
    sed -i 's|href="contact.html"|href="../contact.html"|g' "$file"
    
    # Add Clubs link if missing
    if ! grep -q 'href="../clubs.html"' "$file"; then
        sed -i 's|<a href="../events.html">Events</a>|<a href="../events.html">Events</a>\n    <a href="../clubs.html">Clubs</a>|g' "$file"
    fi
    
    # Fix footer structure
    sed -i 's|<footer>&copy; 2025 Gymkhana IISc</footer>|<footer>\n        <p>&copy; 2024 Gymkhana. All rights reserved.</p>\n    </footer>|g' "$file"
    
done

echo "All club pages updated!"
