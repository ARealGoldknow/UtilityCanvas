# Vocal Canvas

Vocal Canvas is a text-to-speech project with:
- A Flask multi-page website
- A demo TTS API endpoint
- Downloadable desktop app packages (macOS DMG, Windows ZIP)

## Project Structure

- `app.py` - Flask app routes and package builders
- `templates/` - Website pages and tabs
- `static/` - CSS and JS assets
- `desktop_app/` - macOS desktop app source
- `windows_app/` - Windows desktop app source

## Run Website

```bash
cd /Users/goldknow/Vocal-canvas
./.venv/bin/python app.py
```

Open `http://127.0.0.1:5050`.

## Downloads

Use the website Download tab:
- macOS: `/projects/vocal-canvas/download/macos`
- Windows: `/projects/vocal-canvas/download/windows`
