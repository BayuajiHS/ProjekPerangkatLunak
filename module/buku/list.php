<?php

    $pagination = isset($_GET["pagination"]) ? $_GET["pagination"] : 1;
    $data_per_halaman = 3;
    $mulai_dari = ($pagination-1) * $data_per_halaman;

    $query = mysqli_query($koneksi, "SELECT buku.*, kategori.kategori FROM buku JOIN kategori ON buku.kategori_id=kategori.kategori_id 
                                                                    JOIN user ON buku.user_id=user.user_id WHERE user.level='customer' LIMIT $mulai_dari, $data_per_halaman ");

    if(mysqli_num_rows($query) == 0){
        echo "<h3>Saat ini tidak ada buku di dalam table buku ";
    }
    else
    {
        echo "<table class='table-list'>";

        echo "<tr class='baris-title'>
                <th class='kolom-nomor'>No</th>
                <th class='kiri'>User Id</th>
                <th class='kiri'>Judul Buku</th>
                <th class='kiri'>Kategori</th>
                <th class='kiri'>Harga</th>
                ";

                echo "<th class='kiri'>Rekening</th>";

        echo   
                "<th class='tengah'>Status</th>
                <th class='tengah'>Action</th>
              </tr>";

        $no = 1 + $mulai_dari;
        while($row = mysqli_fetch_assoc($query)){
            echo "<tr>
                    <td class='kolom-nomor'>$no</td>
                    <td class='kiri'>$row[user_id]</td>
                    <td class='kiri'>$row[judul_buku]</td>
                    <td class='kiri'>$row[kategori]</td>
                    <td class='kiri'>".rupiah($row['harga'])."</td>
                    <td class='kiri'>$row[rekening]</td>
                    <td class='tengah'>$row[status]</td>
                    <td class='tengah'>
                        <a class='tombol-action' href= '".BASE_URL."index.php?page=my_profile&module=buku&action=form&buku_id=$row[buku_id]&user_id=$user_id'>Edit</a>
                    </td>";
            $no++;
        }

        echo "</table>";

        $queryHitungBuku = mysqli_query($koneksi, "SELECT buku.*, kategori.kategori FROM buku JOIN kategori ON buku.kategori_id=kategori.kategori_id 
                JOIN user ON buku.user_id=user.user_id WHERE user.level='customer'");
        pagination($queryHitungBuku, $data_per_halaman, $pagination, "index.php?page=my_profile&module=buku&action=list");
    }
?>