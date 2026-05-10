# Deliveroo Clone - Full-Stack Delivery Management System

A comprehensive, multi-role food delivery platform built with a custom-routed Node.js backend, MySQL database integration, and a role-based Model-View-Controller (MVC) architecture.

## 🚀 Project Overview
This project demonstrates the end-to-end lifecycle of a food delivery ecosystem. It facilitates seamless interaction between three primary user roles, each with a dedicated dashboard and specific business logic permissions.

## 🛠️ Tech Stack
* **Backend:** Node.js (ES Modules)
* **Database:** MySQL (Relational Schema)
* **Authentication:** JWT-based Token Security via Cookies
* **Architecture:** Model-View-Controller (MVC)
* **Frontend:** HTML5, CSS3

## 👤 User Roles & Functionality

### 1. The Customer Portal
* **Registration & Login:** Secure account creation.
* **Marketplace:** View a dynamic list of registered restaurants.
* **Menu Interaction:** Browse restaurant menus and add items to a persistent cart.
* **Order Management:** Place orders that are instantly visible to restaurant managers.

### 2. The Restaurant Manager Portal
* **Business Setup:** Register a restaurant and manage credentials.
* **Menu Management:** Add and update menu items (Name, Price, Description).
* **Order Fulfillment:** View pending customer orders and assign them to available Couriers.

### 3. The Courier Portal
* **Delivery Dashboard:** View orders assigned specifically to them.
* **Status Updates:** Update delivery progress (e.g., 'Preparing', 'On the way', 'Delivered').

## 📂 Project Structure
* `index.mjs`: Entry point of the server.
* `Controllers/`: Contains the logic for Auth, Pages, Orders, and Users.
* `Models/`: Handles data logic and database communication.
* `Views/`: HTML templates for all roles and the Landing Page.
* `Database/`: Repository files for MySQL queries and table management.
* `Utils/`: Helper functions for parsing, rendering, and constants.

## 🚥 Getting Started

### Prerequisites
* Node.js installed.
* MySQL Server running.

### Installation
1.  Clone the repository.
2.  Run the server:
    ```bash
    node index.mjs
    ```
4.  Open your browser to: `http://localhost:3000/`

## 🏁 Final Submission Note
This project demonstrates robust routing, secure role-based access control, and dynamic database interaction.

---
**Final Project — Computer Science Department**