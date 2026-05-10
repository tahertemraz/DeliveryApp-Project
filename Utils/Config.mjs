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
    this.jwtSecret    = process.env.JWT_SECRET; // Also required per README

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
      DB_PASSWORD: this.dbPassword,
      DB_NAME: this.dbName,
      JWT_SECRET: this.jwtSecret
    };

    for (const [envName, value] of Object.entries(requiredFields)) {
      // Check for undefined, empty strings, or invalid numbers (NaN)
      if (value === undefined || value === "" || Number.isNaN(value)) {
        throw new Error(`Missing required config: ${envName}`);
      }
    }
  }
}