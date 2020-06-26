<?php

    $pesanan_id = $_GET["pesanan_id"];

    $query = mysqli_query($koneksi, "SELECT pesanan.pesanan_id, pesanan.nama_penerima, pesanan.nomor_telepon, pesanan.alamat, pesanan.tanggal_pemesanan, user.nama, kurir.kurir, kurir.tarif_kurir, tambahan.lama_pinjam, tambahan.tarif_pinjam 
    FROM pesanan JOIN user ON pesanan.user_id = user.user_id JOIN kurir ON pesanan.kurir_id = kurir.kurir_id JOIN tambahan ON pesanan.pinjam_id = tambahan.pinjam_id WHERE pesanan.pesanan_id='$pesanan_id'");

    $row = mysqli_fetch_assoc($query);

    $tanggal_pemesanan = $row['tanggal_pemesanan'];
    $nama_penerima = $row['nama_penerima'];
    $nomor_telepon = $row['nomor_telepon'];
    $alamat = $row['alamat'];
    $tarif_kurir = $row['tarif_kurir'];
    $lama_pinjam = $row['lama_pinjam'];
    $tarif_pinjam = $row['tarif_pinjam'];
    $nama = $row['nama'];
    $kurir = $row['kurir'];

?>

<div id="frame-faktur">
    <h3><center>Detail Pesanan</center></h3>

    <hr/>

    <table>
        <tr>
            <td>Nomor Faktur</td>
            <td>:</td>
            <td><?php echo $pesanan_id; ?></td>
        </tr>
        <tr>
            <td>Nomor Pemesan</td>
            <td>:</td>
            <td><?php echo $nama; ?></td>
        </tr>
        <tr>
            <td>Nama Penerima</td>
            <td>:</td>
            <td><?php echo $nama_penerima; ?></td>
        </tr>
        <tr>
            <td>Alamat</td>
            <td>:</td>
            <td><?php echo $alamat; ?></td>
        </tr>
        <tr>
            <td>Nomor Telepon</td>
            <td>:</td>
            <td><?php echo $nomor_telepon; ?></td>
        </tr>
        <tr>
            <td>Tanggal Pemesanan</td>
            <td>:</td>
            <td><?php echo $tanggal_pemesanan; ?></td>
        </tr>
    </table>
</div>

    <table class="table-list">
        <tr class="baris-title">
            <th class="no">No</th>
            <th class="kiri">Judul Buku</th>
            <th class="tengah">Qty</th>
            <th class="kanan">Harga Satuan</th>
            <th class="kanan">Total</th>
        </tr>

        <?php
            $queryDetail = mysqli_query($koneksi, "SELECT pesanan_detail.*, buku.judul_buku FROM pesanan_detail JOIN buku ON pesanan_detail.buku_id=buku.buku_id WHERE pesanan_detail.pesanan_id='$pesanan_id'");

            $no = 1;
            $subtotal = 0;
            while($rowDetail=mysqli_fetch_assoc($queryDetail)){

                $total = $rowDetail["harga"] * $rowDetail["quantity"];
                $subtotal = $subtotal + $total;

                echo "<tr>
                        <td class='no'>$no</td>
                        <td class='kiri'>$rowDetail[judul_buku]</td>
                        <td class='tengah'>$rowDetail[quantity]</td>
                        <td class='kanan'>".rupiah($rowDetail['harga'])."</td>
                        <td class='kanan'>".rupiah($total)."</td>
                     </tr>";

                $no++;
            }

            $subtotal = $subtotal + $tarif_kurir +$tarif_pinjam;
        ?>
        <tr>
            <td class="kanan" colspan="4">Biaya Kurir <b style="color: red;"><i>(<?php echo $kurir; ?>)</i></b></td>
            <td class="kanan"><?php echo rupiah($tarif_kurir); ?></td>
        </tr>
        <tr>
            <td class="kanan" colspan="4">Biaya Lama Pinjam <b style="color: red;"><i>(<?php echo $lama_pinjam; ?>)</i></b></td>
            <td class="kanan"><?php echo rupiah($tarif_pinjam); ?></td>
        </tr>
        <tr>
            <td class="kanan" colspan="4"><b>Sub Total</b></td>
            <td class="kanan"><b><?php echo rupiah($subtotal); ?></b></td>
        </tr>
    </table>
    
    <div id="frame-keterangan-pembayaran">
        <p>
            Silahkan melakukan pembayaran melalui Bank BCA.<br>
            Nomor Account : <b>1111-2222-3333-4444 (A/N Pbook).</b><br>
            Setelah melakukan pembayaran silahkan lakukan konfirmasi pembayaran
            <a href="<?php echo BASE_URL."index.php?page=my_profile&module=pesanan&action=konfirmasi_pembayaran&pesanan_id=$pesanan_id"?>">Disini</a>
        </p>
    </div>