<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Parampara Events</title>
    <style>
        /* Reset and Base Styles */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: Joan , sans-serif;
            line-height: 1.6;
            color: #333;
        }

        h1, h2, h3, h4, h5, h6 {
            margin-bottom: 0.5rem;
        }

        p {
            margin-bottom: 1rem;
        }

        img {
            max-width: 100%;
            height: auto;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 20px;
        }

        /* Hero Section */
        .hero {
            position: relative;
            background-image: url('/placeholder.svg?height=600&width=1200');
            background-size: cover;
            background-position: center;
            color: #ffffff;
            padding: 80px 20px;
            text-align: center;
        }

        .hero-overlay {
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background-color: rgba(0, 0, 0, 0.5);
            z-index: 1;
        }

        .hero-content {
            position: relative;
            z-index: 2;
        }

        .hero h1 {
            font-size: 3rem;
            margin-bottom: 10px;
        }

        .hero p {
            font-size: 1.2rem;
            max-width: 800px;
            margin: 30px auto;
            line-height: 1.6;
        }

        /* About Section */
        .about {
            background-color: #E54E50;
            color: #ffffff;
            padding: 40px 20px;
        }

        .about-content {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            align-items: center;
            gap: 30px;
        }

        .about-image {
            flex: 0 0 300px;
        }

        .about-image img {
            width: 100%;
            border-radius: 10px;
        }

        .about-text {
            flex: 1 1 500px;
            max-width: 600px;
        }

        .about-text p {
            font-size: 1.1rem;
            line-height: 1.6;
        }

        .btn {
            display: inline-block;
            background-color: #C1050B;
            color: #ffffff;
            border: none;
            padding: 12px 24px;
            border-radius: 30px;
            font-size: 1rem;
            cursor: pointer;
            text-decoration: none;
            margin-top: 20px;
        }

        /* Stats Section */
        .stats {
            background-color: #f5f5f5;
            padding: 40px 20px;
        }

        .stats-content {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-around;
        }

        .stat-item {
            flex: 1 1 300px;
            display: flex;
            flex-direction: column;
            align-items: center;
            padding: 20px;
            text-align: center;
        }

        .stat-item h2 {
            color: #E54E50;
            margin: 0 0 10px 0;
        }

        .stat-item p {
            color: #666;
        }

        .stat-item img {
            max-width: 300px;
            border-radius: 10px;
            margin-top: 20px;
        }

        /* Team Section */
        .team {
            background-color: #E54E50;
            padding: 60px 20px 120px 20px;
            position: relative;
            overflow: hidden;
            color: #ffffff;
        }

        .team-wave {
            position: absolute;
            bottom: 0;
            left: 0;
            right: 0;
            height: 150px;
            background: linear-gradient(to bottom, transparent, #C1050B);
            transform: skewY(-3deg) translateY(50px);
            z-index: 1;
        }

        .team-content {
            position: relative;
            z-index: 2;
            display: flex;
            flex-wrap: wrap;
        }

        .team-title {
            flex: 0 0 300px;
            padding-right: 20px;
        }

        .team-title h2 {
            font-size: 2.5rem;
            line-height: 1.2;
            margin-top: 20px;
        }

        .team-members {
            flex: 1 1 700px;
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(150px, 1fr));
            gap: 20px;
            grid-auto-flow: dense;
        }

        .team-member {
            background-color: #ffffff;
            border-radius: 10px;
            padding: 10px;
            height: 150px;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
        }

        .team-member.offset {
            margin-top: 20px;
        }

        .team-member img {
            width: 100px;
            height: 100px;
            border-radius: 50%;
            object-fit: cover;
            border: 3px solid #E54E50;
        }

        .team-member h3 {
            color: #333;
            margin: 10px 0 0 0;
            font-size: 0.9rem;
        }

        /* FAQ Section */
        .faq {
            background-color: #C1050B;
            padding: 60px 20px;
            color: #ffffff;
        }

        .faq h2 {
            font-size: 2.5rem;
            margin-bottom: 30px;
        }

        .faq-content {
            max-width: 800px;
            margin: 0 auto;
        }

        .faq-item {
            background-color: #ffffff;
            color: #333;
            padding: 15px 20px;
            border-radius: 30px;
            margin: 15px 0;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .faq-toggle {
            background-color: #E54E50;
            color: #ffffff;
            width: 24px;
            height: 24px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.2rem;
        }

        /* Responsive Styles */
        @media (max-width: 768px) {
            .hero h1 {
                font-size: 2.5rem;
            }

            .team-title {
                flex: 0 0 100%;
                text-align: center;
                padding-right: 0;
                margin-bottom: 30px;
            }

            .team-members {
                grid-template-columns: repeat(auto-fit, minmax(120px, 1fr));
            }
        }

        @media (max-width: 480px) {
            .hero h1 {
                font-size: 2rem;
            }

            .team-members {
                grid-template-columns: repeat(2, 1fr);
            }
        }
    </style>
</head>
<body>
    <!-- Hero Section -->
    <section class="hero">
        <div class="hero-overlay"></div>
        <div class="hero-content container">
            <h1>About</h1>
            <h1>Parampara Events</h1>
            <p>
                We blend tradition with modern elegance to design events that feel both rooted and
                refreshing. Whether it's a vibrant Teej celebration or a sacred Nwaran ceremony, we turn
                your vision into an unforgettable experience
            </p>
        </div>
    </section>

    <!-- About Section -->
    <section class="about">
        <div class="about-content container">
            <div class="about-image">
                <img src="./Images/teaminaction.jpeg" alt="Traditional henna design">
            </div>
            <div class="about-text">
                <p>
                    Founded in 2015, EventPlan began as a small start-up with a big dream: to revolutionize
                    the corporate event planning industry. Over the years, we've grown and evolved, achieving
                    numerous milestones and building lasting relationships with our clients and partners.
                </p>
                <a href="#" class="btn">Explore our services</a>
            </div>
            <div class="about-image">
                <img src="./Images/environment.jpeg" alt="Traditional wedding ceremony">
            </div>
        </div>
    </section>

    <!-- Stats Section -->
    <section class="stats">
        <div class="stats-content container">
            <div class="stat-item">
                <h2>More than</h2>
                <h2>1k events</h2>
                <p style="font-size: 0.9rem;">successfully organized</p>
                <img src="./Images/entrance.jpeg" alt="Event venue">
            </div>
            <div class="stat-item">
                <p>
                    To celebrate Nepali traditions with heartfelt planning honoring every ritual with care,
                    creativity, and a lifetime experience you'll cherish forever.
                </p>
                <img src="./Images/outdoorwedding.jpeg" alt="Traditional celebration">
            </div>
            <div class="stat-item">
                <h2 style="font-size: 2.5rem;">90%</h2>
                <p>of our client retention for our services</p>
            </div>
        </div>
    </section>

    <!-- Team Section -->
    <section class="team">
        <div class="team-wave"></div>
        <div class="team-content container">
            <div class="team-title">
                <h2>Meet<br>our<br>team</h2>
            </div>
            <div class="team-members">
                <!-- First row -->
                <div class="team-member">
                    <img src="/placeholder.svg?height=100&width=100&text=Team Member 1" alt="Team Member 1">
                    <h3>Pragun Raj Maskey</h3>
                </div>
                <div class="team-member">
                    <img src="/placeholder.svg?height=100&width=100&text=Team Member 2" alt="Team Member 2">
                    <h3>Pranjali Prasai</h3>
                </div>
                <!-- Second row -->
                <div class="team-member offset">
                    <img src="/placeholder.svg?height=100&width=100&text=Team Member 3" alt="Team Member 3">
                    <h3>Sneha Sapkota</h3>
                </div>
                <div class="team-member">
                    <img src="/placeholder.svg?height=100&width=100&text=Team Member 4" alt="Team Member 4">
                    <h3>Santosh Lamichhane</h3>
                </div>
                <div class="team-member offset">
                    <img src="/placeholder.svg?height=100&width=100&text=Team Member 5" alt="Team Member 5">
                    <h3>Krijal Maharjan</h3>
                </div>
            </div>
        </div>
    </section>

    <!-- FAQ Section -->
    <section class="faq">
        <div class="container">
            <h2>FAQ</h2>
            <div class="faq-content">
                <div class="faq-item">
                    <span>How do you ensure succession of an event?</span>
                    <span class="faq-toggle">+</span>
                </div>
                <div class="faq-item">
                    <span>Do you offer customized event packages?</span>
                    <span class="faq-toggle">+</span>
                </div>
                <div class="faq-item">
                    <span>How far in advance should I book your services?</span>
                    <span class="faq-toggle">+</span>
                </div>
            </div>
        </div>
    </section>
</body>
</html>
