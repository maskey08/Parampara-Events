<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Event Planning Services</title>
    <style>
      /*CSS */
      * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
        font-family: "Arial", sans-serif;
      }
      /* Add smooth scrolling to the entire page */
      html {
        scroll-behavior: smooth;
      }
      :root {
        --primary-color: #e54e50;
        --secondary-color: #ffffff;
        --accent-color: #c1050b;
        --dark-accent: #a00409;
        --text-color: #333;
        --light-gray: #e0e0e0;
        --medium-gray: #8a8a8a;
        --dark-gray: #555;
        --white: #fff;
        --shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        --bg-color: #f8f8f8;
      }
      body {
        background-color: var(--bg-color);
        color: var(--text-color);
        line-height: 1.6;
      }
      a {
        text-decoration: none;
        color: inherit;
      }
      button {
        cursor: pointer;
        border: none;
        outline: none;
      }
    
      /* ===== HERO BANNER ===== */
 /* ===== HERO BANNER ===== */
 .hero-banner {
        height: 400px;
        background-color: var(--primary-color);
        margin-bottom: 0;
        background-image: linear-gradient(
            rgba(0, 0, 0, 0.3),
            rgba(0, 0, 0, 0.3)
          ),
          url("images/banner.jpg");
        background-size: cover;
        background-position: center;
        display: flex;
        justify-content: center;
        align-items: center;
        text-align: center;
        color: var(--white);
        position: relative;
        z-index: 1;
        cursor: pointer;
      }
      .hero-content {
        max-width: 800px;
        padding: 0 2rem;
      }
      .hero-content h1 {
        font-size: 3rem;
        margin-bottom: 1rem;
        text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5);
      }
      .hero-content p {
        font-size: 1.2rem;
        margin-bottom: 2rem;
        text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.5);
      }
      .hero-btn {
        background-color: var(--accent-color);
        color: var(--white);
        padding: 0.8rem 2rem;
        border-radius: 2rem;
        font-weight: 600;
        transition: all 0.3s;
        border: 2px solid var(--accent-color);
        box-shadow: 0 4px 8px rgba(193, 5, 11, 0.3);
      }
      .hero-btn:hover {
        background-color: transparent;
        transform: translateY(-3px);
        box-shadow: 0 5px 15px rgba(193, 5, 11, 0.3);
        color: var(--white);
      }
      /* ===== TABS SECTION ===== */
      .tabs-section {
        position: relative;
        z-index: 2;
        max-width: 1000px;
        margin: -50px auto 0;
        padding: 0 2rem;
      }
      /* ===== SERVICES SECTION ===== */
      .services-section {
        padding: 2rem 2rem 3rem;
        max-width: 1200px;
        margin: 0 auto;
      }
      .services-tabs {
        background-color: var(--white);
        border-radius: 1rem;
        padding: 1rem;
        margin-bottom: 2rem;
        box-shadow: var(--shadow);
        border: 1px solid var(--light-gray);
      }
      .tab-buttons {
        display: flex;
        border-bottom: 1px solid var(--light-gray);
        padding-bottom: 1rem;
        margin-bottom: 1rem;
      }
      .tab-btn {
        background: none;
        border: none;
        padding: 0.5rem 1rem;
        margin-right: 1rem;
        font-weight: 500;
        color: var(--medium-gray);
        transition: color 0.3s;
      }
      .tab-btn.active {
        color: var(--text-color);
        position: relative;
      }
      .tab-btn.active::after {
        content: "";
        position: absolute;
        bottom: -1rem;
        left: 0;
        width: 100%;
        height: 2px;
        background-color: var(--primary-color);
      }
      .search-filter {
        display: flex;
        justify-content: space-between;
        align-items: center;
      }
      .search-bar {
        display: flex;
        align-items: center;
        border: 1px solid var(--light-gray);
        border-radius: 2rem;
        padding: 0.5rem 1rem;
        width: 200px;
      }
      .search-bar input {
        border: none;
        outline: none;
        width: 100%;
      }
      .search-btn {
        background: none;
        border: none;
        cursor: pointer;
      }
      .price-range {
        display: flex;
        align-items: center;
        width: 50%;
      }
      .price-label {
        font-size: 0.8rem;
        color: var(--medium-gray);
      }
      .slider-container {
        position: relative;
        width: 60%;
        height: 5px;
        margin: 0 1rem;
        background-color: var(--light-gray);
        border-radius: 5px;
      }
      .slider-track {
        position: absolute;
        height: 100%;
        background-color: var(--primary-color);
        border-radius: 5px;
        left: 25%;
        right: 25%;
      }
      .slider {
        position: absolute;
        top: -7px;
        width: 100%;
        height: 20px;
        -webkit-appearance: none;
        background: transparent;
        pointer-events: none;
      }
      .slider::-webkit-slider-thumb {
        -webkit-appearance: none;
        width: 20px;
        height: 20px;
        border-radius: 50%;
        background: var(--accent-color);
        cursor: pointer;
        pointer-events: auto;
        border: 2px solid var(--white);
        box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
      }
      #min-price {
        z-index: 1;
      }
      #max-price {
        z-index: 2;
      }
      .section-title {
        text-align: center;
        color: var(--primary-color);
        margin: 2rem 0 0.5rem;
        font-size: 1.8rem;
        font-weight: 700;
      }
      .section-description {
        text-align: center;
        color: var(--medium-gray);
        margin-bottom: 2rem;
        max-width: 600px;
        margin-left: auto;
        margin-right: auto;
        font-size: 0.9rem;
      }
      /* ===== SERVICE CARDS ===== */
      .service-cards {
        display: grid;
        grid-template-columns: repeat(5, 1fr);
        gap: 1rem;
        margin-bottom: 2rem;
      }
      .service-card {
        background-color: var(--light-gray);
        border-radius: 1rem;
        height: 120px;
        background-image: linear-gradient(
          45deg,
          rgba(255, 255, 255, 0.2),
          rgba(255, 255, 255, 0)
        );
        transition: transform 0.3s, box-shadow 0.3s;
      }
      .service-card:hover,
      .venue-card:hover,
      .decoration-card:hover {
        transform: translateY(-5px);
        box-shadow: 0 10px 20px rgba(229, 78, 80, 0.15);
        cursor: pointer;
      }

      /* ===== CATEGORY ICONS ===== */
      .category-icons {
        display: flex;
        justify-content: space-between;
        flex-wrap: wrap;
        margin-bottom: 2rem;
        padding: 1rem 0;
        border-top: 1px solid var(--light-gray);
        border-bottom: 1px solid var(--light-gray);
      }
      .category {
        display: flex;
        flex-direction: column;
        align-items: center;
        text-align: center;
        width: 12.5%;
        /* 8 items per row */
        margin-bottom: 1rem;
      }
      .icon {
        width: 60px;
        height: 60px;
        background-color: var(--light-gray);
        border-radius: 50%;
        margin-bottom: 0.8rem;
        display: flex;
        justify-content: center;
        align-items: center;
        transition: all 0.3s;
        box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
      }
      .category:hover .icon {
        transform: translateY(-5px);
        box-shadow: 0 5px 15px rgba(229, 78, 80, 0.3);
        background-color: var(--primary-color);
      }
      .category span {
        font-size: 0.8rem;
        color: var(--text-color);
        font-weight: 500;
        transition: color 0.3s;
      }
      .category:hover span {
        color: var(--primary-color);
      }
      /* ===== CTA SECTION ===== */
      .cta-section {
        background-color: var(--white);
        border-radius: 1rem;
        padding: 2rem;
        text-align: center;
        margin-bottom: 2rem;
        box-shadow: var(--shadow);
      }
      .cta-section h3 {
        margin-bottom: 0.5rem;
        font-size: 1.2rem;
      }
      .cta-section p {
        color: var(--medium-gray);
        margin-bottom: 1.5rem;
        font-size: 0.9rem;
      }
      .book-now-btn {
        background-color: var(--accent-color);
        color: var(--white);
        padding: 0.8rem 2rem;
        border-radius: 2rem;
        font-weight: 600;
        transition: all 0.3s;
        position: relative;
        overflow: hidden;
        box-shadow: 0 4px 8px rgba(193, 5, 11, 0.3);
      }
      .book-now-btn:hover {
        background-color: var(--dark-accent);
        transform: translateY(-3px);
        box-shadow: 0 5px 15px rgba(193, 5, 11, 0.4);
      }
      .book-now-btn:active {
        transform: translateY(-1px);
        box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
      }
      .book-now-btn::after {
        content: "";
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background-color: rgba(255, 255, 255, 0.2);
        transform: scaleX(0);
        transform-origin: right;
        transition: transform 0.3s;
        z-index: -1;
      }
      .book-now-btn:hover::after {
        transform: scaleX(1);
        transform-origin: left;
      }
      /* ===== VENUE & DECORATION SECTIONS ===== */
      .venue-section,
      .decoration-section {
        margin-bottom: 3rem;
      }
      .section-header {
        display: flex;
        align-items: center;
        margin-bottom: 1rem;
      }
      .section-header .icon {
        margin-right: 1rem;
        margin-bottom: 0;
      }
      .section-header h3 {
        flex-grow: 1;
      }
      .view-all {
        background-color: var(--primary-color);
        color: var(--white);
        padding: 0.3rem 1rem;
        border-radius: 2rem;
        font-size: 0.8rem;
        transition: all 0.3s;
      }
      .view-all:hover {
        background-color: var(--accent-color);
        transform: translateY(-2px);
        box-shadow: 0 3px 8px rgba(193, 5, 11, 0.3);
      }
      .venue-cards,
      .decoration-cards {
        display: grid;
        grid-template-columns: repeat(5, 1fr);
        gap: 1rem;
      }
      .venue-card,
      .decoration-card {
        overflow: hidden;
        border-radius: 1rem;
      }
      .card-image {
        height: 150px;
        background-color: var(--accent-color);
        border-radius: 1rem 1rem 0 0;
        background-image: linear-gradient(
          45deg,
          rgba(255, 255, 255, 0.2),
          rgba(255, 255, 255, 0)
        );
        background-size: cover;
        background-position: center;
      }
 
      .card-info {
        background-color: var(--white);
        padding: 1rem;
        border-radius: 0 0 1rem 1rem;
        position: relative;
        min-height: 110px;
        padding-top: 1.2rem;
      }
      .card-info h4 {
        margin-bottom: 0.5rem;
        font-size: 1rem;
      }
      .price {
        color: var(--medium-gray);
        font-size: 0.9rem;
        display: block;
        margin-bottom: 0.5rem;
        margin-top: 0.2rem;
      }
      .service-type-label {
        display: inline-block;
        background-color: var(--primary-color);
        color: var(--white);
        padding: 0.2rem 0.5rem;
        border-radius: 0.3rem;
        font-size: 0.7rem;
        font-weight: 600;
        position: absolute;
        left: 1rem;
        top: -0.5rem;
        opacity: 0.9;
        transform: translateY(-50%);
      }
      .select-btn {
        display: inline-block;
        background-color: var(--primary-color);
        color: var(--white);
        padding: 0.3rem 0.8rem;
        border-radius: 0.3rem;
        font-size: 0.8rem;
        font-weight: 600;
        position: absolute;
        right: 1rem;
        bottom: 1rem;
        transition: all 0.3s;
        cursor: pointer;
        border: none;
        box-shadow: 0 2px 4px rgba(193, 5, 11, 0.2);
      }
      .select-btn:hover {
        transform: translateY(-2px);
        box-shadow: 0 3px 8px rgba(193, 5, 11, 0.3);
        background-color: var(--accent-color);
      }

      .social-icon {
        width: 30px;
        height: 30px;
        background-color: var(--light-gray);
        border-radius: 50%;
        display: flex;
        justify-content: center;
        align-items: center;
        margin-right: 0.5rem;
        font-size: 0.8rem;
        transition: background-color 0.3s;
      }
      .social-icon:hover {
        background-color: var(--primary-color);
        color: var(--white);
      }
      .copyright {
        text-align: center;
        color: var(--medium-gray);
        font-size: 0.8rem;
        padding-top: 1rem;
        border-top: 1px solid var(--light-gray);
      }
      /* Custom icon styles */
      .venue-icon {
        background-image: url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="%238a8a8a"><path d="M12 2L2 7v15h20V7L12 2zm0 2.1l6 3.11V9H6V7.21l6-3.11zM6 19v-8h12v8H6z"/></svg>');
        background-size: 50%;
        background-position: center;
        background-repeat: no-repeat;
      }
      .decoration-icon {
        background-image: url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="%238a8a8a"><path d="M12 2C6.48 2 2 6.48 2 12s4.48 10 10 10 10-4.48 10-10S17.52 2 12 2zm0 18c-4.41 0-8-3.59-8-8s3.59-8 8-8 8 3.59 8 8-3.59 8-8 8zm-5-9h10v2H7z"/></svg>');
        background-size: 50%;
        background-position: center;
        background-repeat: no-repeat;
      }
      .photography-icon {
        background-image: url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="%238a8a8a"><path d="M12 15.2c-1.74 0-3.15-1.41-3.15-3.15S10.26 8.9 12 8.9s3.15 1.41 3.15 3.15-1.41 3.15-3.15 3.15zM9 4L7.17 6H4c-1.1 0-2 .9-2 2v12c0 1.1.9 2 2 2h16c1.1 0 2-.9 2-2V8c0-1.1-.9-2-2-2h-3.17L15 4H9zm3 15c-2.76 0-5-2.24-5-5s2.24-5 5-5 5 2.24 5 5-2.24 5-5 5z"/></svg>');
        background-size: 50%;
        background-position: center;
        background-repeat: no-repeat;
      }
      .videography-icon {
        background-image: url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="%238a8a8a"><path d="M17 10.5V7c0-.55-.45-1-1-1H4c-.55 0-1 .45-1 1v10c0 .55.45 1 1 1h12c.55 0 1-.45 1-1v-3.5l4 4v-11l-4 4z"/></svg>');
        background-size: 50%;
        background-position: center;
        background-repeat: no-repeat;
      }
      .gate-icon {
        background-image: url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="%238a8a8a"><path d="M9 4v1.38c-.83-.33-1.72-.5-2.61-.5-1.79 0-3.58.68-4.95 2.05l3.33 3.33h1.11v1.11c.86.86 1.98 1.31 3.11 1.36V15H6v3c0 1.1.9 2 2 2h10c1.66 0 3-1.34 3-3V4H9zm-1.11 6.41V8.26H5.61L4.57 7.22a5.07 5.07 0 0 1 1.82-.34c1.34 0 2.59.52 3.54 1.46l1.41 1.41-.2.2c-.51.51-1.19.8-1.92.8-.47 0-.93-.12-1.33-.34zM19 17c0 .55-.45 1-1 1s-1-.45-1-1v-2h-6v-2.59c.57-.23 1.1-.57 1.56-1.03l.2-.2L15.59 14H17v-1.41l-6-5.97V6h8v11z"/></svg>');
        background-size: 50%;
        background-position: center;
        background-repeat: no-repeat;
      }
      .stage-icon {
        background-image: url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="%238a8a8a"><path d="M4 21h16v-2H4v2zm0-4h16v-2H4v2zm0-12v2h16V5H4zm0 4h16V7H4v2zm0 4h16v-2H4v2z"/></svg>');
        background-size: 50%;
        background-position: center;
        background-repeat: no-repeat;
      }
      .makeup-icon {
        background-image: url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="%238a8a8a"><path d="M12 3c-4.97 0-9 4.03-9 9s4.03 9 9 9 9-4.03 9-9-4.03-9-9-9zm0 16c-3.86 0-7-3.14-7-7s3.14-7 7-7 7 3.14 7 7-3.14 7-7 7z"/></svg>');
        background-size: 50%;
        background-position: center;
        background-repeat: no-repeat;
      }
      .host-icon {
        background-image: url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="%238a8a8a"><path d="M12 12c2.21 0 4-1.79 4-4s-1.79-4-4-4-4 1.79-4 4 1.79 4 4 4zm0 2c-2.67 0-8 1.34-8 4v2h16v-2c0-2.66-5.33-4-8-4z"/></svg>');
        background-size: 50%;
        background-position: center;
        background-repeat: no-repeat;
      }


      /* ===== RESPONSIVE STYLES ===== */

      /* ===== TABLET STYLES (768px - 1023px) ===== */
      @media screen and (max-width: 1023px) {
        /* Hero banner */
        .hero-content h1 {
          font-size: 2.5rem;
        }
        .hero-content p {
          font-size: 1.1rem;
        }
        /* Tabs section */
        .tabs-section {
          margin-top: -40px;
        }
        
        /* Service cards grid */
        .service-cards {
          grid-template-columns: repeat(3, 1fr);
        }
        /* Category icons */
        .category-icons {
          flex-wrap: wrap;
          justify-content: center;
        }
        .category {
          width: 33.33%;
          margin-bottom: 1rem;
        }
        /* Venue and decoration cards */
        .venue-cards,
        .decoration-cards {
          grid-template-columns: repeat(3, 1fr);
        }
       
      }
      /* ===== MOBILE STYLES (up to 767px) ===== */
      @media screen and (max-width: 767px) {
        /* Hero banner */
        .hero-banner {
          height: 350px;
        }
        .hero-content h1 {
          font-size: 2rem;
        }
        .hero-content p {
          font-size: 1rem;
        }
        /* Tabs section */
        .tabs-section {
          margin-top: -30px;
        }
       
        /* Services section */
        .services-section {
          padding: 0 1rem 2rem;
        }
        .search-filter {
          flex-direction: column;
        }
        .search-bar {
          width: 100%;
          margin-bottom: 1rem;
        }
        .price-range {
          width: 100%;
        }
        /* Service cards grid */
        .service-cards {
          grid-template-columns: repeat(2, 1fr);
        }
        /* Category icons */
        .category {
          width: 50%;
        }
        /* Venue and decoration cards */
        .venue-cards,
        .decoration-cards {
          grid-template-columns: repeat(2, 1fr);
        }
        /* CTA section */
        .cta-section {
          padding: 1.5rem 1rem;
        }
        
      }
      /* ===== SMALL MOBILE STYLES (up to 480px) ===== */
      @media screen and (max-width: 480px) {
        /* Hero banner */
        .hero-banner {
          height: 300px;
        }
        .hero-content h1 {
          font-size: 1.5rem;
        }
        .hero-content p {
          font-size: 0.9rem;
          margin-bottom: 1.5rem;
        }
        .hero-btn {
          padding: 0.6rem 1.5rem;
          font-size: 0.9rem;
        }
        /* Tabs section */
        .tabs-section {
          margin-top: -20px;
        }
        
        /* Service cards grid */
        .service-cards {
          grid-template-columns: 1fr;
        }
        /* Category icons */
        .category {
          width: 50%;
        }
        /* Venue and decoration cards */
        .venue-cards,
        .decoration-cards {
          grid-template-columns: 1fr;
        }
        /* Tab buttons */
        .tab-buttons {
          flex-direction: column;
          align-items: center;
        }
        .tab-btn {
          margin: 0.3rem 0;
        }
        .tab-btn.active::after {
          display: none;
        }
        /* Section headers */
        .section-header {
          flex-direction: column;
          text-align: center;
        }
        .section-header .icon {
          margin-right: 0;
          margin-bottom: 0.5rem;
        }
        .section-header h3 {
          margin-bottom: 0.5rem;
        }
        .card-image {
        height: 300px;
        }

        .card-image img {
         width: 100%;
        height: 100%;
        object-fit: cover;
        border-radius: 1rem 1rem 0 0;
        }
 }
</style>
  </head>
  <body>
    <!-- Navigation Bar -->
    	<jsp:include page="header.jsp" />
    
    <!-- Hero Banner -->
    <section class="hero-banner">
      <div class="hero-content">
        <h1>Create Unforgettable Events</h1>
        <p>Your one-stop solution for all event planning needs</p>
        <button class="hero-btn" id="explore-btn">Explore Services</button>
      </div>
    </section>
    <!-- Tabs Section (Overlapping with Hero) -->
    <section class="tabs-section" id="services">
      <div class="services-tabs">
        <div class="tab-buttons">
          <button class="tab-btn active">Venues</button>
          <button class="tab-btn">Decorations</button>
          <button class="tab-btn">Services</button>
        </div>
        <div class="search-filter">
          <div class="search-bar">
            <input type="text" placeholder="Search" />
            <button class="search-btn">🔍</button>
          </div>
      
          <div class="price-range">
            <span class="price-label">NPR 2K</span>
            <div class="slider-container">
              <div class="slider-track"></div>
              <input
                type="range"
                min="0"
                max="100"
                value="25"
                class="slider"
                id="min-price"
              />
              <input
                type="range"
                min="0"
                max="100"
                value="75"
                class="slider"
                id="max-price"
              />
            </div>
            <span class="price-label">NPR 10K+</span>
          </div>
        </div>
      </div>
    </section>
    <!-- Services Section -->
    <section class="services-section" style="padding-bottom: 0px" ;>
      <h2 class="section-title">OUR SERVICES</h2>
      <p class="section-description">
        Slide text for your offer as it is given. What is excellent? What is so
        nice? Why I find what your might be so nice to have here?
      </p>
      <!-- Service Cards Grid -->
      <div class="service-cards">
        <div
          class="service-card"
          style="position: relative; border-radius: 1rem; margin-bottom: 10rem"
        >
          <img
            src="images/weeding.jpg"
            alt="Service 1"
            style="
              width: 100%;
              height: 250px;
              object-fit: cover;
              border-radius: 1rem;
            "
          />
        </div>
        <div
          class="service-card"
          style="position: relative; border-radius: 1rem; margin-bottom: 10rem"
        >
          <img
            src="images/pasni.jpg"
            alt="Service 2"
            style="
              width: 100%;
              height: 250px;
              object-fit: cover;
              border-radius: 1rem;
            "
          />
        </div>
        <div
          class="service-card"
          style="position: relative; border-radius: 1rem; margin-bottom: 10rem"
        >
          <img
            src="images/haldi.jpg"
            alt="Service 3"
            style="
              width: 100%;
              height: 250px;
              object-fit: cover;
              border-radius: 1rem;
            "
          />
        </div>
        <div
          class="service-card"
          style="position: relative; border-radius: 1rem; margin-bottom: 10rem"
        >
          <img
            src="images/Mehendi.jpg"
            alt="Service 4"
            style="
              width: 100%;
              height: 250px;
              object-fit: cover;
              border-radius: 1rem;
            "
          />
        </div>
        <div
          class="service-card"
          style="position: relative; border-radius: 1rem; margin-bottom: 10rem"
        >
          <img
            src="images/gunyocholi.jpg"
            alt="Service 5"
            style="
              width: 100%;
              height: 250px;
              object-fit: cover;
              border-radius: 1rem;
            "
          />
        </div>
        <div
          class="service-card"
          style="position: relative; border-radius: 1rem; margin-bottom: 10rem"
        >
          <img
            src="images/babyshower.jpg"
            alt="Service 1"
            style="
              width: 100%;
              height: 250px;
              object-fit: cover;
              border-radius: 1rem;
            "
          />
        </div>
        <div
          class="service-card"
          style="position: relative; border-radius: 1rem; margin-bottom: 10rem"
        >
          <img
            src="images/belbiwaha1.jpg"
            alt="Service 2"
            style="
              width: 100%;
              height: 250px;
              object-fit: cover;
              border-radius: 1rem;
            "
          />
        </div>
        <div
          class="service-card"
          style="position: relative; border-radius: 1rem; margin-bottom: 10rem"
        >
          <img
            src="images/weedingproposal.jpg"
            alt="Service 3"
            style="
              width: 100%;
              height: 250px;
              object-fit: cover;
              border-radius: 1rem;
            "
          />
        </div>
        <div
          class="service-card"
          style="position: relative; border-radius: 1rem; margin-bottom: 10rem"
        >
          <img
            src="images/bartamandha.webp"
            alt="Service 4"
            style="
              width: 100%;
              height: 250px;
              object-fit: cover;
              border-radius: 1rem;
            "
          />
        </div>
        <div
          class="service-card"
          style="position: relative; border-radius: 1rem; margin-bottom: 10rem"
        >
          <img
            src="images/bachelorpart.jpg"
            alt="Service 5"
            style="
              width: 100%;
              height: 250px;
              object-fit: cover;
              border-radius: 1rem;
            "
          />
        </div>
      </div>

      <!-- Category Icons -->
      <div class="category-icons">
        <div class="category">
          <div class="icon venue-icon"></div>
          <span>Venues</span>
        </div>
        <div class="category">
          <div class="icon decoration-icon"></div>
          <span>Decorations</span>
        </div>
        <div class="category">
          <div class="icon photography-icon"></div>
          <span>Photographers</span>
        </div>
        <div class="category">
          <div class="icon videography-icon"></div>
          <span>Videographers</span>
        </div>
        <div class="category">
          <div class="icon gate-icon"></div>
          <span>Entrance Gates</span>
        </div>
        <div class="category">
          <div class="icon stage-icon"></div>
          <span>Stages</span>
        </div>
        <div class="category">
          <div class="icon makeup-icon"></div>
          <span>Makeup Artists</span>
        </div>
        <div class="category">
          <div class="icon host-icon"></div>
          <span>Event Hosts</span>
        </div>
      </div>
      <!-- Call to Action -->
      <div class="cta-section">
        <h3>Didn't find what you're looking for?</h3>
        <p>Connect with our experts and design your perfect custom event</p>
        <button class="book-now-btn">BOOK US NOW ↗</button>
      </div>
<!-- Venue Section -->
<div class="venue-section">
<div class="venue-header" style="display: flex; align-items: center; justify-content: space-between;">
  <!-- Left side: icon + title -->
  <div style="display: flex; align-items: center; gap: 10px;">
    <div class="icon venue-icon"></div>
    <h3 style="margin: 0;">Venue</h3>
  </div>

  <!-- Right side: button -->
  <button class="view-all">View All</button>
</div>

  
<div class="venue-cards" style="display: flex; justify-content: space-between; flex-wrap: nowrap; overflow-x: hidden; padding: 1rem;">
  
  <div class="venue-card" style="width: 250px; margin-right: 1rem; flex-shrink: 0;">
    <div class="card-image" style="height: 200px; width: 100%;">
      <img
        src="images/venue5.jpg"
        alt="Hotel"
        style="width: 100%; height: 100%; object-fit: cover; border-radius: 1rem 1rem 0 0;"
      />
    </div>
    <div class="card-info" style="padding: 0.5rem;">
      <h4 style="margin: 0;">Beach Venue</h4>
      <span class="price">NPR 1,80,000</span><br>
      <button class="select-btn" style="margin-top: 0.5rem;">Select</button>
    </div>
  </div>

  <div class="venue-card" style="width: 250px; margin-right: 1rem; flex-shrink: 0;">
    <div class="card-image" style="height: 200px; width: 100%;">
      <img
        src="images/venue2.jpg"
        alt="Party Hall"
        style="width: 100%; height: 100%; object-fit: cover; border-radius: 1rem 1rem 0 0;"
      />
    </div>
    <div class="card-info" style="padding: 0.5rem;">
      <h4 style="margin: 0;">Party Hall</h4>
      <span class="price">NPR 1,67,000</span><br>
      <button class="select-btn" style="margin-top: 0.5rem;">Select</button>
    </div>
  </div>

  <div class="venue-card" style="width: 250px; margin-right: 1rem; flex-shrink: 0;">
    <div class="card-image" style="height: 200px; width: 100%;">
      <img
        src="images/venue3.jpg"
        alt="Garden Venue"
        style="width: 100%; height: 100%; object-fit: cover; border-radius: 1rem 1rem 0 0;"
      />
    </div>
    <div class="card-info" style="padding: 0.5rem;">
      <h4 style="margin: 0;">Hotel Venue</h4>
      <span class="price">NPR 1,56,000</span><br>
      <button class="select-btn" style="margin-top: 0.5rem;">Select</button>
    </div>
  </div>

  <div class="venue-card" style="width: 250px; margin-right: 1rem; flex-shrink: 0;">
    <div class="card-image" style="height: 200px; width: 100%;">
      <img
        src="images/venue4.jpg"
        alt="Beach Venue"
        style="width: 100%; height: 100%; object-fit: cover; border-radius: 1rem 1rem 0 0;"
      />
    </div>
    <div class="card-info" style="padding: 0.5rem;">
      <h4 style="margin: 0;">Temple Venue</h4>
      <span class="price">NPR 70,000</span><br>
      <button class="select-btn" style="margin-top: 0.5rem;">Select</button>
    </div>
  </div>
</div>
</div>
<!-- decoration Section -->
<div class="venue-section">
  <div class="venue-header" style="display: flex; align-items: center; justify-content: space-between;">
    <!-- Left side: icon + title -->
    <div style="display: flex; align-items: center; gap: 10px;">
      <div class="icon decoration-icon"></div>
      <h3 style="margin: 0;">Decorations</h3>
    </div>
  
    <!-- Right side: button -->
    <button class="view-all">View All</button>
  </div>
  
    
  <div class="venue-cards" style="display: flex; justify-content: space-between; flex-wrap: nowrap; overflow-x: hidden; padding: 1rem;">
    
    <div class="venue-card" style="width: 250px; margin-right: 1rem; flex-shrink: 0;">
      <div class="card-image" style="height: 200px; width: 100%;">
        <img
          src="images/weedingdecoration.jpg"
          alt="Hotel"
          style="width: 100%; height: 100%; object-fit: cover; border-radius: 1rem 1rem 0 0;"
        />
      </div>
      <div class="card-info" style="padding: 0.5rem;">
        <h4 style="margin: 0;">White Theme Floral Wedding Decorations</h4>
        <span class="price">NPR 60,000</span><br>
        <button class="select-btn" style="margin-top: 0.5rem;">Select</button>
      </div>
    </div>
  
    <div class="venue-card" style="width: 250px; margin-right: 1rem; flex-shrink: 0;">
      <div class="card-image" style="height: 200px; width: 100%;">
        <img
          src="images/haldidecoration.jpg"
          alt="Party Hall"
          style="width: 100%; height: 100%; object-fit: cover; border-radius: 1rem 1rem 0 0;"
        />
      </div>
      <div class="card-info" style="padding: 0.5rem;">
        <h4 style="margin: 0;">Haldi Decorations</h4>
        <span class="price">NPR 40,000</span><br>
        <button class="select-btn" style="margin-top: 0.5rem;">Select</button>
      </div>
    </div>
  
    <div class="venue-card" style="width: 250px; margin-right: 1rem; flex-shrink: 0;">
      <div class="card-image" style="height: 200px; width: 100%;">
        <img
          src="images/sangeetdecoration.jpg"
          alt="Garden Venue"
          style="width: 100%; height: 100%; object-fit: cover; border-radius: 1rem 1rem 0 0;"
        />
      </div>
      <div class="card-info" style="padding: 0.5rem;">
        <h4 style="margin: 0;">Sangeet Decorations</h4>
        <span class="price">NPR 50,000</span><br>
        <button class="select-btn" style="margin-top: 0.5rem;">Select</button>
      </div>
    </div>
  
    <div class="venue-card" style="width: 250px; margin-right: 1rem; flex-shrink: 0;">
      <div class="card-image" style="height: 200px; width: 100%;">
        <img
          src="images/weedingDecoration1.jpg"
          alt="Beach Venue"
          style="width: 100%; height: 100%; object-fit: cover; border-radius: 1rem 1rem 0 0;"
        />
      </div>
      <div class="card-info" style="padding: 0.5rem;">
        <h4 style="margin: 0;">Red Theme Wedding Decorations</h4>
        <span class="price">60,000</span><br>
        <button class="select-btn" style="margin-top: 0.5rem;">Select</button>
      </div>
    </div> 
  </div>  
  </div>
  <!-- Photography Section -->
<div class="venue-section">
  <div class="venue-header" style="display: flex; align-items: center; justify-content: space-between;">
    <!-- Left side: icon + title -->
    <div style="display: flex; align-items: center; gap: 10px;">
      <div class="icon photography-icon"></div>
      <h3 style="margin: 0;">Photography</h3>
    </div>
  
    <!-- Right side: button -->
    <button class="view-all">View All</button>
  </div>
  
    
  <div class="venue-cards" style="display: flex; justify-content: space-between; flex-wrap: nowrap; overflow-x: hidden; padding: 1rem;">
    
    <div class="venue-card" style="width: 250px; margin-right: 1rem; flex-shrink: 0;">
      <div class="card-image" style="height: 200px; width: 100%;">
        <img
          src="images/nepaliweedingphotography.jpg"
          alt="Hotel"
          style="width: 100%; height: 100%; object-fit: cover; border-radius: 1rem 1rem 0 0;"
        />
      </div>
      <div class="card-info" style="padding: 0.5rem;">
        <h4 style="margin: 0;"> Santosh Snaps</h4>
        <span class="price">NPR 1,50,000</span><br>
        <button class="select-btn" style="margin-top: 0.5rem;">Select</button>
      </div>
    </div>
  
    <div class="venue-card" style="width: 250px; margin-right: 1rem; flex-shrink: 0;">
      <div class="card-image" style="height: 200px; width: 100%;">
        <img
          src="images/mehendiphotography.jpg"
          alt="Party Hall"
          style="width: 100%; height: 100%; object-fit: cover; border-radius: 1rem 1rem 0 0;"
        />
      </div>
      <div class="card-info" style="padding: 0.5rem;">
        <h4 style="margin: 0;">Pratiush Lens</h4>
        <span class="price">NPR 1,78,000</span><br>
        <button class="select-btn" style="margin-top: 0.5rem;">Select</button>
      </div>
    </div>
  
    <div class="venue-card" style="width: 250px; margin-right: 1rem; flex-shrink: 0;">
      <div class="card-image" style="height: 200px; width: 100%;">
        <img
          src="images/weedingphotography.jpg"
          alt="Garden Venue"
          style="width: 100%; height: 100%; object-fit: cover; border-radius: 1rem 1rem 0 0;"
        />
      </div>
      <div class="card-info" style="padding: 0.5rem;">
        <h4 style="margin: 0;">Manjil Moments</h4>
        <span class="price">NPR 1,60,000</span><br>
        <button class="select-btn" style="margin-top: 0.5rem;">Select</button>
      </div>
    </div>
  
    <div class="venue-card" style="width: 250px; margin-right: 1rem; flex-shrink: 0;">
      <div class="card-image" style="height: 200px; width: 100%;">
        <img
          src="images/haldiphotography.jpg"
          alt="Beach Venue"
          style="width: 100%; height: 100%; object-fit: cover; border-radius: 1rem 1rem 0 0;"
        />
      </div>
      <div class="card-info" style="padding: 0.5rem;">
        <h4 style="margin: 0;">Krijal Clicks</h4>
        <span class="price">NPR 1,45,000</span><br>
        <button class="select-btn" style="margin-top: 0.5rem;">Select</button>
      </div>
    </div>
  
  </div>
  
  
  </div>
         <!-- entrancegate Section -->
<div class="venue-section">
  <div class="venue-header" style="display: flex; align-items: center; justify-content: space-between;">
    <!-- Left side: icon + title -->
    <div style="display: flex; align-items: center; gap: 10px;">
      <div class="icon gate-icon"></div>
      <h3 style="margin: 0;">Entrance Gate</h3>
    </div>
  
    <!-- Right side: button -->
    <button class="view-all">View All</button>
  </div>
  
    
  <div class="venue-cards" style="display: flex; justify-content: space-between; flex-wrap: nowrap; overflow-x: hidden; padding: 1rem;">
    
    <div class="venue-card" style="width: 250px; margin-right: 1rem; flex-shrink: 0;">
      <div class="card-image" style="height: 200px; width: 100%;">
        <img
          src="images/weedingentrance.jpg"
          alt="Hotel"
          style="width: 100%; height: 100%; object-fit: cover; border-radius: 1rem 1rem 0 0;"
        />
      </div>
      <div class="card-info" style="padding: 0.5rem;">
        <h4 style="margin: 0;">Wedding Entrance</h4>
        <span class="price">NPR 40,000</span><br>
        <button class="select-btn" style="margin-top: 0.5rem;">Select</button>
      </div>
    </div>
  
    <div class="venue-card" style="width: 250px; margin-right: 1rem; flex-shrink: 0;">
      <div class="card-image" style="height: 200px; width: 100%;">
        <img
          src="images/mehendientrance.jpg"
          alt="Party Hall"
          style="width: 100%; height: 100%; object-fit: cover; border-radius: 1rem 1rem 0 0;"
        />
      </div>
      <div class="card-info" style="padding: 0.5rem;">
        <h4 style="margin: 0;">Floral Mehendi Entrance</h4>
        <span class="price">NPR 30,000</span><br>
        <button class="select-btn" style="margin-top: 0.5rem;">Select</button>
      </div>
    </div>
  
    <div class="venue-card" style="width: 250px; margin-right: 1rem; flex-shrink: 0;">
      <div class="card-image" style="height: 200px; width: 100%;">
        <img
          src="images/haldientrance.jpg"
          alt="Garden Venue"
          style="width: 100%; height: 100%; object-fit: cover; border-radius: 1rem 1rem 0 0;"
        />
      </div>
      <div class="card-info" style="padding: 0.5rem;">
        <h4 style="margin: 0;">Asthetic Haldi Entrance</h4>
        <span class="price">NPR 30,000</span><br>
        <button class="select-btn" style="margin-top: 0.5rem;">Select</button>
      </div>
    </div>
  
    <div class="venue-card" style="width: 250px; margin-right: 1rem; flex-shrink: 0;">
      <div class="card-image" style="height: 200px; width: 100%;">
        <img
          src="images/receptionentracne.jpg"
          alt="Beach Venue"
          style="width: 100%; height: 100%; object-fit: cover; border-radius: 1rem 1rem 0 0;"
        />
      </div>
      <div class="card-info" style="padding: 0.5rem;">
        <h4 style="margin: 0;">Reception Entrance</h4>
        <span class="price">NPR 40,000</span><br>
        <button class="select-btn" style="margin-top: 0.5rem;">Select</button>
      </div>
    </div>
  
  </div>
  
  
  </div>
         <!-- Stage Section -->
<div class="venue-section">
  <div class="venue-header" style="display: flex; align-items: center; justify-content: space-between;">
    <!-- Left side: icon + title -->
    <div style="display: flex; align-items: center; gap: 10px;">
      <div class="icon stage-icon"></div>
      <h3 style="margin: 0;">Stages</h3>
    </div>
  
    <!-- Right side: button -->
    <button class="view-all">View All</button>
  </div>
  
    
  <div class="venue-cards" style="display: flex; justify-content: space-between; flex-wrap: nowrap; overflow-x: hidden; padding: 1rem;">
    
    <div class="venue-card" style="width: 250px; margin-right: 1rem; flex-shrink: 0;">
      <div class="card-image" style="height: 200px; width: 100%;">
        <img
          src="images/vintageweedingstage.jpg"
          alt="Hotel"
          style="width: 100%; height: 100%; object-fit: cover; border-radius: 1rem 1rem 0 0;"
        />
      </div>
      <div class="card-info" style="padding: 0.5rem;">
        <h4 style="margin: 0;">Vintage Weeding Stage </h4>
        <span class="price">NPR 2,30,000</span><br>
        <button class="select-btn" style="margin-top: 0.5rem;">Select</button>
      </div>
    </div>
  
    <div class="venue-card" style="width: 250px; margin-right: 1rem; flex-shrink: 0;">
      <div class="card-image" style="height: 200px; width: 100%;">
        <img
          src="images/turkishstyplestage.jpg"
          alt="Party Hall"
          style="width: 100%; height: 100%; object-fit: cover; border-radius: 1rem 1rem 0 0;"
        />
      </div>
      <div class="card-info" style="padding: 0.5rem;">
        <h4 style="margin: 0;">Turkish Style Stage </h4>
        <span class="price">NPR 2,70,000</span><br>
        <button class="select-btn" style="margin-top: 0.5rem;">Select</button>
      </div>
    </div>
  
    <div class="venue-card" style="width: 250px; margin-right: 1rem; flex-shrink: 0;">
      <div class="card-image" style="height: 200px; width: 100%;">
        <img
          src="images/haldistage.jpg"
          alt="Garden Venue"
          style="width: 100%; height: 100%; object-fit: cover; border-radius: 1rem 1rem 0 0;"
        />
      </div>
      <div class="card-info" style="padding: 0.5rem;">
        <h4 style="margin: 0;">Haldi Stage</h4>
        <span class="price">NPR 40,000</span><br>
        <button class="select-btn" style="margin-top: 0.5rem;">Select</button>
      </div>
    </div>
  
    <div class="venue-card" style="width: 250px; margin-right: 1rem; flex-shrink: 0;">
      <div class="card-image" style="height: 200px; width: 100%;">
        <img
          src="images/floralweeding stage.jpg"
          alt="Beach Venue"
          style="width: 100%; height: 100%; object-fit: cover; border-radius: 1rem 1rem 0 0;"
        />
      </div>
      <div class="card-info" style="padding: 0.5rem;">
        <h4 style="margin: 0;">Asthetic Floral Stage</h4>
        <span class="price">NPR 2,30,000</span><br>
        <button class="select-btn" style="margin-top: 0.5rem;">Select</button>
      </div>
    </div>
  
  </div>  
  </div>
          <!-- makeup Section -->
<div class="venue-section">
  <div class="venue-header" style="display: flex; align-items: center; justify-content: space-between;">
    <!-- Left side: icon + title -->
    <div style="display: flex; align-items: center; gap: 10px;">
      <div class="icon makeup-icon"></div>
      <h3 style="margin: 0;">Makeup Artist</h3>
    </div>
  
    <!-- Right side: button -->
    <button class="view-all">View All</button>
  </div>
  
    
  <div class="venue-cards" style="display: flex; justify-content: space-between; flex-wrap: nowrap; overflow-x: hidden; padding: 1rem;">
    
    <div class="venue-card" style="width: 250px; margin-right: 1rem; flex-shrink: 0;">
      <div class="card-image" style="height: 200px; width: 100%;">
        <img
          src="images/touchbypri.jpg"
          alt="Hotel"
          style="width: 100%; height: 100%; object-fit: cover; border-radius: 1rem 1rem 0 0;"
        />
      </div>
      <div class="card-info" style="padding: 0.5rem;">
        <h4 style="margin: 0;">Touch By Pri</h4>
        <span class="price">Start From NPR 9,000</span><br>
        <button class="select-btn" style="margin-top: 0.5rem;">Select</button>
      </div>
    </div>
  
    <div class="venue-card" style="width: 250px; margin-right: 1rem; flex-shrink: 0;">
      <div class="card-image" style="height: 200px; width: 100%;">
        <img
          src="images/glambyperrie.jpg"
          alt="Party Hall"
          style="width: 100%; height: 100%; object-fit: cover; border-radius: 1rem 1rem 0 0;"
        />
      </div>
      <div class="card-info" style="padding: 0.5rem;">
        <h4 style="margin: 0;">Glam By Perrie </h4>
        <span class="price">Start From NPR 7,500</span><br>
        <button class="select-btn" style="margin-top: 0.5rem;">Select</button>
      </div>
    </div>
  
    <div class="venue-card" style="width: 250px; margin-right: 1rem; flex-shrink: 0;">
      <div class="card-image" style="height: 200px; width: 100%;">
        <img
          src="images/makeupbysneha.jpg"
          alt="Garden Venue"
          style="width: 100%; height: 100%; object-fit: cover; border-radius: 1rem 1rem 0 0;"
        />
      </div>
      <div class="card-info" style="padding: 0.5rem;">
        <h4 style="margin: 0;">Makeup By Sneha</h4>
        <span class="price">Start From NPR 6,000</span><br>
        <button class="select-btn" style="margin-top: 0.5rem;">Select</button>
      </div>
    </div>
  
    <div class="venue-card" style="width: 250px; margin-right: 1rem; flex-shrink: 0;">
      <div class="card-image" style="height: 200px; width: 100%;">
        <img
          src="images/touchbyprii.jpg"
          alt="Beach Venue"
          style="width: 100%; height: 100%; object-fit: cover; border-radius: 1rem 1rem 0 0;"
        />
      </div>
      <div class="card-info" style="padding: 0.5rem;">
        <h4 style="margin: 0;">Makeup By Prihihi</h4>
        <span class="price">Start From NPR 7,000</span><br>
        <button class="select-btn" style="margin-top: 0.5rem;">Select</button>
      </div>
    </div>
  
  </div>  
  </div>
  <!-- evevnthost Section -->
<div class="venue-section">
  <div class="venue-header" style="display: flex; align-items: center; justify-content: space-between;">
    <!-- Left side: icon + title -->
    <div style="display: flex; align-items: center; gap: 10px;">
      <div class="icon host-icon"></div>
      <h3 style="margin: 0;">Event Host</h3>
    </div>
    <!-- Right side: button -->
    <button class="view-all">View All</button>
  </div>   
  <div class="venue-cards" style="display: flex; justify-content: space-between; flex-wrap: nowrap; overflow-x: hidden; padding: 1rem;">  
    <div class="venue-card" style="width: 250px; margin-right: 1rem; flex-shrink: 0;">
      <div class="card-image" style="height: 200px; width: 100%;">
        <img
          src="images/paurakh.jpg"
          alt="Hotel"
          style="width: 100%; height: 100%; object-fit: cover; border-radius: 1rem 1rem 0 0;"
        />
      </div>
      <div class="card-info" style="padding: 0.5rem;">
        <h4 style="margin: 0;">Paurakh's Parties</h4>
        <span class="price">NPR 70,000</span><br>
        <button class="select-btn" style="margin-top: 0.5rem;">Select</button>
      </div>
    </div>
  
    <div class="venue-card" style="width: 250px; margin-right: 1rem; flex-shrink: 0;">
      <div class="card-image" style="height: 200px; width: 100%;">
        <img
          src="images/sneha.jpg"
          alt="Party Hall"
          style="width: 100%; height: 100%; object-fit: cover; border-radius: 1rem 1rem 0 0;"
        />
      </div>
      <div class="card-info" style="padding: 0.5rem;">
        <h4 style="margin: 0;">Sneha's Gatherings</h4>
        <span class="price">NPR 65,000</span><br>
        <button class="select-btn" style="margin-top: 0.5rem;">Select</button>
      </div>
    </div>
  
    <div class="venue-card" style="width: 250px; margin-right: 1rem; flex-shrink: 0;">
      <div class="card-image" style="height: 200px; width: 100%;">
        <img
          src="images/manish.jpg"
          alt="Garden Venue"
          style="width: 100%; height: 100%; object-fit: cover; border-radius: 1rem 1rem 0 0;"
        />
      </div>
      <div class="card-info" style="padding: 0.5rem;">
        <h4 style="margin: 0;">Manish Moments</h4>
        <span class="price">NPR 50,000</span><br>
        <button class="select-btn" style="margin-top: 0.5rem;">Select</button>
      </div>
    </div>
  
    <div class="venue-card" style="width: 250px; margin-right: 1rem; flex-shrink: 0;">
      <div class="card-image" style="height: 200px; width: 100%;">
        <img
          src="images/aviyan.jpg"s
          alt="Beach Venue"
          style="width: 100%; height: 100%; object-fit: cover; border-radius: 1rem 1rem 0 0;"
        />
      </div>
      <div class="card-info" style="padding: 0.5rem;">
        <h4 style="margin: 0;">Aviyan & Co. </h4>
        <span class="price">NPR 60,000</span><br>
        <button class="select-btn" style="margin-top: 0.5rem;">Select</button>
      </div>
    </div>  
  </div>  
<!-- Footer -->
	<jsp:include page="footer.jsp" />


</body>
</html>
