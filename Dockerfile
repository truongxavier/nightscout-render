FROM node:16

# Clone Nightscout
RUN git clone https://github.com/nightscout/cgm-remote-monitor.git /app
WORKDIR /app

# Inject the correct port into server.js
RUN sed -i 's/const port = process.env.PORT || 1337;/const port = process.env.PORT;/g' server.js

# Install dependencies
RUN npm install

# Expose the dynamic port expected by Render
EXPOSE 10000

# Start manually so it picks up PORT env var at runtime
CMD ["node", "server.js"]
