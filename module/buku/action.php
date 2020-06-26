<?php

    include_once("../../function/helper.php");
    include_once("../../function/koneksi.php");

    admin_only("buku", $level);

    $user_id = isset($_GET['user_id']) ? $_GET['user_id'] : false;
    
    $judul_buku = $_POST['judul_buku'];
    $kategori_id = $_POST['kategori_id'];
    $deskripsi = $_POST['deskripsi'];
    $stok = $_POST['stok'];
    $rekening = $_POST['rekening'];
    $harga = $_POST['harga'];
    $status = $_POST['status'];
    $button = $_POST['button'];
    $update_gambar = "";

    if(!empty($_FILES["file"]["name"])){
        $nama_file = $_FILES["file"]["name"];
        move_uploaded_file($_FILES["file"]["tmp_name"], "../../images/buku/".$nama_file);

        $update_gambar = ", gambar='$nama_file'";
    }

    if($button == 'Add'){
        mysqli_query($koneksi, "INSERT INTO buku (judul_buku, user_id, kategori_id, deskripsi, gambar, harga, stok, rekening, status) 
                                            VALUES ('$judul_buku','$user_id','$kategori_id','$deskripsi','$nama_file','$harga','$stok','$rekening','$status')");
    }
    else if($button == 'Update'){

        $buku_id = $_GET['buku_id'];

        mysqli_query($koneksi, "UPDATE buku SET user_id='$user_id',
                                                kategori_id='$kategori_id',
                                                judul_buku='$judul_buku',
                                                deskripsi='$deskripsi',
                                                harga='$harga',
                                                stok='$stok',
                                                rekening='$rekening',
                                                status='$status' 
                                                $update_gambar WHERE buku_id='$buku_id'");
    }

    header("location: " .BASE_URL. "index.php?page=my_profile&module=buku&action=list");

?>