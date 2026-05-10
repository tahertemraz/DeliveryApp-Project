import { authController } from "./AuthController.mjs"; // handles login, logout, and customer registration
import { pageController } from "./PageController.mjs"; // handles serving HTML pages and CSS files
import { courrierController } from "./CourrierController.mjs"; // handles courrier auth and dashboard
import { restaurantController } from "./RestaurantController.mjs"; // handles restaurant manager auth and dashboard
import { orderController } from "./OrderController.mjs"; // handles order creation, viewing, and cancellation
import { createRouter } from "./Router.mjs"; // factory function that creates a Router instance

const router = createRouter(); // creates a new Router instance with an empty routes table

// --- PAGES (GET Routes) ---
// UPDATED: The root "/" now opens the Landing Page instead of the Login page
router.add("GET", "/", pageController.landing); 

router.add("GET", "/login", pageController.login); 
router.add("GET", "/register", pageController.register); 
router.add("GET", "/auth/login", pageController.login);      
router.add("GET", "/auth/register", pageController.register); 
router.add("GET", "/home", pageController.home); 

// --- STYLES ---
router.add("GET", "/index.css",     pageController.styleIndex);
router.add("GET", "/error.css",     pageController.styleError);
router.add("GET", "/dashboard.css", pageController.styleDashboard);

// --- CUSTOMER AUTH (POST Routes) ---
router.add("POST", "/auth/register", authController.register); 
router.add("POST", "/auth/login", authController.login); 
router.add("POST", "/auth/logout", authController.logout); 

// --- COURRIER ---
router.add("GET", "/courrier/register", pageController.courrierRegister); 
router.add("GET", "/courrier/login", pageController.courrierLogin); 
router.add("GET", "/courrier/dashboard", courrierController.dashboard); 
router.add("POST", "/courrier/register", courrierController.register); 
router.add("POST", "/courrier/login", courrierController.login); 
router.add("POST", "/courrier/logout", courrierController.logout); 

// --- RESTAURANT MANAGER ---
router.add("GET", "/restaurant/register", pageController.restaurantRegister); 
router.add("GET", "/restaurant/login", pageController.restaurantLogin); 
router.add("GET", "/restaurant/dashboard", restaurantController.dashboard); 
router.add("POST", "/restaurant/register", restaurantController.register); 
router.add("POST", "/restaurant/login", restaurantController.login); 
router.add("POST", "/restaurant/logout", restaurantController.logout); 

// --- RESTAURANT MENU ---
router.add("GET", "/restaurant/menu", pageController.restaurantMenu); 
router.add("POST", "/restaurant/menu/add", restaurantController.addMenuItem); 

// --- CART & ORDERS ---
router.add("POST", "/cart/add", orderController.addToCart); 
router.add("POST", "/order/create", orderController.create); 
router.add("GET", "/order", orderController.view); 
router.add("POST", "/order/cancel", orderController.cancel); 
router.add("POST", "/order/assign", restaurantController.assignCourier); 

// --- COURRIER STATUS ---
router.add("POST", "/courrier/status", courrierController.updateStatus); 

export const appRouter = router.dispatch;