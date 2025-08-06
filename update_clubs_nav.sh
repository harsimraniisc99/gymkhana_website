#!/bin/bash

# Update navigation for all club files in the clubs/ directory

cd "/home/harry/Downloads/website/gymkhana_website_modern (1)/clubs"

# Pattern to find and replace old nav structure with new one
OLD_NAV='<nav>
    <a href="../index.html">Home</a>
    <a href="../about.html">About</a>
    <a href="../facilities.html">Facilities</a>
    <a href="../events.html">Events</a>
    <a href="../clubs.html">Clubs</a>
    <a href="../committee.html">Committee</a>
    <a href="../admin.html">Admin</a>
    <a href="../contact.html">Contact</a>
</nav>'

NEW_NAV='<nav class="main-nav">
    <div class="nav-overlay"></div>
    <div class="nav-container">
        <button class="menu-toggle" aria-label="Toggle menu">
            <span class="hamburger-line"></span>
            <span class="hamburger-line"></span>
            <span class="hamburger-line"></span>
        </button>
        <div class="nav-links">
            <a href="../index.html">Home</a>
            <a href="../about.html">About</a>
            <a href="../facilities.html">Facilities</a>
            <a href="../events.html">Events</a>
            <a href="../clubs.html">Clubs</a>
            <a href="../committee.html">Committee</a>
            <a href="../admin.html">Admin</a>
            <a href="../contact.html">Contact</a>
        </div>
    </div>
</nav>'

echo "Updating navigation for all club pages..."

for file in *.html; do
    if [ -f "$file" ]; then
        echo "Updating $file..."
        
        # Use sed to replace the old nav with new nav
        sed -i 's|<nav>|<nav class="main-nav">\n    <div class="nav-overlay"></div>\n    <div class="nav-container">\n        <button class="menu-toggle" aria-label="Toggle menu">\n            <span class="hamburger-line"></span>\n            <span class="hamburger-line"></span>\n            <span class="hamburger-line"></span>\n        </button>\n        <div class="nav-links">|g' "$file"
        
        sed -i 's|</nav>|        </div>\n    </div>\n</nav>|g' "$file"
        
        echo "Updated $file"
    fi
done

echo "All club pages updated successfully!"
