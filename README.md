# Vocal Canvas

Vocal Canvas is a Flask multi-page site with:
- Project hub + tabbed web UI
- Demo page/API
- Download endpoints for desktop packages

## Local Run

```bash
cd /Users/goldknow/Vocal-canvas
./.venv/bin/python app.py
```

Open: `http://127.0.0.1:5050`

## Publish Publicly (Render)

This repo includes `render.yaml` and `Procfile`.

1. Push this folder to GitHub.
2. In Render: **New +** -> **Blueprint**.
3. Connect your GitHub repo and select `Vocal-canvas`.
4. Deploy.

Render will run:
- Build: `pip install -r requirements.txt`
- Start: `gunicorn app:app --bind 0.0.0.0:$PORT --workers 2 --timeout 120`

## Notes About Demo + Downloads on Cloud

- Demo speech generation uses macOS commands (`say`, `afconvert`), so on Linux hosts the demo API may be unavailable.
- macOS download route can still serve a prebuilt DMG if `downloads/VocalCanvas.dmg` exists in your deploy.
- Windows zip can be served from prebuilt artifact as well.

## Key Paths

- `app.py` - routes, API, package-serving logic
- `templates/` - pages/tabs
- `static/` - styles/scripts
- `desktop_app/` - mac app source
- `windows_app/` - windows app source
