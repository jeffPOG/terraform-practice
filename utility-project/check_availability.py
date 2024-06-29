# check_availability.py
import json

# Dummy data representing available zones
data = {
    "available_zones": ["us-east-1a", "us-east-1b", "us-east-1c"]
}

print(json.dumps(data))
