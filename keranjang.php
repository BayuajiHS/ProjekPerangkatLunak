<?php
    if($total_barang == 0){
        echo "<h3> Saat ini belum ada buku di dalam cart</h3>";
    }else{
        $no = 1;
        echo "<table class='table-list'>
                <tr class='baris-title'>
                    <th class='tengah'>No</th>
                    <th class='kiri'>Image</th>
                    <th class='kiri'>Judul Buku</th>
                    <th class='tengah'>Qty</th>
                    <th class='kanan'>Harga Satuan</th>
                    <th class='kanan'>Total</th>
                </tr>";

        $subtotal = 0;
        foreach($keranjang AS $key => $value){
            $buku_id = $key;

            $judul_buku = $value["judul_buku"];
            $quantity = $value["quantity"];
            $gambar = $value["gambar"];
            $harga = $value["harga"];

            $total = $quantity * $harga;
            $subtotal = $subtotal + $total;
            echo "<tr>
                    <td class='tengah'>$no</td>
                    <td class='kiri'><img src='".BASE_URL."images/buku/$gambar' height='100px' /></td>
                    <td class='kiri'>$judul_buku</td>
                    <td class='tengah'><input type='text' name='$buku_id' value='$quantity' class='update-quantity' /></td>
                    <td class='kanan'>".rupiah($harga)."</td>
                    <td class='kanan hapus_item'>".rupiah($total)." <a href='".BASE_URL."hapus_item.php?buku_id=$buku_id'>X</a></td>
                  </tr>";
            $no++;
        }

        echo "<tr>
                <td colspan='5' class='kanan'><b>Sub Total</b></td>
                <td class='kanan'><b>".rupiah($subtotal)."</b></td>
             </tr>";

        echo "</table>";

        echo "<div id='frame-button-keranjang'>
                <a id='lanjut-belanja' href='".BASE_URL."index.php'> < Lanjut Pinjam Buku</a>
                <a id='lanjut-pemesanan' href='".BASE_URL."data_pemesan.html'> Lanjut Pemesanan > </a>
            </div>";

    }
?>

<script>
    $(".update-quantity").on("input", function(e){
        var buku_id = $(this).attr("name");
        var value = $(this).val();

        $.ajax({
            method: "POST",
            url: "update_keranjang.php",
            data: "buku_id="+buku_id+"&value="+value
        })
        .done(function(data){
            var json = $.parseJSON(data);
            if(json.status == true){
                location.reload();
            }else{
                alert(json.pesan);
                location.reload();
            }
        });
        
    });
</script>