#!/bin/bash

# Exit on error
set -e

# Apply migrations
echo "Applying migrations..."
python manage.py migrate

# Start Django development server
echo "Starting Django server..."
python manage.py runserver 0.0.0.0:8000
