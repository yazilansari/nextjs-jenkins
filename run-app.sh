#!/bin/bash

cd /path/to/your/nextjs-jenkins

# Clean previous process (if any)
pm2 delete nextjs-app || true

# Start Next.js app using PM2
pm2 start npm --name nextjs-app -- run start