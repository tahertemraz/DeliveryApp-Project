import http from "node:http";
import { appRouter } from "./Controllers/AppRouter.mjs";
import Config from "./Utils/Config.mjs";
import Logger from "./Utils/Logger.mjs";

// 1. Initialize our Singleton Config and Logger
const config = new Config();
const logger = new Logger();

// 2. Extract the port from our new Config class
const PORT = config.get("PORT") || 3000;

// 3. Create the server (removed the unnecessary 'await' as noted by the doctor)
const server = http.createServer(appRouter);

// 4. Start the server and use our professional Logger
try {
  server.listen(PORT, () => {
    logger.info(`🚀 Server is successfully running on PORT: ${PORT}`);
    logger.debug(`Environment: ${process.env.NODE_ENV || 'development'}`);
  });
} catch (error) {
  logger.error("Failed to start the server", error);
  process.exit(1); // Exit with failure if we can't start
}

// Handle unexpected crashes gracefully
process.on("uncaughtException", (err) => {
  logger.error("There was an uncaught error", err);
  process.exit(1);
});