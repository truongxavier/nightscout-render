FROM node:16

# Clone Nightscout
RUN git clone https://github.com/nightscout/cgm-remote-monitor.git /app
WORKDIR /app

# Install dependencies
RUN npm install

# Expose the Render-assigned port
ENV PORT=${PORT:-1337}
EXPOSE ${PORT}

# Lancement de Nightscout
CMD ["npm", "start"]
