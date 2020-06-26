
<div id="frame-tambah">
    <a href="<?php echo BASE_URL."index.php?page=my_profile&module=admin&action=form&user_id=$user_id"; ?>" class="tombol-action">+ Tambah Buku</a>
</div>

<?php
    $queryBuku = mysqli_query($koneksi, "SELECT buku.*, kategori.kategori FROM buku JOIN kategori ON buku.kategori_id=kategori.kategori_id 
                                                                                    JOIN user ON buku.user_id=user.user_id WHERE buku.user_id=$user_id ");

    if(mysqli_num_rows($queryBuku) == 0){
        echo "<h3> Saat ini belum ada buku yang anda pasarkan</h3>";
    }else{
        echo "<table class='table-list'>";

        echo "<tr class='baris-title'>
                <th class='kolom-nomor'>No</th>
                <th class='kiri'>Judul Buku</th>
                <th class='kiri'>Kategori</th>
                <th class='kiri'>Harga</th>";
                if($level == 'customer'){
                    echo "<th class='kiri'>Rekening</th>";
                }
        echo
                "<th class='tengah'>Status</th>
                <th class='tengah'>Action</th>
             </tr>";
        
        $no=1;
        while($row=mysqli_fetch_assoc($queryBuku)){
            
            echo "<tr>
                    <td class='kolom-nomor'>$no</td>
                    <td class='kiri'>$row[judul_buku]</td>
                    <td class='kiri'>$row[kategori]</td>
                    <td class='kiri'>".rupiah($row['harga'])."</td>";
                    if($level == 'customer'){
                        echo "<td class='kiri'>$row[rekening]</td>";
                    }
            echo
                    "<td class='tengah'>$row[status]</td>
                    <td class='tengah'>
                        <a href='".BASE_URL."index.php?page=my_profile&module=admin&action=form&buku_id=$row[buku_id]&user_id=$row[user_id]' class='tombol-action'>Edit</a>
                    </td>
                 </tr>";

                 $no++;
        }
        echo "</table>";
    }
?>