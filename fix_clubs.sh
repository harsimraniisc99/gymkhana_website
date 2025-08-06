#!/bin/bash

# Script to properly update all club pages with correct structure

cd "/home/harry/Downloads/website/gymkhana_website_modern (1)/clubs"

# Define club names mapping
declare -A club_names
club_names["aerobics"]="Aerobics Club"
club_names["archery"]="Archery Club"
club_names["arts"]="Arts Club"
club_names["athletics"]="Athletics Club"
club_names["badminton"]="Badminton Club"
club_names["basketball"]="Basketball Club"
club_names["billiards"]="Billiards Club"
club_names["carrom"]="Carrom Club"
club_names["chess"]="Chess Club"
club_names["cricket"]="Cricket Club"
club_names["cycling"]="Cycling Club"
club_names["dance"]="Dance Club"
club_names["dodgeball"]="Dodgeball Club"
club_names["drama"]="Drama Club"
club_names["fashion_show"]="Fashion Show Club"
club_names["film"]="Film Club"
club_names["football"]="Football Club"
club_names["frisbee"]="Frisbee Club"
club_names["gym"]="Gym Club"
club_names["handball"]="Handball Club"
club_names["hockey"]="Hockey Club"
club_names["kabaddi"]="Kabaddi Club"
club_names["kalarippayattu"]="Kalarippayattu Club"
club_names["kho-kho"]="Kho-Kho Club"
club_names["kung-fu"]="Kung Fu Club"
club_names["lawn_tennis"]="Lawn Tennis Club"
club_names["literature"]="Literature Club"
club_names["music"]="Music Club"
club_names["nature"]="Nature Club"
club_names["photography"]="Photography Club"
club_names["swimming"]="Swimming Club"
club_names["table_tennis"]="Table Tennis Club"
club_names["volleyball"]="Volleyball Club"
club_names["yoga"]="Yoga Club"

for file in *.html; do
    if [[ -f "$file" ]]; then
        # Get the base name without extension
        basename=$(basename "$file" .html)
        club_title=${club_names[$basename]}
        
        if [[ -n "$club_title" ]]; then
            echo "Updating $file with title: $club_title"
            
            # Create the new content
            cat > "$file" << EOF
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>$club_title</title>
    <link rel="stylesheet" href="../assets/css/style.css">
    <script src="../assets/js/script.js" defer></script>
</head>
<body>
    <header><h1>$club_title</h1></header>
    
<nav>
    <a href="../index.html">Home</a>
    <a href="../about.html">About</a>
    <a href="../facilities.html">Facilities</a>
    <a href="../events.html">Events</a>
    <a href="../clubs.html">Clubs</a>
    <a href="../committee.html">Committee</a>
    <a href="../contact.html">Contact</a>
</nav>

    <main class="container">
        <section class="club-details">
            <div class="card">
                <h2>Welcome to the $club_title</h2>
                <p>Join us at the $club_title at Gymkhana IISc for exciting activities and opportunities to grow your skills!</p>
                <p>Stay tuned for updates, events, and activities!</p>
            </div>
        </section>
    </main>
    
    <footer>
        <p>&copy; 2024 Gymkhana. All rights reserved.</p>
    </footer>
</body>
</html>
EOF
        fi
    fi
done

echo "All club pages have been updated with proper structure!"
