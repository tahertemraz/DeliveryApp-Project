// Utils/Config.mjs
import "dotenv/config";

export default class Config {
  static #instance = null;

  static getInstance() {
    if (!Config.#instance) Config.#instance = new Config();
    return Config.#instance;
  }

  constructor() {
    // Required variables
    this.port         = Number(process.env.PORT);
    this.dbHost       = process.env.DB_HOST;
    this.dbPort       = Number(process.env.DB_PORT);
    this.dbUser       = process.env.DB_USER;
    this.dbPassword   = process.env.DB_PASSWORD;
    this.dbName       = process.env.DB_NAME;
    this.jwtSecret    = process.env.JWT_SECRET;

    // Optional variables with sensible defaults
    this.dbConnLimit  = Number(process.env.DB_CONNECTION_LIMIT ?? "10");
    this.dbQueueLimit = Number(process.env.DB_QUEUE_LIMIT      ?? "0");
    this.logLevel     = process.env.LOG_LEVEL                  ?? "INFO";
    this.jwtExpiresIn = process.env.JWT_EXPIRES_IN             ?? "1h";

    // Validate immediately upon instantiation
    this.#validate();
  }

  #validate() {
    const requiredFields = {
      PORT: this.port,
      DB_HOST: this.dbHost,
      DB_PORT: this.dbPort,
      DB_USER: this.dbUser,
      DB_NAME: this.dbName,
      JWT_SECRET: this.jwtSecret
    };

    // 1. Check most fields for being totally missing or invalid numbers
    for (const [envName, value] of Object.entries(requiredFields)) {
      if (value === undefined || value === "" || Number.isNaN(value)) {
        throw new Error(`Missing required config: ${envName}`);
      }
    }

    // 2. Specialized check for DB_PASSWORD: 
    // We only throw if it is 'undefined' (missing from .env). 
    // We ALLOW it to be an empty string "" if you have no password.
    if (this.dbPassword === undefined) {
      throw new Error(`Missing required config: DB_PASSWORD`);
    }
  }

  // Helper method to get config values easily
  get(key) {
    return this[key] || this[key.charAt(0).toLowerCase() + key.slice(1)];
  }
}