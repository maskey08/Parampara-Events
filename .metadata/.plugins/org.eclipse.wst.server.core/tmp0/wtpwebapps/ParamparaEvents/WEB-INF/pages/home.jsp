<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>PARAMPARA EVENTS</title>
	<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/header.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/home.css" />
    <link
      href="https://fonts.googleapis.com/css?family=Hanken Grotesk"
      rel="stylesheet"
    />
    

  
  </head>
  <body>
	<jsp:include page="header.jsp" />
    <div class="hero">
      <img class="bgimg" src="${pageContext.request.contextPath}/resources/images/system/bgimg.jpg" alt="hero image" />
    </div>

    <div class="hero-blend">
      <div class="wrapper">
        <div class="lid one"></div>
        <div class="lid two"></div>
        <div class="envelope"></div>
        <div class="letter">
          <p>Get 20% off on your first booking.</p>
        </div>
        <button class="book-now-btn">Book Now</button>
      </div>
    </div>
<!-- containers start here -->
    <style>
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
    </style>
    <div class="container1">
      <div class="venue-section">
        <div
          class="venue-header"
          style="
            display: flex;
            align-items: center;
            justify-content: space-between;
          "
        >
          <!-- Left side: icon + title -->
          <div style="display: flex; align-items: center; gap: 10px">
            <div class="icon venue-icon"></div>
            <h3 style="margin: 0">Venue</h3>
          </div>

          <!-- Right side: button -->
          <button class="view-all">View All</button>
        </div>

        <div
          class="venue-cards"
          style="
            display: flex;
            justify-content: space-between;
            flex-wrap: nowrap;
            overflow-x: hidden;
            padding: 1rem;
          "
        >
          <div
            class="venue-card"
            style="width: 250px; margin-right: 1rem; flex-shrink: 0"
          >
            <div class="card-image" style="height: 200px; width: 100%">
              <img
                src="images/venue5.jpg"
                alt="Hotel"
                style="
                  width: 100%;
                  height: 100%;
                  object-fit: cover;
                  border-radius: 1rem 1rem 0 0;
                "
              />
            </div>
            <div class="card-info" style="padding: 0.5rem">
              <h4 style="margin: 0">Beach Venue</h4>
              <span class="price">NPR 1,80,000</span><br />
              <button class="select-btn" style="margin-top: 0.5rem">
                Select
              </button>
            </div>
          </div>

          <div
            class="venue-card"
            style="width: 250px; margin-right: 1rem; flex-shrink: 0"
          >
            <div class="card-image" style="height: 200px; width: 100%">
              <img
                src="images/venue2.jpg"
                alt="Party Hall"
                style="
                  width: 100%;
                  height: 100%;
                  object-fit: cover;
                  border-radius: 1rem 1rem 0 0;
                "
              />
            </div>
            <div class="card-info" style="padding: 0.5rem">
              <h4 style="margin: 0">Party Hall</h4>
              <span class="price">NPR 1,67,000</span><br />
              <button class="select-btn" style="margin-top: 0.5rem">
                Select
              </button>
            </div>
          </div>

          <div
            class="venue-card"
            style="width: 250px; margin-right: 1rem; flex-shrink: 0"
          >
            <div class="card-image" style="height: 200px; width: 100%">
              <img
                src="images/venue3.jpg"
                alt="Garden Venue"
                style="
                  width: 100%;
                  height: 100%;
                  object-fit: cover;
                  border-radius: 1rem 1rem 0 0;
                "
              />
            </div>
            <div class="card-info" style="padding: 0.5rem">
              <h4 style="margin: 0">Hotel Venue</h4>
              <span class="price">NPR 1,56,000</span><br />
              <button class="select-btn" style="margin-top: 0.5rem">
                Select
              </button>
            </div>
          </div>

          <div
            class="venue-card"
            style="width: 250px; margin-right: 1rem; flex-shrink: 0"
          >
            <div class="card-image" style="height: 200px; width: 100%">
              <img
                src="images/venue4.jpg"
                alt="Beach Venue"
                style="
                  width: 100%;
                  height: 100%;
                  object-fit: cover;
                  border-radius: 1rem 1rem 0 0;
                "
              />
            </div>
            <div class="card-info" style="padding: 0.5rem">
              <h4 style="margin: 0">Temple Venue</h4>
              <span class="price">NPR 70,000</span><br />
              <button class="select-btn" style="margin-top: 0.5rem">
                Select
              </button>
            </div>
          </div>
        </div>
      </div>
    </div>
    <style>
      .container2 {
        text-align: center;
        padding: 40px 0px;
        background-color: #f9f9f9;
      }

      .container2 h1 {
        font-size: 2.5rem;
        margin-bottom: 10px;
      }

      .container2 h3 {
        font-weight: normal;
        color: #777;
        margin-bottom: 40px;
      }

      .frame-container {
        display: flex;
        flex-wrap: nowrap; /* Keep in a single horizontal row */
        overflow-x: auto; /* Enable horizontal scroll */
        overflow-y: hidden;
        gap: 0;
        padding: 0;
        margin: 0;
      }

      .frame {
        flex: 0 0 auto; /* Prevent shrinking and allow natural width */
        position: relative;
        overflow: hidden;
        width: 275px; /* Match partitionpillar.png width */
        height: 400px; /* Match partitionpillar.png height */
        margin: 0;
      }

      .frame-photo {
        width: 100%;
        height: 100%;
        object-fit: cover;
        display: block;
      }

      .frame-border {
        position: absolute;
        top: 0;
        left: 0;
        height: 100%;
        width: 100%;
        z-index: 2;
        pointer-events: none;
      }

      .frame-frame {
        height: 100%;
        width: 100%;
        object-fit: cover;
        display: block;
      }
    </style>
    <div class="container2">
      <h1>Memories</h1>
      <h3>If only you could relive again...</h3>
      <div class="frame-container">
        <div class="frame">
          <img src="dhaka.png" class="frame-photo" alt="gallery-photo" />
          <div class="frame-border">
            <img src="partitionpillar.png" class="frame-frame" />
          </div>
        </div>
        <div class="frame">
          <img src="dhaka.png" class="frame-photo" alt="gallery-photo" />
          <div class="frame-border">
            <img src="partitionpillar.png" class="frame-frame" />
          </div>
        </div>
        <div class="frame">
          <img src="dhaka.png" class="frame-photo" alt="gallery-photo" />
          <div class="frame-border">
            <img src="partitionpillar.png" class="frame-frame" />
          </div>
        </div>
        <div class="frame">
          <img src="dhaka.png" class="frame-photo" alt="gallery-photo" />
          <div class="frame-border">
            <img src="partitionpillar.png" class="frame-frame" />
          </div>
        </div>
        <div class="frame">
          <img src="dhaka.png" class="frame-photo" alt="gallery-photo" />
          <div class="frame-border">
            <img src="partitionpillar.png" class="frame-frame" />
          </div>
        </div>
        <div class="frame">
          <img src="dhaka.png" class="frame-photo" alt="gallery-photo" />
          <div class="frame-border">
            <img src="partitionpillar.png" class="frame-frame" />
          </div>
        </div>
        <div class="frame">
          <img src="dhaka.png" class="frame-photo" alt="gallery-photo" />
          <div class="frame-border">
            <img src="partitionpillar.png" class="frame-frame" />
          </div>
        </div>
        <div class="frame">
          <img src="dhaka.png" class="frame-photo" alt="gallery-photo" />
          <div class="frame-border">
            <img src="partitionpillar.png" class="frame-frame" />
          </div>
        </div>
      </div>
    </div>

    <style>
      /* .container3 {
        position: relative;
        height: 100vh;
        padding: 40px 80px;
      }

      .container3:before {
        content: " ";
        display: block;
        position: absolute;
        left: 0;
        top: 0;
        width: 100%;
        height: 100%;
        background-image: url("pattern.png");
        background-repeat: repeat;
        background-position: 50% 0;
      }

      .grid-container {
        position: relative;
        display: grid;
        grid-template-columns: auto auto auto auto;
        gap: 10px;
        padding: 10px;
      }

      .grid-container > div {
        background-color: #f1f1f1;
        color: #000;
        padding: 10px;
        width: 100%;
        height: 100%;
        object-fit: cover;
        display: block;
      }

      /* Specific grid item placements */
      .item1 {
        grid-column: 1 / 4;
        grid-row: 1 /2;
      }

      .item2 {
        grid-column: 3 / 4;
        grid-row: 1 / 6;
      }

      .item3 {
        grid-column: 3 / 4;
        grid-row: 1 / 2;
      }

      .item4 {
        grid-column: 1 / 2;
        grid-row: 2 / 3;
      }

      .item5 {
        grid-column: 2 / 3;
        grid-row: 2 / 3;
      }

      .item6 {
        grid-column: 3 / 4;
        grid-row: 2 / 3;
      }

      .item7 {
        grid-column: 1 / 2;
        grid-row: 3 / 4;
      }

      .item8 {
        grid-column: 2 / 3;
        grid-row: 3 / 4;
      } */
    </style>
    <div class="container3">
      <div class="grid-container">
        <div class="item1">
          <h1>
            <span style="color: red; font-style: italic">Decoration</span>
          </h1>
          <h3>When Day & Aesthetic Blends</h3>
        </div>
        <div class="item2">
          <img
            src="decore3.png"
            alt="decore-img"
            style="width: 100%; height: 100%; object-fit: cover"
          />
        </div>
        <div class="item3">
          <img
            src="decore7.png"
            alt="decore-img"
            style="width: 100%; height: 100%; object-fit: cover"
          />
        </div>
        <div class="item4">
          <img
            src="decore2.png"
            alt="decore-img"
            style="width: 100%; height: 100%; object-fit: cover"
          />
        </div>
        <div class="item5">
          <img
            src="decore1.png"
            alt="decore-img"
            style="width: 100%; height: 100%; object-fit: cover"
          />
        </div>
        <div class="item6">
          <img
            src="decore6.png"
            alt="decore-img"
            style="width: 100%; height: 100%; object-fit: cover"
          />
        </div>
        <div class="item7">
          <img
            src="decore4.png"
            alt="decore-img"
            style="width: 100%; height: 100%; object-fit: cover"
          />
        </div>
        <div class="item8">
          <img
            src="decore5.png"
            alt="decore-img"
            style="width: 100%; height: 100%; object-fit: cover"
          />
        </div>
      </div>
    </div>
    <style></style>
    <div class="container4">
      <div id="container4" class="services-container">
        <h2 class="services-subtitle">Our Services</h2>
        <h1 class="services-title">Choose. Book. Experience.</h1>

        <div class="services-grid">
          <!-- Row 1 -->
          <div class="service-card">
            <div class="service-image-container">
              <img
                src="/decore7.png"
                alt="Wedding venue with white building"
                class="service-image"
              />
              <h3 class="service-name">Wedding Celebration</h3>
            </div>
          </div>

          <div class="service-card">
            <div class="service-image-container">
              <img
                src="/decore1.png"
                alt="Person singing at an event"
                class="service-image"
              />
              <h3 class="service-name">Event Hosting</h3>
            </div>
          </div>

          <div class="service-card">
            <div class="service-image-container">
              <img
                src="/decore1.png"
                alt="Person operating a camera"
                class="service-image"
              />
              <h3 class="service-name">Photography & Videography</h3>
            </div>
          </div>

          <div class="service-card">
            <div class="service-image-container">
              <img
                src="/decore1.png"
                alt="Hands with henna design"
                class="service-image"
              />
              <h3 class="service-name">Mehendi</h3>
            </div>
          </div>

          <!-- Row 2 -->
          <div class="service-card">
            <div class="service-image-container">
              <img
                src="/decore1.png"
                alt="Child in traditional clothing"
                class="service-image"
              />
              <h3 class="service-name">Bratabandha</h3>
            </div>
          </div>

          <div class="service-card">
            <div class="service-image-container">
              <img
                src="/decore1.png"
                alt="DJ performing at an event"
                class="service-image"
              />
              <h3 class="service-name">Sound System and DJ</h3>
            </div>
          </div>

          <div class="service-card">
            <div class="service-image-container">
              <img
                src="/decore1.png"
                alt="People celebrating with a birthday cake"
                class="service-image"
              />
              <h3 class="service-name">Birthday Celebration</h3>
            </div>
          </div>

          <div class="service-card">
            <div class="service-image-container">
              <img
                src="/decore1.png"
                alt="Traditional Nwaran ceremony"
                class="service-image"
              />
              <h3 class="service-name">Nwaran</h3>
            </div>
          </div>
        </div>

        <div class="view-all-container">
          <a href="#" class="view-all-button"
            >View all <span class="arrow">→</span></a
          >
        </div>

        <style>
          .services-container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 40px 20px;
            font-family: Arial, sans-serif;
          }

          .services-subtitle {
            color: #c00;
            font-size: 2rem;
            margin-bottom: 0;
            font-weight: bold;
            font-family: "Brush Script MT", cursive;
          }

          .services-title {
            color: #333;
            font-size: 3.5rem;
            margin-top: 10px;
            margin-bottom: 40px;
            font-weight: bold;
          }

          .services-grid {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 20px;
            margin-bottom: 40px;
          }

          .service-card {
            display: flex;
            flex-direction: column;
            align-items: center;
          }

          .service-image-container {
            width: 100%;
            height: 220px;
            overflow: hidden;
            border-radius: 8px;
            position: relative;
          }

          .service-image {
            width: 100%;
            height: 100%;
            object-fit: cover;
            transition: transform 0.3s ease;
          }

          .service-card:hover .service-image {
            transform: scale(1.05);
          }

          .service-name {
            position: absolute;
            bottom: 0;
            left: 0;
            right: 0;
            background-color: rgba(255, 255, 255, 0.8);
            margin: 0;
            padding: 10px;
            text-align: center;
            font-size: 1rem;
            color: #333;
            transition: background-color 0.3s ease;
          }

          .service-card:hover .service-name {
            background-color: rgba(255, 255, 255, 0.9);
          }

          .view-all-container {
            display: flex;
            justify-content: center;
            margin-top: 20px;
          }

          .view-all-button {
            display: inline-flex;
            align-items: center;
            padding: 10px 30px;
            border: 1px solid #333;
            border-radius: 30px;
            color: #333;
            text-decoration: none;
            font-size: 1rem;
            transition: all 0.3s ease;
          }

          .view-all-button:hover {
            background-color: #f5f5f5;
          }

          .arrow {
            margin-left: 10px;
          }

          /* Responsive styles */
          @media (max-width: 1024px) {
            .services-grid {
              grid-template-columns: repeat(3, 1fr);
            }
          }

          @media (max-width: 768px) {
            .services-grid {
              grid-template-columns: repeat(2, 1fr);
            }

            .services-title {
              font-size: 2.5rem;
            }
          }

          @media (max-width: 480px) {
            .services-grid {
              grid-template-columns: 1fr;
            }

            .services-subtitle {
              font-size: 1.5rem;
            }

            .services-title {
              font-size: 2rem;
            }
          }
        </style>
      </div>
    </div>
    <div class="container5">
      <div class="container5">
        <!-- Heading -->
        <div class="testimonial-heading">
          <h2>Discover What our Satisfied Clients have to Say</h2>
        </div>

        <!-- Testimonial 1 - Top Left -->
        <div class="testimonial-card" style="top: 0; left: 15%">
          <div class="testimonial-header">
            <img
              src="/placeholder.svg?height=80&width=80"
              alt="Client profile picture"
              class="profile-img"
            />
            <div class="client-info">
              <h3 class="client-name">Pragun Maskey</h3>
              <div class="rating">
                <span class="star filled">★</span>
                <span class="star filled">★</span>
                <span class="star filled">★</span>
                <span class="star filled">★</span>
                <span class="star">☆</span>
              </div>
            </div>
          </div>
          <p class="testimonial-text">
            I really appreciated the experience and had a fantastic time at the
            events. The staff was wonderful and the management was top-notch.
          </p>
        </div>

        <!-- Testimonial 2 - Top Right -->
        <div class="testimonial-card" style="top: 4%; right: 14%">
          <div class="testimonial-header">
            <img
              src="/placeholder.svg?height=80&width=80"
              alt="Client profile picture"
              class="profile-img"
            />
            <div class="client-info">
              <h3 class="client-name">Anshu Maskey</h3>
              <div class="rating">
                <span class="star filled">★</span>
                <span class="star filled">★</span>
                <span class="star filled">★</span>
                <span class="star filled">★</span>
                <span class="star">☆</span>
              </div>
            </div>
          </div>
          <p class="testimonial-text">
            I really appreciated the experience and had a fantastic time at the
            events. The staff was wonderful and the management was top-notch.
          </p>
        </div>

        <!-- Testimonial 3 - Middle Left -->
        <div
          class="testimonial-card"
          style="top: 50%; left: 0; transform: translateY(-50%)"
        >
          <div class="testimonial-header">
            <img
              src="/placeholder.svg?height=80&width=80"
              alt="Client profile picture"
              class="profile-img"
            />
            <div class="client-info">
              <h3 class="client-name">Sheenchaan</h3>
              <div class="rating">
                <span class="star filled">★</span>
                <span class="star filled">★</span>
                <span class="star filled">★</span>
                <span class="star filled">★</span>
                <span class="star">☆</span>
              </div>
            </div>
          </div>
          <p class="testimonial-text">
            I really appreciated the experience and had a fantastic time at the
            events. The staff was wonderful and the management was top-notch.
          </p>
        </div>

        <!-- Testimonial 4 - Middle Right -->
        <div
          class="testimonial-card"
          style="top: 50%; right: 10px; transform: translateY(-50%)"
        >
          <div class="testimonial-header">
            <img
              src="/placeholder.svg?height=80&width=80"
              alt="Client profile picture"
              class="profile-img"
            />
            <div class="client-info">
              <h3 class="client-name">Rabina Lama</h3>
              <div class="rating">
                <span class="star filled">★</span>
                <span class="star filled">★</span>
                <span class="star filled">★</span>
                <span class="star filled">★</span>
                <span class="star">☆</span>
              </div>
            </div>
          </div>
          <p class="testimonial-text">
            I really appreciated the experience and had a fantastic time at the
            events. The staff was wonderful and the management was top-notch.
          </p>
        </div>

        <!-- Testimonial 5 - Bottom Center -->
        <div
          class="testimonial-card"
          style="bottom: 15%; left: 50%; transform: translateX(-50%)"
        >
          <div class="testimonial-header">
            <img
              src="/placeholder.svg?height=80&width=80"
              alt="Client profile picture"
              class="profile-img"
            />
            <div class="client-info">
              <h3 class="client-name">Abhishekshek</h3>
              <div class="rating">
                <span class="star filled">★</span>
                <span class="star filled">★</span>
                <span class="star filled">★</span>
                <span class="star filled">★</span>
                <span class="star">☆</span>
              </div>
            </div>
          </div>
          <p class="testimonial-text">
            I really appreciated the experience and had a fantastic time at the
            events. The staff was wonderful and the management was top-notch.
          </p>
        </div>

        <style>
          .container5 {
            font-family: Arial, sans-serif;
            max-width: 1350px;
            margin: 0 auto;
            padding: 20px 20px;
            position: relative;
            height: 100vh; /* Set a fixed height for the container */
          }

          .testimonial-card {
            background-color: white;
            border-radius: 10px;
            padding: 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            width: 350px;
            position: absolute; /* Absolute positioning */
          }

          .testimonial-header {
            display: flex;
            align-items: center;
            margin-bottom: 15px;
          }

          .profile-img {
            width: 60px;
            height: 60px;
            border-radius: 50%;
            object-fit: cover;
            margin-right: 15px;
          }

          .client-name {
            margin: 0 0 5px 0;
            font-size: 18px;
          }

          .rating {
            color: #ffc107;
            font-size: 18px;
          }

          .star.filled {
            color: #ffc107;
          }

          .star {
            color: #e0e0e0;
          }

          .testimonial-text {
            font-size: 16px;
            line-height: 1.6;
            color: #555;
          }

          .testimonial-heading {
            position: absolute;
            top: 44%;
            left: 50%;
            transform: translate(-50%, -50%);
            text-align: center;
            width: 500px;
            z-index: 10;
          }

          .testimonial-heading h2 {
            font-family: "Brush Script MT", cursive;
            color: #d32f2f;
            font-size: 36px;
            font-weight: normal;
            line-height: 1.3;
          }

          /* Media query for responsive design */
          @media (max-width: 1200px) {
            .container5 {
              height: auto;
              padding-bottom: 600px;
            }

            .testimonial-card {
              width: 80%;
              max-width: 300px;
            }

            /* Adjust positions for smaller screens */
            .testimonial-card:nth-child(2) {
              top: 0;
              left: 5%;
              right: auto;
            }
            .testimonial-card:nth-child(3) {
              top: 0;
              right: 5%;
              left: auto;
            }
            .testimonial-card:nth-child(4) {
              top: 200px;
              left: 5%;
              transform: none;
            }
            .testimonial-card:nth-child(5) {
              top: 200px;
              right: 5%;
              left: auto;
              transform: none;
            }
            .testimonial-card:nth-child(6) {
              top: 400px;
              left: 50%;
              transform: translateX(-50%);
              bottom: auto;
            }

            .testimonial-heading {
              top: 300px;
              width: 90%;
            }
          }
        </style>
      </div>
    </div>
    <style>
      .container6 {
        display: flex;
        justify-content: center;
        align-items: flex-start;
        flex-direction: row;
        gap: 30px;
        padding: 40px 20px;
        min-height: 100vh;
      }

      .wrapper6 {
        width: 70%;
      }

      h1 {
        margin-bottom: 20px;
      }

      .container-faq {
        background-color: white;
        color: black;
        border-radius: 8px;
        border: 1px solid #e0e0e0;
        margin: 20px 0;
      }

      .question {
        font-size: 1.2rem;
        font-weight: 600;
        padding: 20px 80px 20px 20px;
        position: relative;
        display: flex;
        align-items: center;
        cursor: pointer;
      }

      .question::after {
        content: "\002B";
        font-size: 2.2rem;
        position: absolute;
        right: 20px;
        transition: 0.2s;
      }

      .question.active::after {
        transform: rotate(45deg);
      }

      .answercont {
        max-height: 0;
        overflow: hidden;
        transition: max-height 0.3s ease;
      }

      .answer {
        padding: 0 20px 20px;
        line-height: 1.5rem;
      }

      .wrapper6-side {
        width: 30%;
      }

      .contact-box {
        background-color: #fff;
        border: 1px solid #e0e0e0;
        border-radius: 8px;
        padding: 30px;
        text-align: center;
        display: flex;
        flex-direction: column;
        align-items: center;
        height: 100%;
      }

      .chat-icon {
        margin-bottom: 20px;
      }

      .contact-heading {
        font-size: 20px;
        margin-bottom: 30px;
      }

      .contact-btn {
        background-color: #c00000;
        color: white;
        text-decoration: none;
        padding: 15px 20px;
        border-radius: 4px;
        font-weight: 600;
        display: block;
        width: 100%;
        text-align: center;
        transition: background-color 0.3s;
      }

      .contact-btn:hover {
        background-color: #a00000;
      }

      @media screen and (max-width: 790px) {
        .container6 {
          flex-direction: column;
          align-items: center;
        }

        .wrapper6,
        .wrapper6-side {
          width: 90%;
        }
      }
    </style>
    <div class="container6">
      <h1>FAQs</h1>
      <div class="wrapper6">
        <div class="container-faq">
          <div class="question">How do I verify my email?</div>
          <div class="answercont">
            <div class="answer">
              Click the link in the verification email from verify@codepen.io
              (be sure to check your spam folder or other email tabs if it's not
              in your inbox). Or, send an email with the subject "Verify" to
              verify@codepen.io from the email address you use for your CodePen
              account.<br /><br />

              <a
                href="https://blog.codepen.io/documentation/features/email-verification/#how-do-i-verify-my-email-2"
                >How to Verify Email Docs</a
              >
            </div>
          </div>
        </div>

        <div class="container-faq">
          <div class="question">
            My Pen loads infinitely or crashes the browser.
          </div>
          <div class="answercont">
            <div class="answer">
              It's likely an infinite loop in JavaScript that we could not
              catch. To fix, add ?turn_off_js=true to the end of the URL (on any
              page, like the Pen or Project editor, your Profile page, or the
              Dashboard) to temporarily turn off JavaScript. When you're ready
              to run the JavaScript again, remove ?turn_off_js=true and refresh
              the page.<br /><br />

              <a
                href="https://blog.codepen.io/documentation/features/turn-off-javascript-in-previews/"
                >How to Disable JavaScript Docs</a
              >
            </div>
          </div>
        </div>

        <div class="container-faq">
          <div class="question">How do I contact the creator of a Pen?</div>
          <div class="answercont">
            <div class="answer">
              You can leave a comment on any public Pen. Click the "Comments"
              link in the Pen editor view, or visit the Details page.<br /><br />

              <a
                href="https://blog.codepen.io/documentation/faq/how-do-i-contact-the-creator-of-a-pen/"
                >How to Contact Creator of a Pen Docs</a
              >
            </div>
          </div>
        </div>

        <div class="container-faq">
          <div class="question">
            What version of [library] does CodePen use?
          </div>
          <div class="answercont">
            <div class="answer">
              We have our current list of library versions
              <a href="https://codepen.io/versions">here</a>
            </div>
          </div>
        </div>

        <div class="container-faq">
          <div class="question">What are forks?</div>
          <div class="answercont">
            <div class="answer">
              A fork is a complete copy of a Pen or Project that you can save to
              your own account and modify. Your forked copy comes with
              everything the original author wrote, including all of the code
              and any dependencies.<br /><br />

              <a href="https://blog.codepen.io/documentation/features/forks/"
                >Learn More About Forks</a
              >
            </div>
          </div>
        </div>
      </div>

      <div class="wrapper6-side">
        <div class="contact-box">
          <div class="chat-icon">
            <svg
              width="60"
              height="60"
              viewBox="0 0 60 60"
              fill="none"
              xmlns="http://www.w3.org/2000/svg"
            >
              <rect width="60" height="60" fill="#C00000" />
              <path
                d="M45 20H15V35C15 36.3261 15.5268 37.5979 16.4645 38.5355C17.4021 39.4732 18.6739 40 20 40H30L40 50V40H45C46.3261 40 47.5979 39.4732 48.5355 38.5355C49.4732 37.5979 50 36.3261 50 35V25C50 23.6739 49.4732 22.4021 48.5355 21.4645C47.5979 20.5268 46.3261 20 45 20Z"
                fill="white"
              />
            </svg>
          </div>
          <h3 class="contact-heading">Do you have more questions?</h3>
          <a href="mailto:contact@example.com" class="contact-btn"
            >Shoot a Direct Mail</a
          >
        </div>
      </div>
    </div>

<!-- containers end here -->

    <script src="${pageContext.request.contextPath}/scripts/scripts.js"></script>
	<jsp:include page="footer.jsp" />

  </body>
</html>
