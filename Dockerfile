FROM node:16

# Clone Nightscout
RUN git clone https://github.com/nightscout/cgm-remote-monitor.git /app
WORKDIR /app

# Install dependencies
RUN npm install

# Build frontend
RUN npm run build

# Expose Render port (use env var if available)
ENV PORT=${PORT:-1337}
EXPOSE ${PORT}

CMD ["npm", "start"]
