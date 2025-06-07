FROM node:16

# Clone Nightscout
RUN git clone https://github.com/nightscout/cgm-remote-monitor.git /app
WORKDIR /app

# Install dependencies
RUN npm install

# Expose the port passed by Render
EXPOSE 10000

# Force PORT injection at runtime
ENV PORT=10000

# Start Nightscout with the right port
CMD ["node", "server.js"]
