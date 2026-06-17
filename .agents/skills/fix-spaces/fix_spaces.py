import re
import os

def fix_file(file_path):
    # 1. Baca file dalam mode binary untuk mendeteksi byte aslinya
    with open(file_path, 'rb') as f:
        data = f.read()
    
    # 2. Hapus BOM (Byte Order Mark) jika file awalnya adalah UTF-16
    if data.startswith(b'\xff\xfe') or data.startswith(b'\xfe\xff'):
        data = data[2:]
    
    # 3. Deteksi penyebab spasi:
    # KASUS 1: Apakah spasinya disebabkan oleh karakter Null (\x00)?
    if b'\x00' in data:
        # Hapus semua karakter null
        data = data.replace(b'\x00', b'')
        text = data.decode('utf-8', errors='replace')
        
        # Bersihkan spasi berlebih akibat pemformatan yang tersisa
        lines = text.split('\n')
        new_lines = []
        for line in lines:
            line = re.sub(r'[ \t]{2,}', ' ', line)
            new_lines.append(line.strip())
        final_text = '\n'.join(new_lines)
        
    else:
        # KASUS 2: Teks secara fisik memang menggunakan spasi biasa (' ') di antara huruf
        text = data.decode('utf-8', errors='replace')
        lines = text.split('\n')
        new_lines = []
        for line in lines:
            # Karena spasi antar kata menggunakan lebih dari 1 spasi,
            # dan spasi di dalam kata menggunakan tepat 1 spasi:
            
            # Langkah A: Hapus tepat 1 spasi yang diapit oleh karakter huruf
            # (P e n d a h u l u a n -> Pendahuluan)
            line = re.sub(r'(?<=\S) (?=\S)', '', line)
            
            # Langkah B: Ubah sisa spasi ganda (yang merupakan pemisah kata asli) menjadi 1 spasi
            # (Perencanaan   dan -> Perencanaan dan)
            line = re.sub(r'[ \t]{2,}', ' ', line)
            
            new_lines.append(line.strip())
        final_text = '\n'.join(new_lines)

    # 4. Tulis ulang teks yang sudah bersih kembali ke file asal
    with open(file_path, 'w', encoding='utf-8') as f:
        f.write(final_text)
    
    print(f"Berhasil memperbaiki file: {file_path}")

if __name__ == "__main__":
    script_dir = os.path.dirname(os.path.abspath(__file__))
    target_file = os.path.join(script_dir, '1 Pendahuluan.md')
    fix_file(target_file)
