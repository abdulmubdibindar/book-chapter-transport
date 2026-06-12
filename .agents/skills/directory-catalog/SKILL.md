---
name: directory-catalog
description: Maps and summarizes document contents within a directory.
---

# Directory Catalog Maker

## Instructions

1. Map the documents in a directory and summarize them into a single overview document. The overview document format is as follows:
  `@filename.extension` : <summary of the file's content>
2. Buat link dalam tiap nama file dengan mengisikan nama file tersebut ke dalam tanda kurung '()'
   [`@filename.extension`](filename.extension) : <summary of the file's content>

## Rules

- Always use the @ symbol to reference files encapsulated in backticks.



## Examples

```markdown
`01-pembukaan.md`
# Pembukaan Undang-Undang Dasar Negara Republik Indonesia 1945
Bahwa sesungguhnya kemerdekaan ialah hak segala bangsa...

`02-batang-tubuh.md`
# Pasal 1
...
```

The overview file will be:

```markdown
- [`@01-pembukaan.md`](01-pembukaan.md) : teks pembukaan UUD RI 1945
- [`@02-batang-tubuh.md`](02-batang-tubuh.md) : isi batang tubuh UUD RI 1945 berupa pasal-pasal hukum
```
