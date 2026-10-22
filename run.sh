#!/usr/bin/env bash
# CatFlow-OSI: One-click runner for Linux / macOS
set -e

echo "========================================================"
echo "  CatFlow-Marimo: Closed-Loop Catalyst Inverse Designer"
echo "  Open Scientific Intelligence Hackathon 2026"
echo "========================================================"

if command -v marimo &> /dev/null; then
    echo "[INFO] Launching Marimo Reactive Web App on http://localhost:2718..."
    marimo run app.py --port 2718
else
    echo "[ERROR] 'marimo' command not found."
    echo "[TIP] Please run: pip install -r requirements.txt"
    echo "[TIP] Or simply open 'catflow_interactive_demo.html' in your browser (zero Python dependency)!"
    exit 1
fi
