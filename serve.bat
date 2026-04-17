@echo off
echo Cash Flow Planner running at http://localhost:8080
echo Access via Tailscale at http://<your-tailscale-ip>:8080
echo Press Ctrl+C to stop.
python -m http.server 8080
