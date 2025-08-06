#!/bin/bash

# Script to update all club pages with image layout

cd "/home/harry/Downloads/website/gymkhana_website_modern (1)/clubs"

# Define club names and corresponding images
declare -A club_images
club_images["aerobics"]="Aerobics_room.jpeg"
club_images["archery"]="image_1_1.jpeg"
club_images["arts"]="cultural_1.jpeg"
club_images["athletics"]="Track.jpeg"
club_images["badminton"]="badminton_court.jpeg"
club_images["basketball"]="basketball.jpeg"
club_images["billiards"]="snooker_table.jpeg"
club_images["carrom"]="Carrom_room.jpeg"
club_images["chess"]="image_2_1.png"
club_images["cricket"]="Cricket_ground.jpeg"
club_images["cycling"]="image_3_1.png"
club_images["dance"]="Dance_room.jpeg"
club_images["dodgeball"]="image_4_1.png"
club_images["drama"]="cultural_2.jpeg"
club_images["fashion_show"]="cultural_3.jpeg"
club_images["film"]="image_5_1.png"
club_images["football"]="football.jpeg"
club_images["frisbee"]="KV_ground.jpeg"
club_images["gym"]="gym1.jpeg"
club_images["handball"]="image_6_1.png"
club_images["hockey"]="Hockey.jpeg"
club_images["kabaddi"]="image_7_1.png"
club_images["kalarippayattu"]="kungfu.jpeg"
club_images["kho-kho"]="image_8_1.png"
club_images["kung-fu"]="kungfu.jpeg"
club_images["lawn_tennis"]="Tennis_ground.jpeg"
club_images["literature"]="image_9_1.png"
club_images["music"]="image_10_1.png"
club_images["nature"]="image_11_1.png"
club_images["photography"]="image_12_1.png"
club_images["swimming"]="Swimmimg_pool.jpeg"
club_images["table_tennis"]="table_tennis.jpeg"
club_images["volleyball"]="Volleybal_ground.jpeg"
club_images["yoga"]="yoga_room.jpeg"

for file in *.html; do
    if [[ -f "$file" ]]; then
        # Get the base name without extension
        basename=$(basename "$file" .html)
        image_name=${club_images[$basename]}
        
        # Skip dance.html as it's already updated
        if [[ "$basename" == "dance" ]]; then
            echo "Skipping $file (already updated)"
            continue
        fi
        
        if [[ -n "$image_name" ]]; then
            echo "Updating $file with image: $image_name"
            
            # Create temporary file with new content
            temp_file=$(mktemp)
            
            # Read the file and replace the main content section
            awk -v image="$image_name" '
            BEGIN { in_main = 0; main_replaced = 0 }
            /<main class="container">/ { 
                in_main = 1
                print $0
                print "        <section class=\"club-details\">"
                print "            <div class=\"club-content-with-image\">"
                print "                <div class=\"club-text\">"
                next
            }
            /<\/main>/ { 
                if (in_main && !main_replaced) {
                    print "                </div>"
                    print "                <div class=\"club-image\">"
                    print "                    <img src=\"../assets/images/" image "\" alt=\"Club Activities\" class=\"club-feature-image\">"
                    print "                </div>"
                    print "            </div>"
                    print "        </section>"
                    main_replaced = 1
                }
                in_main = 0
                print $0
                next
            }
            in_main && /<section class="club-details">/ { next }
            in_main && /<\/section>/ { next }
            { print $0 }
            ' "$file" > "$temp_file"
            
            # Replace the original file
            mv "$temp_file" "$file"
        fi
    fi
done

echo "All club pages updated with image layout!"
