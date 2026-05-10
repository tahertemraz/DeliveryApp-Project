// Utils/Logger.mjs

import fs from "node:fs";
import path from "node:path";
import { fileURLToPath } from "node:url";

const __dirName = path.dirname(fileURLToPath(import.meta.url));

// Log levels in ascending severity order.
const LEVELS = { DEBUG: 0, INFO: 1, WARN: 2, ERROR: 3 };

export default class Logger {
  #level;
  #logFile;

  constructor() {
    // Read the log level from the environment, default to INFO
    const envLevel = process.env.LOG_LEVEL || "INFO";
    this.#level = envLevel.toUpperCase();

    // Fallback just in case someone types a weird level in .env
    if (LEVELS[this.#level] === undefined) {
      this.#level = "INFO";
    }

    // Ensure the Logs directory exists before creating the file
    const logsDir = path.join(__dirName, "../Logs");
    if (!fs.existsSync(logsDir)) {
      fs.mkdirSync(logsDir);
    }

    // Open a writable stream in append mode ("a")
    const logFilePath = path.join(logsDir, "app.log");
    this.#logFile = fs.createWriteStream(logFilePath, { flags: "a" });
  }

  #write(level, message) {
    // 1. Check if the message level is high enough to be logged
    if (LEVELS[level] < LEVELS[this.#level]) {
      return; 
    }

    // 2. Build the formatted string
    const timestamp = new Date().toISOString();
    const formattedMessage = `[${timestamp}] [${level}] ${message}\n`;

    // 3. Write to the console AND append to the file
    // We use the correct console method based on the error level
    if (level === "ERROR") {
      console.error(formattedMessage.trim());
    } else if (level === "WARN") {
      console.warn(formattedMessage.trim());
    } else {
      console.log(formattedMessage.trim());
    }
    
    this.#logFile.write(formattedMessage);
  }

  // Public methods
  debug(message) { this.#write("DEBUG", message); }
  info(message)  { this.#write("INFO", message);  }
  warn(message)  { this.#write("WARN", message);  }
  error(message) { this.#write("ERROR", message); }
}

// Export a single shared instance
export const logger = new Logger();