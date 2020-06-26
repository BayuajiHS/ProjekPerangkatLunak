<?php

    $buku_id = isset($_GET['buku_id']) ? $_GET['buku_id'] : false;
    $user_id = isset($_GET['user_id']) ? $_GET['user_id'] : false;

    $judul_buku = "";

    $kategori_id = "";
    $deskripsi = "";
    $gambar = "";
    $stok = "";
    $harga = "";
    $rekening = "";
    $keterangan_gambar = "";
    $status = "off";
    $button = "Add";

    if($buku_id){
        $queryKategori = mysqli_query($koneksi, "SELECT * FROM buku WHERE buku_id='$buku_id'");
        $row = mysqli_fetch_assoc($queryKategori);

        $user_id = $row['user_id'];
        $judul_buku = $row['judul_buku'];
        $kategori_id = $row['kategori_id'];
        $deskripsi = $row['deskripsi'];
        $gambar = $row['gambar'];
        $stok = $row['stok'];
        $harga = $row['harga'];
        $rekening = $row['rekening'];
        $status = $row['status'];
        $button = "Update";

        $keterangan_gambar = "(Klik pilih file jika ingin mengganti gambar)";
        $gambar = "<img src='".BASE_URL."images/buku/$gambar' style='width: 200px; vertical-align: middle;'/>";
    }

?>

<script src="<?php echo BASE_URL."js/ckeditor/ckeditor.js"; ?>"></script>

<form action= "<?php echo BASE_URL."module/buku/action.php?buku_id=$buku_id&user_id=$user_id"; ?>" method="POST" enctype="multipart/form-data">

        <div class="element-form">
            <label>Kategori:</label>
            <span>

                <select name="kategori_id">
                    <?php 
                        $query = mysqli_query($koneksi, "SELECT kategori_id,kategori FROM kategori WHERE status='on' ORDER by kategori ASC");
                        while($row=mysqli_fetch_assoc($query)){
                            if($kategori_id==$row['kategori_id']){
                                echo "<option value='$row[kategori_id]' selected='true'>$row[kategori]</option>";
                            }else{
                                echo "<option value='$row[kategori_id]'>$row[kategori]</option>";
                            }
                            
                        }
                    ?>
                </select>

            </span>
        </div>

        <div class="element-form">
            <label>User Id:</label>
            <span><input type="text" name="user_id" disabled value="<?php echo $user_id; ?>"/></span>
        </div>
        <div class="element-form">
            <label>Judul Buku:</label>
            <span><input type="text" name="judul_buku" value="<?php echo $judul_buku; ?>"/></span>
        </div>
        
        <div style="margin-bottom: 10px; ">
            <label style="font-weight: bold; color: #1e5474;">Deskripsi:</label>
            <span><textarea name="deskripsi" id="editor"><?php echo $deskripsi; ?></textarea></span>
        </div>

        <div class="element-form">
            <label>Stok Barang:</label>
            <span><input type="text" name="stok" value="<?php echo $stok; ?>"/></span>
        </div>

        <div class="element-form">
            <label>Harga:</label>
            <span><input type="text" name="harga" value="<?php echo $harga; ?>"/></span>
        </div>

        <div class="element-form">
            <label>Gambar Produk: <?php echo $keterangan_gambar; ?></label>
            <label style="font-weight: bold; color: red;">*(Simpan Gambar dalam format JPG/PNG dengan WIDTH: 500px dan HEIGHT: 316px)</label>
            <br>
            <span>
                <input type="file" name="file" class="tombol-action"/><?php echo $gambar;?>
            </span>
        </div>

        <?php 
            if($level == 'superadmin'){
        ?>
        <div class="element-form">
            <label>Status:</label>
            <span>
                <input type="radio" name="status" value="on" <?php if($status == "on"){echo "checked='true'"; } ?> />On
                <input type="radio" name="status" value="off" <?php if($status == "off"){echo "checked='true'"; } ?> />Off
            </span>
        </div>
        <?php 
            }
        ?>
        <div class="element-form">
            <label>No Rekening:</label>
            <span><input type="text" name="rekening" value="<?php echo $rekening; ?>"/></span>
        </div>
        <div class="element-form">
            <span><input type="submit" name="button" value="<?php echo $button; ?>" /></span>
        </div>


</form>

<script>
    CKEDITOR.replace("editor");
</script>