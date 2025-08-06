#!/bin/bash

# Script to add Admin link to all club pages

cd "/home/harry/Downloads/website/gymkhana_website_modern (1)/clubs"

for file in *.html; do
    echo "Adding Admin link to $file..."
    
    # Add Admin link after Committee and before Contact
    sed -i 's|<a href="../committee.html">Committee</a>|<a href="../committee.html">Committee</a>\n    <a href="../admin.html">Admin</a>|g' "$file"
    
done

echo "All club pages updated with Admin link!"
