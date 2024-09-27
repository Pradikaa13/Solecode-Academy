function hitungDenda(tanggalKembali, tanggalPinjam, daftarBuku, batasMaxPinjaman = 14, dendaHarian = 1000) {
    const dendaPerBuku = [];
    
    const tanggalKembaliDate = new Date(tanggalKembali);
    const tanggalPinjamDate = new Date(tanggalPinjam);
    
    const selisihHari = (tanggalKembaliDate - tanggalPinjamDate) / (1000 * 60 * 60 * 24);

    daftarBuku.forEach(buku => {
        let denda = 0;
        
        if (selisihHari > batasMaxPinjaman) {
            const hariTerlambat = selisihHari - batasMaxPinjaman;
            denda = hariTerlambat * dendaHarian;
        }

        dendaPerBuku.push({
            judul: buku.judul,
            denda: denda
        });
    });
    
    return dendaPerBuku;
}

// Contoh penggunaan
const daftarBuku = [
    { id: 1, judul: 'Buku 1' },
    { id: 2, judul: 'Buku 2' },
    { id: 3, judul: 'Buku 3' }
];

const tanggalPinjam = '2024-09-01';
const tanggalKembali = '2024-09-20';
const hasilDenda = hitungDenda(tanggalKembali, tanggalPinjam, daftarBuku);

console.log(hasilDenda);