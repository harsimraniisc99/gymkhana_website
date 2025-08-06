#!/bin/bash

# Script to update all club pages with image layout using dummy names

cd "/home/harry/Downloads/website/gymkhana_website_modern (1)/clubs"

# Define club names and their corresponding dummy image names
declare -A club_images
club_images["aerobics"]="aerobics_club.jpg"
club_images["archery"]="archery_club.jpg"
club_images["arts"]="arts_club.jpg"
club_images["athletics"]="athletics_club.jpg"
club_images["badminton"]="badminton_club.jpg"
club_images["basketball"]="basketball_club.jpg"
club_images["billiards"]="billiards_club.jpg"
club_images["carrom"]="carrom_club.jpg"
club_images["chess"]="chess_club.jpg"
club_images["cricket"]="cricket_club.jpg"
club_images["cycling"]="cycling_club.jpg"
club_images["dance"]="Sunny.png"
club_images["dodgeball"]="dodgeball_club.jpg"
club_images["drama"]="drama_club.jpg"
club_images["fashion_show"]="fashion_show_club.jpg"
club_images["film"]="film_club.jpg"
club_images["football"]="football_club.jpg"
club_images["frisbee"]="frisbee_club.jpg"
club_images["gym"]="gym_club.jpg"
club_images["handball"]="handball_club.jpg"
club_images["hockey"]="hockey_club.jpg"
club_images["kabaddi"]="kabaddi_club.jpg"
club_images["kalarippayattu"]="kalarippayattu_club.jpg"
club_images["kho-kho"]="kho_kho_club.jpg"
club_images["kung-fu"]="kung_fu_club.jpg"
club_images["lawn_tennis"]="lawn_tennis_club.jpg"
club_images["literature"]="literature_club.jpg"
club_images["music"]="music_club.jpg"
club_images["nature"]="nature_club.jpg"
club_images["photography"]="photography_club.jpg"
club_images["swimming"]="swimming_club.jpg"
club_images["table_tennis"]="table_tennis_club.jpg"
club_images["volleyball"]="volleyball_club.jpg"
club_images["yoga"]="yoga_club.jpg"

declare -A club_titles
club_titles["aerobics"]="Aerobics Club"
club_titles["archery"]="Archery Club"
club_titles["arts"]="Arts Club"
club_titles["athletics"]="Athletics Club"
club_titles["badminton"]="Badminton Club"
club_titles["basketball"]="Basketball Club"
club_titles["billiards"]="Billiards Club"
club_titles["carrom"]="Carrom Club"
club_titles["chess"]="Chess Club"
club_titles["cricket"]="Cricket Club"
club_titles["cycling"]="Cycling Club"
club_titles["dance"]="Dance Club"
club_titles["dodgeball"]="Dodgeball Club"
club_titles["drama"]="Drama Club"
club_titles["fashion_show"]="Fashion Show Club"
club_titles["film"]="Film Club"
club_titles["football"]="Football Club"
club_titles["frisbee"]="Frisbee Club"
club_titles["gym"]="Gym Club"
club_titles["handball"]="Handball Club"
club_titles["hockey"]="Hockey Club"
club_titles["kabaddi"]="Kabaddi Club"
club_titles["kalarippayattu"]="Kalarippayattu Club"
club_titles["kho-kho"]="Kho-Kho Club"
club_titles["kung-fu"]="Kung Fu Club"
club_titles["lawn_tennis"]="Lawn Tennis Club"
club_titles["literature"]="Literature Club"
club_titles["music"]="Music Club"
club_titles["nature"]="Nature Club"
club_titles["photography"]="Photography Club"
club_titles["swimming"]="Swimming Club"
club_titles["table_tennis"]="Table Tennis Club"
club_titles["volleyball"]="Volleyball Club"
club_titles["yoga"]="Yoga Club"

for file in *.html; do
    if [[ -f "$file" ]]; then
        # Get the base name without extension
        basename=$(basename "$file" .html)
        club_title=${club_titles[$basename]}
        club_image=${club_images[$basename]}
        
        if [[ -n "$club_title" && -n "$club_image" ]]; then
            echo "Updating $file with image layout..."
            
            # Skip dance.html as it's already updated
            if [[ "$file" == "dance.html" ]]; then
                echo "Skipping dance.html - already updated"
                continue
            fi
            
            # Create the new content with image layout
            cat > "$file" << EOF
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
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
    <a href="../admin.html">Admin</a>
    <a href="../contact.html">Contact</a>
</nav>

    <main class="container">
        <section class="club-details">
            <div class="club-content-with-image">
                <div class="club-text">
                    <div class="card">
                        <h2>Welcome to the $club_title</h2>
                        <p>Join us at the $club_title at Gymkhana IISc for exciting activities and opportunities to grow your skills!</p>
                        <p>Stay tuned for updates, events, and activities!</p>
                    </div>
                </div>
                <div class="club-image">
                    <img src="../assets/images/$club_image" alt="$club_title Activities" class="club-feature-image">
                </div>
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

echo "All club pages updated with image layout!"
