<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Parampara Events Dashboard</title>
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />
    <style>
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

      * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
        font-family: "Segoe UI", Tahoma, Geneva, Verdana, sans-serif;
      }

      body {
        background-color: #f5f5f5;
      }

      .container {
        display: flex;
        min-height: 100vh;
      }

   
      /* Sidebar Styles */
      .sidebar {
        width: 220px;
        background-color: #ffffff;
        display: flex;
        flex-direction: column;
        padding: 20px 0;
        box-shadow: 2px 0 5px rgba(0, 0, 0, 0.05);
      }

      .sidebar .logo {
        padding: 0 20px;
        margin-bottom: 30px;
      }

      .sidebar .logo h1 {
        color: #333;
        font-weight: 500;
        margin-bottom: 0;
      }

      .sidebar .logo h2 {
        color: #e54e50;
        font-weight: 600;
      }

      .menu {
        flex: 1;
      }

      .menu-item {
        display: flex;
        align-items: center;
        padding: 12px 20px;
        color: #666;
        cursor: pointer;
        transition: all 0.3s ease;
      }

      .menu-item:hover {
        background-color: rgba(229, 78, 80, 0.1);
        color: #e54e50;
      }

      .menu-item.active {
        background-color: rgba(229, 78, 80, 0.1);
        color: #e54e50;
        border-left: 3px solid #e54e50;
      }

      .menu-item i {
        margin-right: 12px;
        font-size: 18px;
        width: 20px;
        text-align: center;
      }

      .bottom-menu {
        margin-top: auto;
      }

      .logout {
        color: #e54e50;
      }

      /* Main Content Styles */
      .main-content {
        flex: 1;
        padding: 20px;
        background-color: #f0f2f5;
      }

      /* Top Bar Styles */
      .top-bar {
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-bottom: 30px;
      }

      .search-bar {
        position: relative;
        width: 300px;
      }

      .search-bar input {
        width: 100%;
        padding: 10px 15px 10px 40px;
        border: none;
        border-radius: 5px;
        background-color: #ffffff;
        box-shadow: 0 2px 5px rgba(0, 0, 0, 0.05);
      }

      .search-bar i {
        position: absolute;
        left: 15px;
        top: 50%;
        transform: translateY(-50%);
        color: #999;
      }

      .user-profile {
        display: flex;
        align-items: center;
      }

      .notification {
        margin-right: 20px;
        position: relative;
        cursor: pointer;
      }

      .notification i {
        font-size: 20px;
        color: #666;
      }

      .profile {
        display: flex;
        align-items: center;
        background-color: rgba(229, 78, 80, 0.1);
        padding: 5px 15px 5px 5px;
        border-radius: 50px;
      }

      .profile img {
        width: 40px;
        height: 40px;
        border-radius: 50%;
        margin-right: 10px;
        object-fit: cover;
      }

      .profile-info {
        display: flex;
        flex-direction: column;
      }

      .name {
        font-weight: 500;
        color: #333;
      }

      .role {
        font-size: 12px;
        color: #e54e50;
      }

      /* Dashboard Content Styles */
      .dashboard-content h2 {
        margin-bottom: 20px;
        color: #333;
      }

      /* Stats Cards Styles */
      .stats-cards {
        display: grid;
        grid-template-columns: repeat(4, 1fr);
        gap: 20px;
        margin-bottom: 30px;
      }

      .stat-card {
        background-color: rgba(255, 228, 228, 0.5);
        border-radius: 10px;
        padding: 20px;
        box-shadow: 0 2px 5px rgba(0, 0, 0, 0.05);
      }

      .stat-card h3 {
        font-size: 16px;
        color: #666;
        margin-bottom: 10px;
        font-weight: 500;
      }

      .stat-card p {
        font-size: 24px;
        color: #333;
        font-weight: 600;
      }

      /* Upcoming Events Styles */
      .upcoming-events {
        margin-bottom: 30px;
      }

      .events-container {
        display: flex;
        gap: 20px;
      }

      .events-table {
        flex: 1;
        background-color: #ffffff;
        border-radius: 10px;
        overflow: hidden;
        box-shadow: 0 2px 5px rgba(0, 0, 0, 0.05);
      }

      .table-header {
        display: grid;
        grid-template-columns: 1fr 1fr 1fr;
        background-color: #f5f5f5;
        padding: 15px;
        font-weight: 600;
        color: #333;
      }

      .table-row {
        display: grid;
        grid-template-columns: 1fr 1fr 1fr;
        padding: 15px;
        border-bottom: 1px solid #f0f0f0;
      }

      .table-row:last-child {
        border-bottom: none;
      }

      .status {
        display: inline-block;
        padding: 5px 10px;
        border-radius: 20px;
        font-size: 12px;
        font-weight: 500;
      }

      .status.pending {
        background-color: #fff9c4;
        color: #fbc02d;
      }

      .status.in-progress {
        background-color: #e3f2fd;
        color: #2196f3;
      }

      .status.paid {
        background-color: #e8f5e9;
        color: #4caf50;
      }

      /* Calendar Styles */
      .calendar {
        width: 350px;
        background-color: #ffffff;
        border-radius: 10px;
        overflow: hidden;
        box-shadow: 0 2px 5px rgba(0, 0, 0, 0.05);
        padding: 20px;
      }

      .calendar-header {
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-bottom: 20px;
      }

      .month-title {
        font-weight: 600;
        color: #333;
      }

      .month-nav {
        width: 30px;
        height: 30px;
        display: flex;
        align-items: center;
        justify-content: center;
        border-radius: 50%;
        cursor: pointer;
        color: #666;
      }

      .month-nav:hover {
        background-color: #f5f5f5;
      }

      .day-names {
        display: grid;
        grid-template-columns: repeat(7, 1fr);
        text-align: center;
        margin-bottom: 10px;
        font-weight: 500;
        color: #666;
      }

      .days-grid {
        display: grid;
        grid-template-columns: repeat(7, 1fr);
        gap: 5px;
      }

      .day {
        display: flex;
        align-items: center;
        justify-content: center;
        height: 35px;
        border-radius: 50%;
        cursor: pointer;
        color: #333;
      }

      .day:hover {
        background-color: #f5f5f5;
      }

      .day.prev-month,
      .day.next-month {
        color: #ccc;
      }

      .day.current {
        background-color: #e54e50;
        color: #ffffff;
      }

      /* Bottom Section Styles */
      .bottom-section {
        background-color: #ffffff;
        border-radius: 10px;
        padding: 20px;
        box-shadow: 0 2px 5px rgba(0, 0, 0, 0.05);
      }

      .tabs {
        display: flex;
        margin-bottom: 20px;
        border-bottom: 1px solid #f0f0f0;
      }

      .tab {
        padding: 10px 20px;
        cursor: pointer;
        color: #666;
        position: relative;
      }

      .tab.active {
        color: #e54e50;
      }

      .tab.active::after {
        content: "";
        position: absolute;
        bottom: -1px;
        left: 0;
        width: 100%;
        height: 2px;
        background-color: #e54e50;
      }

      .chart {
        height: 200px;
        position: relative;
      }

      .chart-svg {
        width: 100%;
        height: 100%;
      }

      .chart-labels {
        display: flex;
        justify-content: space-between;
        margin-top: 10px;
        color: #666;
        font-size: 14px;
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

      /* Responsive Styles */
      @media (max-width: 1200px) {
        .stats-cards {
          grid-template-columns: repeat(2, 1fr);
        }

        .events-container {
          flex-direction: column;
        }

        .calendar {
          width: 100%;
        }
      }

      @media (max-width: 768px) {
        .container {
          flex-direction: column;
        }

        .sidebar {
          width: 100%;
          padding: 10px 0;
        }

        .menu-item {
          padding: 8px 15px;
        }

        .top-bar {
          flex-direction: column;
          align-items: flex-start;
        }

        .search-bar {
          width: 100%;
          margin-bottom: 15px;
        }

        .stats-cards {
          grid-template-columns: 1fr;
        }
      }
    </style>
  </head>
  <body>
   	<jsp:include page="header.jsp" />

    <div class="container">
      <!-- Sidebar -->
      <div class="sidebar">
        <div class="logo">
          <h1>Parampara</h1>
          <h2>Events</h2>
        </div>
        <div class="menu">
          <div class="menu-item active">
            <i class="fas fa-th-large"></i>
            <span>Dashboard</span>
          </div>
          <div class="menu-item">
            <i class="fas fa-user"></i>
            <span>Customer</span>
          </div>
          <div class="menu-item">
            <i class="fas fa-calendar-check"></i>
            <span>Event</span>
          </div>
          <div class="menu-item">
            <i class="fas fa-credit-card"></i>
            <span>Payment</span>
          </div>
          <div class="menu-item">
            <i class="fas fa-calendar-alt"></i>
            <span>Calendar</span>
          </div>
          <div class="menu-item">
            <i class="fas fa-file-alt"></i>
            <span>Report</span>
          </div>
        </div>
        <div class="bottom-menu">
          <div class="menu-item">
            <i class="fas fa-cog"></i>
            <span>Settings</span>
          </div>
          <div class="menu-item logout">
            <i class="fas fa-sign-out-alt"></i>
            <span>Logout</span>
          </div>
        </div>
      </div>

      <!-- Main Content -->
      <div class="main-content">
        <!-- Top Bar -->
        <div class="top-bar">
          <div class="search-bar">
            <i class="fas fa-search"></i>
            <input type="text" placeholder="Search..." />
          </div>
          <div class="user-profile">
            <div class="notification">
              <i class="fas fa-bell"></i>
            </div>
            <div class="profile">
              <img src="photos/admin.png" alt="Profile Image" />
              <div class="profile-info">
                <span class="name">Sneha Sapkota</span>
                <span class="role">ADMIN</span>
              </div>
            </div>
          </div>
        </div>

        <!-- Dashboard Content -->
        <div class="dashboard-content">
          <h2>Last Month</h2>

          <!-- Stats Cards -->
          <div class="stats-cards">
            <div class="stat-card">
              <h3>Total Booking</h3>
              <p>100</p>
            </div>
            <div class="stat-card">
              <h3>Upcoming Event</h3>
              <p>100</p>
            </div>
            <div class="stat-card">
              <h3>Revenue This Month</h3>
              <p>Rs. 100000</p>
            </div>
            <div class="stat-card">
              <h3>Pending Payment</h3>
              <p>Rs. 300000</p>
            </div>
          </div>

          <!-- Upcoming Events -->
          <div class="upcoming-events">
            <h2>Upcoming Events</h2>
            <div class="events-container">
              <div class="events-table">
                <div class="table-header">
                  <div class="header-cell">Events</div>
                  <div class="header-cell">Status</div>
                  <div class="header-cell">Email</div>
                </div>
                <div class="table-row">
                  <div class="cell">Wedding(BarshaBibek)</div>
                  <div class="cell">
                    <span class="status pending">Pending</span>
                  </div>
                  <div class="cell">BarshaBibek123@gmail.com</div>
                </div>
                <div class="table-row">
                  <div class="cell">Wedding(BarshaBibek)</div>
                  <div class="cell">
                    <span class="status in-progress">InProgress</span>
                  </div>
                  <div class="cell">BarshaBibek123@gmail.com</div>
                </div>
                <div class="table-row">
                  <div class="cell">Wedding(BarshaBibek)</div>
                  <div class="cell"><span class="status paid">Paid</span></div>
                  <div class="cell">BarshaBibek123@gmail.com</div>
                </div>
                <div class="table-row">
                  <div class="cell">Wedding(BarshaBibek)</div>
                  <div class="cell"><span class="status paid">Paid</span></div>
                  <div class="cell">BarshaBibek123@gmail.com</div>
                </div>
                <div class="table-row">
                  <div class="cell">Wedding(BarshaBibek)</div>
                  <div class="cell">
                    <span class="status pending">Pending</span>
                  </div>
                  <div class="cell">BarshaBibek123@gmail.com</div>
                </div>
                <div class="table-row">
                  <div class="cell">Wedding(BarshaBibek)</div>
                  <div class="cell">
                    <span class="status pending">Pending</span>
                  </div>
                  <div class="cell">BarshaBibek123@gmail.com</div>
                </div>
              </div>

              <!-- Calendar -->
              <div class="calendar">
                <div class="calendar-header">
                  <div class="month-nav">
                    <i class="fas fa-chevron-left"></i>
                  </div>
                  <div class="month-title">March 2021</div>
                  <div class="month-nav">
                    <i class="fas fa-chevron-right"></i>
                  </div>
                </div>
                <div class="calendar-days">
                  <div class="day-names">
                    <div>S</div>
                    <div>M</div>
                    <div>T</div>
                    <div>W</div>
                    <div>T</div>
                    <div>F</div>
                    <div>S</div>
                  </div>
                  <div class="days-grid">
                    <div class="day prev-month">27</div>
                    <div class="day prev-month">28</div>
                    <div class="day">1</div>
                    <div class="day">2</div>
                    <div class="day">3</div>
                    <div class="day">4</div>
                    <div class="day">5</div>
                    <div class="day">6</div>
                    <div class="day">7</div>
                    <div class="day">8</div>
                    <div class="day">9</div>
                    <div class="day">10</div>
                    <div class="day">11</div>
                    <div class="day">12</div>
                    <div class="day current">13</div>
                    <div class="day">14</div>
                    <div class="day">15</div>
                    <div class="day">16</div>
                    <div class="day">17</div>
                    <div class="day">18</div>
                    <div class="day">19</div>
                    <div class="day">20</div>
                    <div class="day">21</div>
                    <div class="day">22</div>
                    <div class="day">23</div>
                    <div class="day">24</div>
                    <div class="day">25</div>
                    <div class="day">26</div>
                    <div class="day">27</div>
                    <div class="day">28</div>
                    <div class="day">29</div>
                    <div class="day">30</div>
                    <div class="day">31</div>
                    <div class="day next-month">1</div>
                    <div class="day next-month">2</div>
                  </div>
                </div>
              </div>
            </div>
          </div>

          <!-- Bottom Section -->
          <div class="bottom-section">
            <div class="tabs">
              <div class="tab active">Users</div>
              <div class="tab">Projects</div>
              <div class="tab">Operating Status</div>
            </div>
            <div class="chart">
              <svg viewBox="0 0 500 200" class="chart-svg">
                <polyline
                  fill="none"
                  stroke="#E54E50"
                  stroke-width="2"
                  points="
                                0,120
                                100,80
                                200,180
                                300,40
                                400,100
                                500,60
                                " />
                <g class="points">
                  <circle
                    cx="0"
                    cy="120"
                    r="4"
                    fill="#ffffff"
                    stroke="#E54E50"
                    stroke-width="2" />
                  <circle
                    cx="100"
                    cy="80"
                    r="4"
                    fill="#ffffff"
                    stroke="#E54E50"
                    stroke-width="2" />
                  <circle
                    cx="200"
                    cy="180"
                    r="4"
                    fill="#ffffff"
                    stroke="#E54E50"
                    stroke-width="2" />
                  <circle
                    cx="300"
                    cy="40"
                    r="4"
                    fill="#ffffff"
                    stroke="#E54E50"
                    stroke-width="2" />
                  <circle
                    cx="400"
                    cy="100"
                    r="4"
                    fill="#ffffff"
                    stroke="#E54E50"
                    stroke-width="2" />
                  <circle
                    cx="500"
                    cy="60"
                    r="4"
                    fill="#ffffff"
                    stroke="#E54E50"
                    stroke-width="2" />
                </g>
              </svg>
              <div class="chart-labels">
                <span>Jan</span>
                <span>Feb</span>
                <span>Mar</span>
                <span>Apr</span>
                <span>May</span>
                <span>Jun</span>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    	<jsp:include page="footer.jsp" />
    
  </body>
</html>
