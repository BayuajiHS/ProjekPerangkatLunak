<div id="kiri">
    <?php
        echo kategori($kategori_id);
    ?>
</div>
<div id="kanan">

    <div id="slides">
        <?php 
            $queryBanner = mysqli_query($koneksi, "SELECT * FROM banner WHERE status='on' ORDER BY banner_id DESC LIMIT 3");
            
            while ($rowBanner=mysqli_fetch_assoc($queryBanner)) {
                echo "<img src='".BASE_URL."images/slide/$rowBanner[gambar]' />";
            }
        ?>
    </div>
    <div id="frame-barang">
        <ul>
            <?php
                if($kategori_id){
                    $kategori_id = "AND buku.kategori_id='$kategori_id'";
                }

                $query = mysqli_query($koneksi, "SELECT buku.*, kategori.kategori FROM buku JOIN kategori ON buku.kategori_id=kategori.kategori_id WHERE buku.status='on' $kategori_id ORDER BY rand() DESC LIMIT 9");

                $no=1;
                while($row=mysqli_fetch_assoc($query)){

                    $kategori = strtolower($row["kategori"]);
                    $buku = strtolower($row["judul_buku"]);
                    $buku = str_replace(" ", "-", $buku);

                    $buku_id = $row["buku_id"];

                    if($row["stok"] <= 0){
                        mysqli_query($koneksi, "UPDATE buku SET status='off' WHERE buku_id='$buku_id'");
                    }

                    $style=false;
                    if($no == 3){
                        $style = "style='margin-right: 0px'";
                        $no=0;
                    }

                    echo "<li $style>
                            <p class='price'>Harga Pinjam : ".rupiah($row['harga'])."</p>
                            <a href='".BASE_URL."$row[buku_id]/$kategori/$buku.html'>
                                <img src='".BASE_URL."images/buku/$row[gambar]' />
                            </a>
                            <div class='keterangan-gambar'>
                                <p><a href='".BASE_URL."$row[buku_id]/$kategori/$buku.html'>$row[judul_buku]</a></p>
                                <span>Stok : $row[stok]</span>
                            </div> 
                            <div class='button-add-cart'>
                                <a href='".BASE_URL."tambah_keranjang.php?buku_id=$row[buku_id]'>+ Add to Cart</a>
                            </div>";
                    
                    $no++;
                }
            ?>
        </ul>
    </div> 
</div>