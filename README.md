# CS496 Final Exam — Study Portal

Self-contained study portal for the CS496 final exam, covering three modules:

- **Quantum Computing** (slides 000–009)
- **AI / Agentic AI** (slides 010–020)
- **Blockchain** (slides 021–029, plus videos)

## Features

- 🎓 **Ultimate Revision Guides** (markdown, rendered inline) — tutorial Q&A, zero-gaps slide notes, rapid recall quiz, for each of the three modules
- 📘 Tutorial PDFs as the primary cards (highest exam yield)
- 📚 Inline diagram summaries and source slides (every `.pptx`/`.docx` auto-converted to PDF and embedded)
- 🎥 Blockchain video lectures (8 clips) playing inline in a modal
- ✅ Per-resource checkboxes with progress saved to browser `localStorage`
- 🌙 Dark dashboard layout (CSS grid)

## Live site

Once GitHub Pages is enabled it will be served at:
`https://<username>.github.io/<repo>/`

## Running locally

If you have Python:

```
python -m http.server 8000
```

Then open `http://localhost:8000`.

Or just double-click `start_server.bat` on Windows.

## Folder layout

```
CS496 Slides/           # Original .pptx / .docx decks
_pdf/                   # PDF versions of every deck (auto-generated)
_guides/                # Ultimate Revision Guides (markdown + viewer)
Sum from slides/        # Inline-diagram summary PDFs
tutorial soltion with explantion/   # Solved tutorial PDFs
Block Chain Videos/     # MP4 lectures
index.html              # The portal
```
