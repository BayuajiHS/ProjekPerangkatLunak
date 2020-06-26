<?php
    if($user_id == false){
        $_SESSION["proses_pemesanan"] = true;

        header("location: ".BASE_URL."login.html");
        exit;
    }
?>
<div id="frame-data-pengiriman">
    <h3 class="label-data-pengiriman">Alamat Pengiriman Buku</h3>
    <div id="frame-form-pengiriman">

        <form action="<?php echo BASE_URL."proses_pemesanan.php"; ?>" method="POST">
            <div class="element-form">
                <label>Nama Penerima</label>
                <span><input type="text" name="nama_penerima"/></span>
            </div>
        <div class="element-form">
            <label>Nomor Telepon</label>
            <span><input type="text" name="nomor_telepon"/></span>
        </div>
        <div class="element-form">
            <label>Alamat Pengiriman</label>
            <span><textarea name="alamat"></textarea></span>
        </div>
        <div class="element-form">
                <label>Kurir:</label>
                <span>
                    <select name="kurir">
                        <?php
                            $query = mysqli_query($koneksi, "SELECT * FROM kurir");

                            while($row=mysqli_fetch_assoc($query)){
                                echo "<option value='$row[kurir_id]'>$row[kurir] (".rupiah($row[tarif_kurir]).")</option>";
                            }
                        ?>
                    </select>
                </span>
            </div>

            <div class="element-form">
                <label>Lama Pinjam:</label>
                <span>
                    <select name="lama">
                        <?php
                            $query = mysqli_query($koneksi, "SELECT * FROM tambahan");

                            while($row=mysqli_fetch_assoc($query)){
                                echo "<option value='$row[pinjam_id]'>$row[lama_pinjam] (".rupiah($row[tarif_pinjam]).")</option>";
                            }
                        ?>
                    </select>
                </span>
            </div>

            <div class="element-form">
                <span><input type="submit" value="Submit" /></span>
            </div>

        </form>
    </div>
</div>

<div id="frame-data-detail">
    <h3 class="label-data-pengiriman">Detail Peminjaman</h3>

    <div id="frame-detail-order">
        <table class="table-list">
            <tr>
                <th class="kiri">Judul Buku</th>
                <th class="tengah">Quantity</th>
                <th class="kanan">Total</th>
            </tr>

            <?php
                $subtotal = 0;
                foreach($keranjang AS $key => $value){
                    $buku_id = $key;

                    $judul_buku = $value['judul_buku'];
                    $harga = $value['harga'];
                    $quantity = $value['quantity'];

                    $total = $quantity * $harga;
                    $subtotal = $subtotal + $total;

                    echo "<tr>
                            <td class='kiri'>$judul_buku</td>
                            <td class='tengah'>$quantity</td>
                            <td class='kanan'>".rupiah($total)."</td>
                            </tr>";
                }

                echo "<tr>
                        <td colspan='2' class='kanan'><b>Sub Total</b></td>
                        <td class='kanan'><b>".rupiah($subtotal)."</b></td>
                    </tr>";
            ?>
        </table>
    </div>
</div>