<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Contact Us - Wedding Planner</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
<style>
/* Base styles */
body {
    background-color: #f5f5f5;
    font-family: 'Joan';
    margin: 0;
    padding: 0;
    color: #333;
    position: relative;
}

/* Header styles - using Primary color */
.header {
    background-color: #E54E50;
    color: #ffffff;
    padding: 40px;
    text-align: left;
    position: relative;
    z-index: 1;
}

.header h1 {
    font-size: 48px;
    margin-bottom: 10px;
}

.tagline {
    font-style: italic;
    font-size: 18px;
}

/* Main content layout */
.main-content {
    display: flex;
    flex-wrap: wrap;
    max-width: 1200px;
    margin: 0 auto;
    background: #ffffff;
    box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
    position: relative;
    z-index: 1;
}

.left-column {
    flex: 1;
    padding: 40px;
    min-width: 300px;
}

.right-column {
    flex: 1;
    padding: 40px;
    padding-top: 120px; /* Increased to make room for overlapping image */
    background-color: #ffffff;
    color: #ffffff;
    min-width: 300px;
    display: flex;
    flex-direction: column;
    align-items: center;
    position: relative;
}

/* Wedding image container - positioned to overlap */
.image-container {
    position: absolute;
    top: -180px; /* Negative value to move it up over the header */
    right: 120px;
    z-index: 10;
    width: 200px;
    height: 300px;
}

/* Wedding image */
.wedding-image {
    width: 300px;
    height: 400px;
    border-radius: 40% 40% 2% 2% / 25% 25% 2% 2%;
    object-fit: cover;
    box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
    border: 5px solid #ffffff;
}

/* Contact information section */
.contact-info {
    margin-bottom: 40px;
}

.contact-info p {
    line-height: 1.6;
    margin-bottom: 20px;
}

h2 {
    font-size: 32px;
    margin-bottom: 20px;
    color: #333;
}

.contact-cards {
    display: flex;
    flex-wrap: wrap;
    gap: 20px;
    margin: 30px 0;
}

.contact-card {
    background-color: #ffffff;
    padding: 20px;
    border-radius: 10px;
    text-align: center;
    flex: 1;
    min-width: 150px;
    border: 1px solid #E54E50;
    transition: all 0.3s ease;
}

.contact-card:hover {
    border-color: #C1050B;
    transform: translateY(-5px);
    box-shadow: 0 5px 15px rgba(193, 5, 11, 0.2);
}

.contact-card i {
    font-size: 24px;
    margin-bottom: 15px;
    color: #E54E50;
}

/* Map section */
.map-container {
    margin: 30px 0;
    border: 2px solid #E54E50;
    border-radius: 10px;
    overflow: hidden;
}

.map {
    width: 100%;
    height: 250px;
    background-color: #f5f5f5;
    border-radius: 5px;
    overflow: hidden;
}

/* Social media section */
.social-icons {
    display: flex;
    gap: 20px;
    margin-top: 20px;
}

.social-icons a {
    color:#333;
    font-size: 28px;
    transition: color 0.3s;
}

.social-icons a:hover {
    color: #C1050B;
}

/* Contact form */
.contact-box {
    background-color: #ffffff;
    border-radius: 10px;
    padding: 30px;
    box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
    width: 100%;
    margin-top: 130px;
}

.contact-box h2 {
    text-align: center;
    margin-bottom: 30px;
    color: #E54E50;
}

.row {
    display: flex;
    flex-wrap: wrap;
    margin-top: 10px;
    margin-bottom: 20px;
    gap: 20px;
}

.col {
    flex: 1;
    min-width: 250px;
}

label {
    display: block;
    margin-bottom: 8px;
    font-weight: bold;
    color: #333;
}

input, select, textarea {
    width: 100%;
    padding: 12px;
    border: 1px solid #E54E50;
    border-radius: 30px;
    font-size: 16px;
    box-sizing: border-box;
    transition: border-color 0.3s;
}

input:focus, select:focus, textarea:focus {
    outline: none;
    border-color: #C1050B;
    box-shadow: 0 0 0 2px rgba(193, 5, 11, 0.1);
}

textarea {
    border-radius: 20px;
    resize: none;
}

.phone-input {
    display: flex;
    align-items: center;
}

.country-code {
    background-color: #E54E50;
    color: #ffffff;
    padding: 12px;
    border-radius: 30px 0 0 30px;
    border: 1px solid #E54E50;
    border-right: none;
}

.phone-input input {
    border-radius: 0 30px 30px 0;
}

.submit-button {
    background-color: #E54E50;
    color: #ffffff;
    border: none;
    padding: 12px 30px;
    border-radius: 30px;
    font-size: 18px;
    cursor: pointer;
    display: block;
    margin: 20px auto 0;
    transition: background-color 0.3s;
}

.submit-button:hover {
    background-color: #C1050B;
}

/* Responsive styles */
@media (max-width: 992px) {
    .image-container {
        right: 20px;
        top: -120px;
        width: 250px;
        height: 250px;
    }
}

@media (max-width: 768px) {
    .main-content {
        flex-direction: column;
    }
    
    .row {
        flex-direction: column;
        gap: 15px;
    }
    
    .col {
        width: 100%;
    }
    
    .right-column {
        order: -1; /* Move the form above the contact info on mobile */
        padding-top: 150px;
    }
    
    .image-container {
        top: -100px;
        right: 50%;
        transform: translateX(50%);
        width: 200px;
        height: 200px;
    }
}

/* Right column specific styles */
.right-column h2 {
    color: #ffffff;
}

.right-column .contact-box h2 {
    color: #E54E50;
}

/* Section headings with accent underline */
h2:after {
    content: '';
    display: block;
    width: 50px;
    height: 3px;
    background-color: #C1050B;
    margin-top: 10px;
}

.right-column h2:after {
    background-color: #ffffff;
}

.contact-box h2:after {
    background-color: #C1050B;
    margin: 10px auto 0;
}
</style>
</head>
<body>
    <div class="header">
        <h1>Contact Us</h1>
        <p class="tagline">"Turning your dream wedding into reality"</p>
    </div>
    
    <div class="main-content">
        <div class="left-column">
            <div class="contact-info">
                <h2>Contact Information</h2>
                <p>Because your wedding day is more than just an event—it's the beginning of a lifetime. Let us help you create a celebration that reflects your love, your journey, and your forever."</p>
                
                <div class="contact-cards">
                    <div class="contact-card">
                        <i class="fas fa-phone"></i>
                        <p>+977-XXXXXXXX</p>
                    </div>
                    <div class="contact-card">
                        <i class="fas fa-envelope"></i>
                        <p>mail@paramparaevents.com</p>
                    </div>
                    <div class="contact-card">
                        <i class="fas fa-map-marker-alt"></i>
                        <p>Kathmandu, Nepal</p>
                    </div>
                </div>
            </div>
            
            <div class="location-info">
                <h2>Our Location</h2>
                <div class="map-container">
                    <div class="map">
                        <!-- Replace with actual map embed code -->
                        <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d56516.31625949266!2d85.29111337431642!3d27.70895594443863!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x39eb198a307baabf%3A0xb5137c1bf18db1ea!2sKathmandu%2044600%2C%20Nepal!5e0!3m2!1sen!2sus!4v1650000000000!5m2!1sen!2sus" width="100%" height="250" style="border:0;" allowfullscreen="" loading="lazy"></iframe>
                    </div>
                </div>
            </div>
            
            <div class="social-connect">
                <h2>Connect with us</h2>
                <div class="social-icons">
                    <a href="#"><i class="fab fa-instagram"></i></a>
                    <a href="#"><i class="fab fa-facebook-f"></i></a>
                    <a href="#"><i class="fab fa-youtube"></i></a>
                    <a href="#"><i class="fab fa-tiktok"></i></a>
                </div>
            </div>
        </div>
        
        <div class="right-column">
            <div class="image-container">
                <img src="./Images/Weddinghands.jpeg" alt="Wedding hands" class="wedding-image">
            </div>
            
            <div class="contact-box">
                <h2>Start your journey with us</h2>
                <form action="submitContact.jsp" method="post">
                    <div class="row">
                        <div class="col">
                            <label for="fullname">Full name:</label>
                            <input type="text" id="fullname" name="fullname" placeholder="e.g. Hari Bahadur" required>
                        </div>
                        <div class="col">
                            <label for="phone">Phone number:</label>
                            <div class="phone-input">
                                <span class="country-code">+977</span>
                                <input type="tel" id="phone" name="phone" placeholder="98XXXXXXX" required>
                            </div>
                        </div>
                    </div>
                    
                    <div class="row">
                        <div class="col">
                            <label for="eventType">Select event type:</label>
                            <select id="eventType" name="eventType" required>
                                <option value="">Select event type</option>
                                <option>Wedding</option>
                                <option>Birthday</option>
                                <option>Conference</option>
                                <option>Other</option>
                            </select>
                        </div>
                        <div class="col">
                            <label for="email">Email address (optional):</label>
                            <input type="email" id="email" name="email" placeholder="Enter your email address">
                        </div>
                    </div>
                    
                    <div class="row">
                        <div class="col">
                            <label for="budget">Your budget:</label>
                            <select id="budget" name="budget" required>
                                <option value="">Select budget</option>
                                <option>Below $500</option>
                                <option>$500 - $1000</option>
                                <option>Above $1000</option>
                            </select>
                        </div>
                    </div>
                    
                    <div class="row">
                        <div class="col">
                            <label for="message">Your message:</label>
                            <textarea id="message" name="message" placeholder="Enter your comments" rows="5"></textarea>
                        </div>
                    </div>
                    
                    <button type="submit" class="submit-button">Submit</button>
                </form>
            </div>
        </div>
    </div>
</body>
</html>