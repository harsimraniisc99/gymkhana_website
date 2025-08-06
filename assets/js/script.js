
// Mobile menu toggle
document.addEventListener('DOMContentLoaded', function() {
    const menuToggle = document.querySelector('.menu-toggle');
    const navLinks = document.querySelector('.nav-links');
    const navOverlay = document.querySelector('.nav-overlay');
    
    if (menuToggle && navLinks && navOverlay) {
        function toggleMenu() {
            navLinks.classList.toggle('active');
            menuToggle.classList.toggle('active');
            navOverlay.classList.toggle('active');
            // Prevent body scroll when menu is open
            document.body.style.overflow = navLinks.classList.contains('active') ? 'hidden' : '';
        }
        
        function closeMenu() {
            navLinks.classList.remove('active');
            menuToggle.classList.remove('active');
            navOverlay.classList.remove('active');
            document.body.style.overflow = '';
        }
        
        menuToggle.addEventListener('click', toggleMenu);
        
        // Close menu when clicking on a link
        const navLinkItems = document.querySelectorAll('.nav-links a');
        navLinkItems.forEach(link => {
            link.addEventListener('click', closeMenu);
        });
        
        // Close menu when clicking on overlay
        navOverlay.addEventListener('click', closeMenu);
    }
});

// Hero slideshow
document.addEventListener('DOMContentLoaded', function() {
    const slides = document.querySelectorAll('.hero-slide-bg');
    if (slides.length === 0) return;
    
    let currentSlide = 0;
    
    // Initialize first slide as active
    slides[0].classList.add('active');
    
    function nextSlide() {
        // Remove active class from current slide
        slides[currentSlide].classList.remove('active');
        
        // Move to next slide
        currentSlide = (currentSlide + 1) % slides.length;
        
        // Add active class to new current slide
        slides[currentSlide].classList.add('active');
    }
    
    // Change slide every 5 seconds
    setInterval(nextSlide, 5000);
});

// Placeholder for future interactivity
console.log("Gymkhana website loaded.");
