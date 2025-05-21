<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Wedding Photography Gallery</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        /* Base styles */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Georgia', serif;
        }
        
        body {
            background-color: #1a1a1a;
            color: #333;
        }
        
        .container {
            max-width: 1200px;
            margin: 0 auto;
            background-color: #ffffff; /* Secondary color */
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.3);
        }
        
        /* Hero section */
        .hero {
            position: relative;
            width: 100%;
            height: 500px;
            overflow: hidden;
        }
        
        .hero-image {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }
        
        .category-title {
            position: absolute;
            top: 50px;
            left: 50px;
            font-size: 42px;
            color: #ffffff; /* Secondary color */
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5);
        }
        
        /* Category section */
        .categories {
            display: flex;
            justify-content: space-around;
            padding: 20px 40px;
            background-color: rgba(255, 255, 255, 0.8); /* Semi-transparent Secondary color */
            position: absolute;
            bottom: 0;
            left: 0;
            right: 0;
        }
        
        .category-item {
            display: flex;
            flex-direction: column;
            align-items: center;
            text-align: center;
            cursor: pointer;
            transition: transform 0.3s;
        }
        
        .category-item:hover {
            transform: translateY(-5px);
        }
        
        .category-box {
            width: 120px;
            height: 120px;
            background-color: #ffffff; /* Primary color */
            border-radius: 10px;
            margin-bottom: 10px;
            transition: all 0.3s;
            overflow: hidden;
            position: relative;
        }
        
        .category-box:hover {
            box-shadow: 0 5px 15px rgba(193, 5, 11, 0.3);
            transform: scale(1.05);
        }
        
        .category-box::after {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background-color: rgba(229, 78, 80, 0.4); /* Semi-transparent Primary color */
            transition: background-color 0.3s;
        }
        
        .category-box:hover::after {
            background-color: rgba(193, 5, 11, 0.2); /* Semi-transparent Accent color */
        }
        
        .category-image {
            width: 100%;
            height: 100%;
            object-fit: cover;
            transition: transform 0.5s;
        }
        
        .category-box:hover .category-image {
            transform: scale(1.1);
        }
        
        .category-name {
            font-size: 18px;
            color: #333;
            font-weight: bold;
            transition: color 0.3s;
        }
        
        .category-item:hover .category-name {
            color:#E54E50; /* Primary color */
        }
        
        /* Gallery section */
        .gallery-section {
            background-color:#E54E50;
            padding: 30px 40px;
            position: relative;
        }
        
        .gallery-section::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            height: 3px;
            background-color: #C1050B; /* Accent color */
        }
        
        .gallery-title {
            font-size: 48px;
            margin-bottom: 10px;
            color: #ffffff; /* Secondary color */
        }
        
        .gallery-subtitle {
            font-size: 18px;
            color: #e0e0e0;
            margin-bottom: 30px;
        }
        
        .gallery-grid {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            grid-auto-rows: 200px;
            gap: 15px;
            margin-top: 30px;
        }
        
        .gallery-item {
            overflow: hidden;
            position: relative;
            cursor: pointer;
            border: 3px solid transparent;
            transition: border-color 0.3s;
        }
        
        .gallery-item:hover {
            border-color: #E54E50; /* Primary color */
        }
        
        .gallery-item:nth-child(1) {
            grid-column: span 1;
            grid-row: span 1;
        }
        
        .gallery-item:nth-child(2) {
            grid-column: span 2;
            grid-row: span 2;
        }
        
        .gallery-item:nth-child(3) {
            grid-column: span 1;
            grid-row: span 1;
        }
        
        .gallery-item:nth-child(4) {
            grid-column: span 1;
            grid-row: span 1;
        }
        
        .gallery-item:nth-child(5) {
            grid-column: span 1;
            grid-row: span 1;
        }
        
        .gallery-item:nth-child(6) {
            grid-column: span 1;
            grid-row: span 1;
        }
        
        .gallery-item:nth-child(7) {
            grid-column: span 2;
            grid-row: span 2;
        }
        
        .gallery-item:nth-child(8) {
            grid-column: span 1;
            grid-row: span 1;
        }
        
        .gallery-item:nth-child(9) {
            grid-column: span 1;
            grid-row: span 1;
        }
        
        .gallery-item:nth-child(10) {
            grid-column: span 1;
            grid-row: span 1;
        }
        
        .gallery-item:nth-child(11) {
            grid-column: span 1;
            grid-row: span 1;
        }
        
        .gallery-item:nth-child(12) {
            grid-column: span 1;
            grid-row: span 1;
        }
        
        .gallery-image {
            width: 100%;
            height: 100%;
            object-fit: cover;
            transition: transform 0.5s;
        }
        
        .gallery-item:hover .gallery-image {
            transform: scale(1.1);
        }
        
        /* Navigation */
        .gallery-nav {
            display: flex;
            justify-content: space-between;
            padding: 20px 40px;
            background-color: #ffffff; /* Secondary color */
            color: #333;
        }
        
        .nav-button {
            padding: 10px 15px;
            background: none;
            border: 2px solid #E54E50; /* Primary color */
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            color: #E54E50; /* Primary color */
            transition: all 0.3s;
            font-weight: bold;
        }
        
        .nav-button:hover {
            background-color: #E54E50; /* Primary color */
            color: #ffffff; /* Secondary color */
        }
        
        /* Category indicator dots */
        .category-indicator {
            display: flex;
            justify-content: center;
            gap: 10px;
            margin-top: 20px;
        }
        
        .indicator-dot {
            width: 10px;
            height: 10px;
            border-radius: 50%;
            background-color: #E54E50; /* Primary color */
        }
        
        .indicator-dot.active {
            background-color: #C1050B; /* Accent color */
            transform: scale(1.2);
        }
        
        /* Responsive styles */
        @media (max-width: 992px) {
            .gallery-grid {
                grid-template-columns: repeat(3, 1fr);
            }
            
            .category-box {
                width: 100px;
                height: 100px;
            }
        }
        
        @media (max-width: 768px) {
            .gallery-grid {
                grid-template-columns: repeat(2, 1fr);
            }
            
            .hero {
                height: 400px;
            }
            
            .category-title {
                font-size: 36px;
                top: 30px;
                left: 30px;
            }
            
            .categories {
                flex-wrap: wrap;
                gap: 20px;
            }
            
            .category-box {
                width: 80px;
                height: 80px;
            }
            
            .category-name {
                font-size: 14px;
            }
        }
        
        @media (max-width: 576px) {
            .gallery-grid {
                grid-template-columns: 1fr;
                grid-auto-rows: 250px;
            }
            
            .gallery-item {
                grid-column: span 1 !important;
                grid-row: span 1 !important;
            }
            
            .hero {
                height: 300px;
            }
            
            .category-title {
                font-size: 28px;
                top: 20px;
                left: 20px;
            }
        }
        
        /* Additional styling with the color palette */
        .gallery-title::after {
            content: '';
            display: block;
            width: 80px;
            height: 3px;
            background-color: #E54E50; /* Primary color */
            margin-top: 10px;
        }
    </style>
</head>
<body>
<jsp:include page="header.jsp" />

    <div class="container">
        <!-- Hero Section with Categories -->
        <div class="hero">
            <img src="./Images/01.jpg" alt="Wedding Ceremony" class="hero-image">
            <h1 class="category-title">Category</h1>
            
            <div class="categories">
                <div class="category-item">
                    <div class="category-box">
                        <img src="./Images/Nepali culture_ Coming of age (Bratabandha)_.jpeg" alt="Bratabandha Ceremony" class="category-image">
                    </div>
                    <span class="category-name">Bratabandha</span>
                </div>
                <div class="category-item">
                    <div class="category-box">
                        <img src="./Images/Nepali wedding (1).jpeg" alt="Wedding Ceremony" class="category-image">
                    </div>
                    <span class="category-name">Wedding</span>
                </div>
                <div class="category-item">
                    <div class="category-box">
                        <img src="./Images/Rice Feeding Ceremony in Nepal (Pasni) - Weaning Ceremony.jpeg" alt="Pasni Ceremony" class="category-image">
                    </div>
                    <span class="category-name">Pasni</span>
                </div>
                <div class="category-item">
                    <div class="category-box">
                        <img src="./Images/Bel Bibaha.jpeg" alt="Bel Bibaha Ceremony" class="category-image">
                    </div>
                    <span class="category-name">Bel Bibaha</span>
                </div>
                <div class="category-item">
                    <div class="category-box">
                        <img src="./Images/babyshower.jpeg" alt="Baby Shower" class="category-image">
                    </div>
                    <span class="category-name">Baby Shower</span>
                </div>
            </div>
        </div>
        
        <!-- Gallery Section -->
        <div class="gallery-section">
            <h2 class="gallery-title">Gallery</h2>
            <p class="gallery-subtitle">Every photo is a chapter in your love story—let's make it unforgettable.</p>
            
            <div class="gallery-grid">
                <!-- Gallery Images -->
                <div class="gallery-item">
                    <img src="./Images/weddingphoto.jpeg" alt="Wedding Ceremony" class="gallery-image">
                </div>
                <div class="gallery-item">
                    <img src="./Images/couple set.jpeg" alt="Couple Portrait" class="gallery-image">
                </div>
                <div class="gallery-item">
                    <img src="./Images/Rice Feeding Ceremony in Nepal (Pasni) - Weaning Ceremony.jpeg" alt="Bride Preparation" class="gallery-image">
                </div>
                <div class="gallery-item">
                    <img src="./Images/Weddinghands.jpeg" alt="Wedding Rituals" class="gallery-image">
                </div>
                <div class="gallery-item">
                    <img src="./Images/Nepali culture_ Coming of age (Bratabandha)_.jpeg" alt="Traditional Ceremony" class="gallery-image">
                </div>
                <div class="gallery-item">
                    <img src="./Images/Limbu _ yakthung couple 💐.jpeg" class="gallery-image">
                </div>
                <div class="gallery-item">
                    <img src="./Images/outdoorwedding.jpeg" alt="Outdoor Ceremony" class="gallery-image">
                </div>
                <div class="gallery-item">
                    <img src="./Images/Maternity Photographer _ Sutro Baths, San Francisco.jpeg" alt="Baby Shower" class="gallery-image">
                </div>
                <div class="gallery-item">
                    <img src="./Images/02.jpeg" alt="Traditional Attire" class="gallery-image">
                </div>
                <div class="gallery-item">
                    <img src="./Images/_ (1).jpeg" alt="Wedding Jewelry" class="gallery-image">
                </div>
                <div class="gallery-item">
                    <img src="./Images/Bel Bibaha.jpeg" alt="Bride Portrait" class="gallery-image">
                </div>
                <div class="gallery-item">
                    <img src="./Images/Photography By Gagan.jpeg " alt="Wedding Decorations" class="gallery-image">
                </div>
            </div>
            
            <div class="category-indicator">
                <span class="indicator-dot"></span>
                <span class="indicator-dot active"></span>
                <span class="indicator-dot"></span>
                <span class="indicator-dot"></span>
                <span class="indicator-dot"></span>
            </div>
        </div>
        
        <!-- Navigation -->
        <div class="gallery-nav">
            <button class="nav-button">&lt;Previous Gallery</button>
            <button class="nav-button">Next Gallery&gt;</button>
        </div>
    </div>
    <!-- Footer -->
	<jsp:include page="footer.jsp" />
    
</body>
</html>