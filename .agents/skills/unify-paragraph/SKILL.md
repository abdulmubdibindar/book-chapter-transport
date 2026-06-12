---
name: unify-paragraph
description: Merge multi-line text into a single paragraph
---

# Unify Paragraph

This skill merges separate lines of text into a single, cohesive paragraph.

## How It Works

Identify text blocks separated by single line breaks, then remove the line feeds (LF or CRLF). Stop if the next line is blank, as this marks a new paragraph.
