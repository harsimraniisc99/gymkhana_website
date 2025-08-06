#!/bin/bash

# Update navigation for all HTML files (except index.html, about.html, clubs.html, facilities.html which are already done)

# Define the old navigation pattern
OLD_NAV='<nav>
    <a href="index.html">Home</a>
    <a href="about.html">About</a>
    <a href="facilities.html">Facilities</a>
    <a href="events.html">Events</a>
    <a href="clubs.html">Clubs</a>
    <a href="committee.html">Committee</a>
    <a href="admin.html">Admin</a>
    <a href="contact.html">Contact</a>
</nav>'

# Define the new navigation pattern
NEW_NAV='<nav class="main-nav">
    <div class="nav-container">
        <button class="menu-toggle" aria-label="Toggle menu">
            <span class="hamburger-line"></span>
            <span class="hamburger-line"></span>
            <span class="hamburger-line"></span>
        </button>
        <div class="nav-links">
            <a href="index.html">Home</a>
            <a href="about.html">About</a>
            <a href="facilities.html">Facilities</a>
            <a href="events.html">Events</a>
            <a href="clubs.html">Clubs</a>
            <a href="committee.html">Committee</a>
            <a href="admin.html">Admin</a>
            <a href="contact.html">Contact</a>
        </div>
    </div>
</nav>'

# List of files to update (excluding already updated ones)
FILES="admin.html committee.html contact.html events.html"

for file in $FILES; do
    if [ -f "$file" ]; then
        echo "Updating $file..."
        # Use sed to replace the navigation
        sed -i "s|<nav>|<nav class=\"main-nav\">|g" "$file"
        sed -i '/<nav class="main-nav">/a\    <div class="nav-container">\n        <button class="menu-toggle" aria-label="Toggle menu">\n            <span class="hamburger-line"></span>\n            <span class="hamburger-line"></span>\n            <span class="hamburger-line"></span>\n        </button>\n        <div class="nav-links">' "$file"
        sed -i 's|</nav>|        </div>\n    </div>\n</nav>|g' "$file"
        echo "Updated $file"
    else
        echo "File $file not found"
    fi
done

echo "Navigation update complete!"
