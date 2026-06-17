#!/usr/bin/env python3
import sys
import os
import re
import argparse

def parse_args():
    parser = argparse.ArgumentParser(description="Mendeteksi dan memformat angka catatan kaki polos menjadi tag <sup> di file Markdown.")
    subparsers = parser.add_subparsers(dest="command", required=True)

    format_parser = subparsers.add_parser("format", help="Memformat file Markdown langsung.")
    format_parser.add_argument("file_path", help="Jalur ke file Markdown yang akan diformat.")
    format_parser.add_argument("--dry-run", action="store_true", help="Hanya jalankan simulasi dan tampilkan hasil perubahan tanpa menyimpan.")

    return parser.parse_args()

def find_max_footnote(lines):
    # Cari judul referensi
    ref_header_pat = re.compile(r'^\s*#+\s*(?:\*\*|__)?\s*(works\s+cited|referensi|daftar\s+pustaka)\b', re.IGNORECASE)
    ref_idx = -1
    
    for idx, line in enumerate(lines):
        if ref_header_pat.search(line):
            ref_idx = idx
            break
            
    if ref_idx == -1:
        print("Warning: Judul bagian referensi/daftar pustaka tidak ditemukan. Batas guardrails N di-set ke default 100.", file=sys.stderr)
        return 100, len(lines)
        
    # Cari rujukan bernomor di bawah judul referensi
    ref_num_pat = re.compile(r'^\s*(?:\*\*|__)?\s*\[?(\d+)\]?\s*\.\s')
    numbers = []
    
    for line in lines[ref_idx:]:
        match = ref_num_pat.search(line)
        if match:
            numbers.append(int(match.group(1)))
            
    if not numbers:
        print(f"Warning: Bagian referensi ditemukan pada baris {ref_idx + 1}, tetapi tidak ada nomor rujukan terdeteksi. Batas guardrails N di-set ke default 100.", file=sys.stderr)
        return 100, ref_idx
        
    max_ref = max(numbers)
    return max_ref, ref_idx

def process_file(file_path, dry_run=False):
    if not os.path.exists(file_path):
        print(f"Error: File '{file_path}' tidak ditemukan.", file=sys.stderr)
        sys.exit(1)
        
    with open(file_path, 'r', encoding='utf-8') as f:
        content = f.read()
        
    lines = content.splitlines()
    N, ref_start_idx = find_max_footnote(lines)
    print(f"Batas guardrails rujukan terdeteksi: N = {N}", file=sys.stderr)
    
    # Regex untuk mendeteksi footnote kontekstual
    # Groups:
    # 1-2: kata + angka (modern1)
    # 3-4: ) + angka (ITS)1)
    # 5-6: ] + angka
    # 7-8: * + angka (Study*3)
    # 9-10: persentase + angka (40%40)
    # 11-12: tahun 4 digit + angka (19352)
    footnote_pat = re.compile(
        r'(?<!/)(?:([a-zA-Z]+)(\d+)\b|(\))(\d+)\b|(\])(\d+)\b|(\*)(\d+)\b|(\d+%)(\d+)\b|\b(18\d{2}|19\d{2}|20\d{2})(\d+)\b)'
    )
    
    modified_lines = []
    changes_count = 0
    warnings_count = 0
    
    # Hanya proses baris sebelum bagian referensi
    for line_idx, line in enumerate(lines):
        if line_idx >= ref_start_idx:
            modified_lines.append(line)
            continue
            
        def replacer(match):
            nonlocal changes_count, warnings_count
            g = match.groups()
            prefix = ""
            num_str = ""
            
            if g[0] is not None:
                prefix, num_str = g[0], g[1]
            elif g[2] is not None:
                prefix, num_str = g[2], g[3]
            elif g[4] is not None:
                prefix, num_str = g[4], g[5]
            elif g[6] is not None:
                prefix, num_str = g[6], g[7]
            elif g[8] is not None:
                prefix, num_str = g[8], g[9]
            elif g[10] is not None:
                prefix, num_str = g[10], g[11]
                
            val = int(num_str)
            if 1 <= val <= N:
                changes_count += 1
                return f"{prefix}<sup>{num_str}</sup>"
            else:
                warnings_count += 1
                print(f"Warning [Baris {line_idx + 1}]: Menemukan angka '{num_str}' menempel pada '{prefix}' tetapi di luar batas rujukan 1..N (N={N}). Dilewati.", file=sys.stderr)
                return match.group(0)
                
        new_line = footnote_pat.sub(replacer, line)
        modified_lines.append(new_line)
        
    print(f"Proses selesai. Jumlah perubahan: {changes_count}, Jumlah peringatan: {warnings_count}", file=sys.stderr)
    
    new_content = "\n".join(modified_lines) + ("\n" if content.endswith("\n") else "")
    
    if dry_run:
        print("Simulasi selesai. Tidak ada perubahan yang disimpan.", file=sys.stderr)
    else:
        with open(file_path, 'w', encoding='utf-8') as f:
            f.write(new_content)
        print(f"Berhasil menyimpan perubahan pada: {file_path}", file=sys.stderr)

def main():
    args = parse_args()
    if args.command == "format":
        process_file(args.file_path, dry_run=args.dry_run)

if __name__ == "__main__":
    main()
