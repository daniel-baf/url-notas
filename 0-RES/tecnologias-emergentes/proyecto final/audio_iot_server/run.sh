# try to move a file if it exists
src_json="../notebook/model/class_mapping.json"
src_model="../notebook/model/audio_classification_model.keras"
dest_dir="./iot_api/model"

if [ -f "$src_json" ] && [ -f "$src_model" ]; then
    mv "$src_json" "$src_model" "$dest_dir"
fi

#!/bin/bash
if [ ! -d media ]; then
    mkdir media
fi

# Exit on error
set -e

# Apply migrations
echo "Applying migrations..."
python manage.py migrate

# Start Django development server
echo "Starting Django server..."
python manage.py runserver 0.0.0.0:8000
